(defun insert(node list)
  (if (equal 'Open list)
      ;(progn
        ;--CHECK CLOSED LIST--
        (dotimes (i Closed_Length)
          (if (equal (aref Closed i) node)
              (return-from insert 'NIL)
            ;--END CHECK--
            (progn
            (setf (aref Open Open_Length) node)
            (incf Open_Length))
        )
      )
  )
  
  (if (equal 'Closed list)
      (progn
        (setf (aref Closed Closed_Length) node)
        (incf Closed_Length))
  )
)
  