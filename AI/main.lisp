;;-------------------------------------------------------------------------------------------------
;; Function: Main
;;-------------------------------------------------------------------------------------------------
;; Description: 
;; 1. Call (preload), (make-open-list), (make-close-list) in openclose.lisp
;; 2. Insert "Arad" into Open-list
;; 3. gettype = type of search algo (BFS/DFS), from inputtest.lisp
;; 4. If gettype = "DFS"
;;    Insert forbidden city (for1, for2) into close-list
;; 
;; 5. When (check-end) = NIL (means Goal not found, Open-list not empty)
;;    Do 
;;       i. get-current, input = NOTHING, output = Node(eg. Arad) or NIL(open-list is empty)
;;       ii. get-parent, input = Node(eg. Arad), output = x(type: number)
;;       iii. get-child, input = x(type: number, 1-20), output = List of Child Node(eg. [Timisoara, Sibiu, Zerind])
;;       iv. check-duplicate, input = list of node, output = insert Child-node into Open-list, 
;;                                                           remove Parent-node from Open-list,
;;                                                           insert Parent-node into Close-list
;;-------------------------------------------------------------------------------------------------
;; Written by: Chong Hoe Ren and Zhi Qing Kin
;;-------------------------------------------------------------------------------------------------


(defun main()
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/input-test.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/input-test.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-duplicate.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-duplicate.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-end.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-end.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-goal.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/check-goal.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-child.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-child.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-current.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-current.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-parent.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/get-parent.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/map.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/map.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/openclose.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI/openclose.fasl")
  
  (preload)
  (getinput)
  (make-open-list 'Arad)
  (make-close-list)
  (when (string-equal gettype "dfs")
    (progn
      (insert-front-close for1)
      (insert-front-close for2)))
  
;;======================
;;Ascending / Descending
;;======================
  
  (loop 
    (check-duplicate (get-child (get-parent (get-current))))
    (setf result (check-end))
    (when (not (equal result NIL))(return result))))