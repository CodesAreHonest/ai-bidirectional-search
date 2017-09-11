;;----------------------------------------
;;Function: Check Duplicate
;;----------------------------------------
;;Description: 
;; 1. Check if element to be inserted into Open-list is already in Close-list
;; 2. Check if element to be inserted into Open-list is already in Open-list
;; 3. Remove current(Parent) from Open, and insert it into Close-list
;;----------------------------------------

(defun check-duplicate(list)
	(setf parent (get-current))
	(dolist (n list)
   (setf element (car list))
   (print element)
		(if (eq (find-elements-close element) NIL)
		(insert-back-open element))
		(setf list (cdr list)))
	
	(remove-element-open parent)
	(insert-back-close parent))
