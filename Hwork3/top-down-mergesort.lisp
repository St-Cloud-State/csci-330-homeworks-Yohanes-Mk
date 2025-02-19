(defun split-alternate (lst odd even)
  "Splits the list into two sublists by alternating elements."
  (cond
    ((null lst) (list odd even))  ;; Base case: return the two sublists
    ((null (cdr lst)) (list (cons (car lst) odd) even))  ;; If one element remains, add to odd list
    (t (split-alternate (cddr lst) 
                        (cons (car lst) odd) 
                        (cons (cadr lst) even)))))  ;; Recursive case

(defun merge-sorted-lists (l1 l2)
  "Merges two sorted lists into a single sorted list."
  (cond
    ((null l1) l2)
    ((null l2) l1)
    ((< (car l1) (car l2)) (cons (car l1) (merge-sorted-lists (cdr l1) l2)))
    (t (cons (car l2) (merge-sorted-lists l1 (cdr l2))))))

(defun top-down-mergesort (lst)
  "Recursively sorts the list using top-down mergesort."
  (if (or (null lst) (null (cdr lst)))
      lst  ;; Base case: a list with 0 or 1 element is already sorted
      (let* ((split (split-alternate lst '() '()))  ;; Split list into two alternating halves
             (left (top-down-mergesort (car split)))  ;; Recursively sort left half
             (right (top-down-mergesort (cadr split))))  ;; Recursively sort right half
        (merge-sorted-lists left right))))  ;; Merge sorted halves

;; Testing the function with various cases
(format t "Top-Down Mergesort (Unsorted List): ~a~%" (top-down-mergesort '(7 2 5 1 9 6 3)))
