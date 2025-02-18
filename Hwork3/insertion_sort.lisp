;;; Implementation of Insertion Sort in Lisp

(defun insert-into-sorted (item sorted)
  "Insert an item into a sorted list in ascending order."
  (if (or (null sorted) (< item (car sorted)))
      (cons item sorted)  ;; Insert item at the beginning if sorted list is empty or item is smaller
      (cons (car sorted) (insert-into-sorted item (cdr sorted))))) ;; Recursively find the correct place

(defun insertion-sort-helper (sorted unsorted)
  "Helper function that recursively moves items from unsorted to sorted list."
  (if (null unsorted)
      sorted  ;; Base case: If no unsorted items remain, return the sorted list
      (insertion-sort-helper 
        (insert-into-sorted (car unsorted) sorted)  ;; Insert first unsorted item into sorted list
        (cdr unsorted))))  ;; Continue with the remaining unsorted items

(defun insertion-sort (lst)
  "Main function to perform insertion sort on a list."
  (insertion-sort-helper nil lst)) ;; Start with an empty sorted list and full unsorted list

;; Testing the function
(print (insertion-sort '(5 3 8 1 4 2 7 6)))

