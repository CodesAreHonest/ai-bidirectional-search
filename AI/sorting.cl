(defun sorting(list)
	(if (string-equal gettype 'Accending)
			(progn
				(write "AAA")
				(return-from sorting 'ACC)
			)
			(progn
				(write "BBB")
				(return-from sorting 'DEC)
			)
	)
)