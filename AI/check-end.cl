;;----------------------------------------
;;Function: Check End Status
;;----------------------------------------
;;Description: 
;; 1. Check if Open-list is empty
;; 	  If Open-list is empty, return "NOT FOUND"
;;    Else Check if Goal(Iasi) is in Open-list
;;	      If Goal is in Open-list, return "FOUND"
;;		  Else return "NIL"
;;----------------------------------------

(defun check-end()
	(if (eq (get-current) NIL)
		(return-from check-end "NOT FOUND")
		(progn
			(setf list (open-list open))
			(setf result NIL)
			(dolist (n list)
				(setf element (car list))
				(if (eq (check-goal element) T)
					(return-from check-end "FOUND"))
				(setf list (cdr list))
			)
			(return-from check-end result)
		)
	)
)