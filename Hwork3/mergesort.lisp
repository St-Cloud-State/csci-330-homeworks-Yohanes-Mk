;;; Bottom-Up Mergesort Implementation in Lisp
;;; This program sorts a list using a bottom-up approach to mergesort.

(defun pairwise-sort (lst)
  "Partition the list into sorted pairs."
  (if (null lst) 
      nil
      (let ((first (car lst))
            (rest (cdr lst)))
        (if (null rest)
            ;; If only one element remains, return it as a single-item list
            (list (list first))
            ;; Otherwise, sort the pair and recursively process the rest
            (cons (sort (list first (car rest)) #'<)  
                  (pairwise-sort (cdr rest)))))))  

(defun merge-sorted (list1 list2)
  "Merge two sorted lists into a single sorted list."
  (cond 
    ;; If one list is empty, return the other
    ((null list1) list2)
    ((null list2) list1)
    ;; Compare first elements and recursively merge the rest
    ((< (car list1) (car list2))
     (cons (car list1) (merge-sorted (cdr list1) list2)))
    (t
     (cons (car list2) (merge-sorted list1 (cdr list2))))))

(defun merge-pass (sublists)
  "Merge adjacent sublists in one pass."
  (if (null sublists)
      nil
      (if (null (cdr sublists))
          sublists  ;; If only one sublist remains, return it
          ;; Merge adjacent pairs and continue recursively
          (cons (merge-sorted (car sublists) (cadr sublists))
                (merge-pass (cddr sublists))))))

(defun bottom-up-mergesort (lst)
  "Perform bottom-up mergesort on the input list."
  ;; Step 1: Partition the list into sorted pairs
  (let ((sublists (pairwise-sort lst)))  
    ;; Step 2: Keep merging until only one sorted list remains
    (loop while (> (length sublists) 1) do
      (setf sublists (merge-pass sublists)))  
    ;; Step 3: Return the final sorted list
    (car sublists)))  

;; Testing the function
(print (bottom-up-mergesort '(1 7 2 1 8 6 5 3 7 9 4)))
