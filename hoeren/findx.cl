(defun findx(node)
	(loop for x from 0 to 20
		if(equal (aref map x 0) node)
		do(return-from findx x)
	)
)
  