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
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/input-test.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/input-test.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-duplicate.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-duplicate.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-end.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-end.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-goal.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/check-goal.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-child.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-child.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-current.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-current.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-parent.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/get-parent.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/map.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/map.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/openclose.lisp" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/openclose.fasl")
   (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/tempmap.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/tempmap.fasl")
  (compile-file "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/setparent.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/setparent.fasl")
  (compile-file "C:/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/printpath.cl" :load t)
  (load "/Users/Lim/Documents/gitRepo/ai-bidirectional-search/AI-final/printpath.fasl")
  (setf pathcost -1)
  (setf totalnode 1)
  (preload)
  (getinput)
  (make-open-list 'Arad)
  (make-close-list)
  (when (string-equal gettype "dfs")
    (progn
      (insert-front-close for1)
      (insert-front-close for2)))
  
  (loop 
    (check-duplicate (get-child (get-parent (get-current))))
    (setf result (check-end))
    (when (not (equal result NIL))(return result)))
  (format t "~%")
  (printpath result)
  (format t "~% Pathcost = ~A" pathcost)
  (format t "~% Total Node = ~A" totalnode))
   