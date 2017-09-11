;;----------------------------------------------------------------
;; Function: Get Current Node 
;;----------------------------------------------------------------
;; Description: 
;; 1. Get Current Node, which is Parent
;; 2. If SearchType = BFS, return first node in Open-list
;; 3. If SearchType = DFS, return last node in Open-list
;; 4. If length of Open-list > 0
;;       return first/last node in Open-list
;;    Else return NIL (means Open-list is empty, Goal not found)
;;----------------------------------------------------------------
;; Written by: Chong Hoe Ren  
;;----------------------------------------------------------------


(defun get-current()
  (if (> (open-list-length) 0)
      (progn
        (if (string-equal gettype 'BFS)
            (setf current (car (open-list open)))
          (setf current (car (reverse (open-list open)))))
        (return-from get-current current)))
  (return-from get-current NIL))