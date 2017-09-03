(defun getinput()
  (pprint "GET_INPUT_DFS_BFS")
  (setq gettype(read))
  (cond ((string-equal gettype "dfs") (progn
                                        (write "forbidden city 1:")
                                        (setq for1(read))
                                        (write "forbidden city 2:")
                                        (setq for2(read))
                                        (format t "forbidden city one: ~A  forbidden city two: ~A" for1 for2)
                                       ))
        ((string-equal gettype "bfs") (pprint gettype))
        (t (pprint "wronginput"))))

