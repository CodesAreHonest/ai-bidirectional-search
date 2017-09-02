(defun erase(node list)
  (if (equal 'Open list)
      (dotimes (i Open_Length)
        (if (equal (aref Open i) node)
            (progn
              (loop for j from i to Open_Length
                    do (setf (aref Open j) (aref Open (+ j 1)))
              )
              (decf Open_Length))
            ;(write "Not Found")
        )
      )
  )
  
  (if (equal 'Closed list)
      (dotimes (i Closed_Length)
        (if (equal (aref Closed i) node)
            (progn
              (loop for j from i to Closed_Length
                    do (setf (aref Closed j) (aref Closed (+ j 1)))
              )
              (decf Closed_Length))
            ;(write "Not Found")
        )
      )
  )
)
  