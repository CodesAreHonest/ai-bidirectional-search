;;; -----------------------------------
;;; Name: Chai Ying Hua 
;;; Function: Open List in CLOS 
;;; -----------------------------------

;;; -----------------------------------------
;;; Class: Open List  
;;; -----------------------------------------
;;; Description: Stores new discovered nodes
;;; Accessor/Slot-value: open-list
;;; -----------------------------------------

(defclass openlist ()
  ((open-list         
    :initarg :open-list
    :accessor   open-list )))


;;; ------------------------------------------------------------
;;; Class: Close List  
;;; ------------------------------------------------------------
;;; Description: Stores discovered nodes for prevent duplication
;;; Accessor/Slot-value: open-list
;;; ------------------------------------------------------------

(defclass closelist ()
  ((close-list         
    :initarg :close-list
    :accessor   close-list )))

;;; ------------------------------------------------
;;; Function: Instantiate open list and close list
;;; ------------------------------------------------
;;; Description: 
;;;     open - instance of standard class openlist with start node 
;;;     close - instance of standard class closelist
;;; ------------------------------------------------

(defun make-open-list (start) 
  (setf open (make-instance 'openlist  :open-list (make-list 1 :initial-element start))))

(defun make-close-list() 
  (setf close (make-instance 'closelist  :close-list '())))

;;; --------------------------------------------
;;; Functions (Setter): insert-front-open
;;; --------------------------------------------
;;; Description: 
;;;  1. Insert element in front of OPEN List 
;;; 
;;; Input: Numerical or String 
;;; Output: Return list contains inserted element
;;; --------------------------------------------

(defmethod insert-front-open (element)
  (setf (open-list open) (push element (open-list open))))

;;; --------------------------------------------
;;; Functions (Setter): insert-back-open
;;; --------------------------------------------
;;; Description: 
;;;  1. Insert element in back of OPEN List 
;;; 
;;; Input: Numerical or String 
;;; Output: Return OPEN list contains inserted element
;;; --------------------------------------------

(defmethod insert-back-open (element)
  (setf (open-list open) (reverse (cons element (reverse (open-list open))))))

;;; --------------------------------------------
;;; Functions (Setter): insert-front-close
;;; --------------------------------------------
;;; Description: 
;;;  1. Insert element in front of CLOSE List 
;;; 
;;; Input: Numerical or String 
;;; Output: Return CLOSE list contains inserted element
;;; --------------------------------------------

(defmethod insert-front-close (element)
  (if (eq nil (close-list close))
      (setf (close-list close) (make-list 1 :initial-element 'element))
    (setf (close-list close) (push element (close-list close)))))

;;; --------------------------------------------
;;; Functions (Setter): insert-back-close
;;; --------------------------------------------
;;; Description: 
;;;  1. Insert element in back of OPEN List 
;;; 
;;; Input: Numerical or String 
;;; Output: Return list contains inserted element
;;; --------------------------------------------

(defmethod insert-back-close (element)
  (if (eq nil (close-list close))
      (setf (close-list close) (make-list 1 :initial-element element))
    (setf (close-list close) (reverse (cons element (reverse (close-list close)))))))


;;; --------------------------------------------
;;; Functions (Setter): open-list-length
;;; --------------------------------------------
;;; Input: NONE
;;; Output: Return number of element in OPEN list 
;;; --------------------------------------------

(defmethod open-list-length ()
  (length (open-list open)))

;;; --------------------------------------------
;;; Functions (Setter): close-list-length
;;; --------------------------------------------
;;; Input: NONE
;;; Output: Return number of element in CLOSE list 
;;; --------------------------------------------

(defmethod close-list-length ()
  (length (close-list close)))

;;; --------------------------------------------
;;; Functions (Setter): both-lists-length
;;; --------------------------------------------
;;; Input: NONE
;;; Output: Return number of objects in both list
;;; --------------------------------------------

(defmethod both-lists-length ()
  (format t "Length of OPEN list: ~D~%Length of CLOSE list: ~D~%"
          (open-list-length) (close-list-length)))