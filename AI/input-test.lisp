;;; -------------------------------------------------------------------------------
;;; Function: Obtain input from user for 
;;;           - using BFS or DFS 
;;;           - sort with ascending or descending order
;;; -------------------------------------------------------------------------------
;;; Description: 
;;;     1. User select bfs will proceed to 3. 
;;;     2. User select dfs will required to insert forbidden city and proceed to 3. 
;;;     3. User able to select ascending or descending order. 
;;; -------------------------------------------------------------------------------
;;; Written by: Zhi Qing Kin 
;;; -------------------------------------------------------------------------------


(defun getinput()
  (format t "Select bfs or dfs algorithm (case-sensitive): ")
  (setq gettype(read))
  (cond ((string-equal gettype "dfs") 
         (progn
           (format t "forbidden city 1: ")
           (setq for1(read))
           (format t "forbidden city 2: ")
           (setq for2(read))
           (format t "forbidden city one: ~A  forbidden city two: ~A%" for1 for2)))
        ((string-equal gettype "bfs") (format t "You had chosen ~A .%" gettype))
        (t (format t "wrong input")))
  
  (format t "Ascending or Descending (asc/dsc): ")
  (setq getacc(read))
  (cond ((string-equal getacc "asc") (print "The algorithm will run in ascending order. "))
        ((string-equal getacc "dsc") (print "The algorithm will run in descending order. "))
        (t (format t "wrong input"))
  ))

