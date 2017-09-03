(defun distance(x)
	(loop for y from 1 to 20
		if(not (equal (aref map x y) NIL))
		collect (aref map x y)
	)
)
  