(setf romanian-holiday (make-hash-table))
(setf (gethash 'Arad romanian-holiday) '(Timisoara Sibiu Zerind))
(setf (gethash 'Zerind romanian-holiday) '(Arad Oradea))
(setf (gethash 'Oradea romanian-holiday) '(Sibiu Zerind))
(setf (gethash 'Timisoara romanian-holiday) '(Arad Lugoj))
(setf (gethash 'Lugoj romanian-holiday) '(Timisoara Mehadia))
(setf (gethash 'Mehadia romanian-holiday) '(Lugoj Dobreta))
(setf (gethash 'Dobreta romanian-holiday) '(Mehadia Craiova))
(setf (gethash 'Craiova romanian-holiday) '(Dobreta Pitesti Rimnicu_Vilcea))
(setf (gethash 'Rimnicu_Vilcea romanian-holiday) '(Sibiu Craiova Pitesti))
(setf (gethash 'Sibiu romanian-holiday) '(Oradea Arad Fagaras Rimnicu_Vilcea))
(setf (gethash 'Pitesti romanian-holiday) '(Rimnicu_Vilcea Craiova Bucharest))
(setf (gethash 'Fagaras romanian-holiday) '(Bucharest Sibiu))
(setf (gethash 'Bucharest romanian-holiday) '(Pitesti Fagaras Giurgiu Urziceni))
(setf (gethash 'Giurgiu romanian-holiday) '(Bucharest))
(setf (gethash 'Urziceni romanian-holiday) '(Bucharest Hirsova Vaslui))
(setf (gethash 'Hirsova romanian-holiday) '(Eforie Urziceni))
(setf (gethash 'Eforie romanian-holiday) '(Hirsova))
(setf (gethash 'Vaslui romanian-holiday) '(Urziceni Lasi))
(setf (gethash 'Lasi romanian-holiday) '(Vaslui Neamt))
(setf (gethash 'Neamt romanian-holiday) '(Lasi)) 

(defun alphabetical-sort (seq order)
  (setf temp seq)
  (if (equal order 'ASC)
      (sort temp #'STRING<)
      (sort temp #'STRING>))
  )

(defun BFS (graph start goal sort_order)
  (setf open-list (list start))
  (setf closed-list '())
  (loop
    (setf current (car open-list))
    (if (equal current goal) (return "Path found"))
    
    (setf closed-list (append closed-list (list current)))
    (setf open-list 
      (cdr 
       (append open-list 
               (alphabetical-sort 
                (remove-if 
                 #'(lambda (x) (or (member x open-list) (member x closed-list)) ) (gethash current graph)) sort_order)
               )))
    (print open-list)
    (when (null open-list) (return "No path found"))
    )
  )

(defun bidirectional-BFS (graph start goal sort_order)
  (setf open-list-left (list start))
  (setf open-list-right (list goal))
  (setf closed-list-left '())
  (setf closed-list-right '())
  (setf tree-left (make-hash-table))
  (setf tree-right (make-hash-table))
  (setf (gethash start tree-left) nil)
  (setf (gethash goal tree-right) nil)
  (loop
    (setf current-left (car open-list-left))
    (if (member current-left closed-list-right) 
        (return (construct-path current-left tree-left tree-right)))
    
    (setf closed-list-left (append closed-list-left (list current-left)))
	(setf expanded (alphabetical-sort 
                (remove-if 
                 #'(lambda (x) (or (member x open-list-left) (member x closed-list-left)) ) (gethash current-left graph)) sort_order))
    (setf open-list-left
      (cdr 
       (append open-list-left expanded )))
    (dolist (n expanded)
    	(setf (gethash n tree-left) current-left))


    (setf current-right (car open-list-right))
    (if (member current-right closed-list-left) 
    (return (construct-path current-right tree-left tree-right)))
    
    (setf closed-list-right (append closed-list-right (list current-right)))
	(setf expanded (alphabetical-sort 
                (remove-if 
                 #'(lambda (x) (or (member x open-list-right) (member x closed-list-right)) ) (gethash current-right graph)) sort_order))
    (setf open-list-right
      (cdr 
       (append open-list-right expanded )))
    (dolist (n expanded)
    	(setf (gethash n tree-right) current-right))
    (when (and (null open-list-left) (null open-list-right)) (return "No path found"))
    )
  )

(defun bidirectional-DFS (graph start goal sort_order forbidden_cities)
  (setf open-list-left (list start))
  (setf open-list-right (list goal))
  (setf closed-list-left '())
  (setf closed-list-right '())
  (setf tree-left (make-hash-table))
  (setf tree-right (make-hash-table))
  (setf (gethash start tree-left) nil)
  (setf (gethash goal tree-right) nil)
  (loop
    (setf current-left (car open-list-left))
    (if (member current-left closed-list-right) 
        (return (construct-path current-left tree-left tree-right))
        )
    
    (setf closed-list-left (append closed-list-left (list current-left)))
    (setf expanded (alphabetical-sort 
                      (remove-if #'(lambda (x) (or (member x open-list-left) (or (member x forbidden_cities) (member x closed-list-left)))) (gethash current-left graph)) sort_order) )
    (setf open-list-left (append expanded (cdr open-list-left) ))
    (dolist (n expanded)
    	(setf (gethash n tree-left) current-left))


    (setf current-right (car open-list-right))
    (if (member current-right closed-list-left) 
        (return (construct-path current-right tree-left tree-right)))
    
    (setf closed-list-right (append closed-list-right (list current-right)))
    (setf expanded (alphabetical-sort 
                      (remove-if #'(lambda (x) (or (member x open-list-right) (or (member x forbidden_cities) (member x closed-list-right)))) (gethash current-right graph)) sort_order) )
    (setf open-list-right (append expanded (cdr open-list-right) ))
    (dolist (n expanded)
    	(setf (gethash n tree-right) current-right))
    (when (and (null open-list-left) (null open-list-right)) (return "No path found"))
    )
  )


(defun construct-path (key tree1 tree2)
	(format t "Intersect at city ~S~%" key)
	(setf path-1 (list key))
	(setf path-2 '())
	(setf temp key)
	(loop
		(when (null (gethash temp tree1)) (return))
		(push (gethash temp tree1) path-1)
		(setf temp (gethash temp tree1))
	)
	(setf temp key)
	(loop
		(when (null (gethash temp tree2)) (return))
		(push (gethash temp tree2) path-2)
		(setf temp (gethash temp tree2))
	)
	(append path-1 (reverse path-2))
)

(bidirectional-BFS romanian-holiday 'VASLUI 'NEAMT 'asc)

(bidirectional-DFS romanian-holiday 'ARAD 'NEAMT 'asc '(timisoara))













(defun BFS (graph start goal sort_order)
  (setf open-list (list start))
  (setf closed-list '())
  (setf tree (make-hash-table))
  (setf (gethash start tree) nil)
  (loop
    (setf current (car open-list))
    (if (equal current goal) 
    	(progn 
    		(setf path (list current)) 
    		(setf temp current)
    		(loop 
    			(when (null (gethash temp tree)) (return))
				(push (gethash temp tree) path)
				(setf temp (gethash temp tree))
    			) 
    		(return path)))
    
    (setf closed-list (append closed-list (list current)))
    (setf expanded (alphabetical-sort 
                (remove-if 
                 #'(lambda (x) (or (member x open-list) (member x closed-list)) ) (gethash current graph)) sort_order))
    (setf open-list (cdr (append open-list expanded )))
    (dolist (n expanded)
    	(setf (gethash n tree) current))
    (when (null open-list) (return "No tree found"))
    )
  )

(defun DFS (graph start goal sort_order forbidden_cities)
  (setf open-list (list start))
  (Setf closed-list '())
  (setf tree (make-hash-table))
  (setf (gethash start tree) nil)
  (loop
    (setf current (car open-list))
    (if (equal current goal) 
    	(progn 
    		(setf path (list current)) 
    		(setf temp current)
    		(loop 
    			(when (null (gethash temp tree)) (return))
				(push (gethash temp tree) path)
				(setf temp (gethash temp tree))
    			) 
    		(return path)))
    
    (setf closed-list (append closed-list (list current)))
    (setf expanded (alphabetical-sort 
                      (remove-if #'(lambda (x) (or (member x open-list) (or (member x forbidden_cities) (member x closed-list)))) (gethash current graph)) sort_order) )
    (setf open-list (append expanded (cdr open-list) ))
    (dolist (n expanded)
    	(setf (gethash n tree) current))
    (when (null open-list) (return "No tree found"))
    )
  )