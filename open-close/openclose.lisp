;;; -----------------------------------
;;; Name: Chai Ying Hua 
;;; Function: Open List in CLOS 
;;; -----------------------------------

(defclass openlist ()
  ((open-list   :accessor   open-list      :initarg :open-list)))

(defclass closelist ()
  ((close-list   :accessor   close-list      :initarg :close-list)))

;;; ------------------------------------------
;;; Instantiate object as open and close list  
;;; -----------------------------------------

;;;(setf olist (make-instance 'openlist :open-list '()))
;;;(setf clist (make-instance 'closelist :close-list '()))

;;; ------------------------------------------
;;; Functions for insert-front 
;;; -----------------------------------------
(defmethod insert-front (element list)
  (push element list))

;;; ------------------------------------------
;;; Functions for insert-back
;;; -----------------------------------------
(defmethod insert-back (element list)
  (push element (cdr (last list))))
