;;; ----------------------------------------
;;; Function: Get Position of Parent in map
;;; ----------------------------------------
;;; Description: 
;;; 1. For (x = 1 to 20)
;;;    If map(x,0) equal to input-node
;;;       return x
;;;
;;; 2. map(x,0) = Parent row in map
;;; ----------------------------------------
;;; Input: Node (eg. Arad)
;;; Output: x type:number
;;; ----------------------------------------
;;; Written by: Chong Hoe Ren  
;;; ----------------------------------------

(defun get-parent(element)
  (loop for x from 1 to 20
        if(equal (aref map x 0) element)
        do(return-from get-parent x)))