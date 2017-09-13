(defun printpath(element)
  (
   if(not (equal element NIL))
      (progn
        (setf pathcost (+ pathcost 1))
        (format t "~A  " element)
        (loop for x from  0 to 19
        if(equal (aref tempmap 0 x) element)
        do(printpath (aref tempmap 1 x))

        ))
  )
)