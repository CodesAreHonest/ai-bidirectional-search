;;----------------------------------------
;; Function: Check Goal 
;;----------------------------------------
;; Description: 
;; 1. Check if input node == Goal(Iasi)
;;	  If Yes, return T
;;    Else return NIL
;;----------------------------------------
;; Input: Node (eg. Arad)
;; Output: T, NIL
;;----------------------------------------
;; Written by: Chong Hoe Ren  
;;----------------------------------------

(defun check-goal(element)
  (if (equal element 'Iasi)
      (return-from check-goal T) 
    (return-from check-goal NIL)))