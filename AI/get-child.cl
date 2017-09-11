;;----------------------------------------------------------------
;; Function: Get Child Node
;;----------------------------------------------------------------
;; Description: 
;; 1. For (y = 1 to 20)
;;    If map(x,y) not equal to NIL
;;    (Cons) map(0,y) into result list
;; 2. (x) = input, parent row
;; 3. (y) = child row
;; 4. (x,y) = path cost, type: number
;; 5. (0,y) = child, type: string (eg. Arad)
;;----------------------------------------------------------------
;; Input: x, type: number (1-20)
;; Output: list of child node (eg. [Timisoara, Sibiu, Zerind])
;;----------------------------------------------------------------
;; Written by: Chong Hoe Ren  
;;----------------------------------------------------------------

(defun get-child(x)
  (loop for y from 1 to 20
        if(not (equal (aref map x y) NIL))
      collect (aref map 0 y)))
  