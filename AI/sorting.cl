;;; ------------------------------------------------------------------
;;; Function: Sort Child List
;;; ------------------------------------------------------------------
;;; Description: 
;;; 1. set x as axis of parent
;;; 2. set list 'result to copy sorted child node
;;; 3. if 'Accending, sort input list to descending
;;;    Else, sort input list to ascending
;;;    #because cons insert in front of list, so it has to be opposite
;;; 4. dolist loop:
;;;    	set element as first number of sorted list 'a
;;;		search for same number in map, cons to list 'result
;;;		remove first number of list 'a
;;; ------------------------------------------------------------------
;;; Input: list of number (eg. 75 140 118)
;;; Output: list of sorted child node
;;; ------------------------------------------------------------------
;;; Written by: Chong Hoe Ren 
;;; ------------------------------------------------------------------

(defun sorting(list)
  (setf x (get-parent (get-current)))
  (setf result (list))
  (if (string-equal getacc 'asc)
      (setf a (sort list '>))
    (setf a (sort list '<)))
		
  
  (dolist (n a)
    (setf element (car a))
    (loop for y from 1 to 20
          if (equal (aref map x y) element) ;; error
          (cons (aref map x 0) result))
    (setf a (cdr a)))
  (return-from sorting result))
