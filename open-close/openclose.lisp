;;; -----------------------------------
;;; Name: Chai Ying Hua 
;;; Function: Open List in CLOS 
;;; -----------------------------------

;;; -----------------------------------------
;;; Class: Open List  
;;; -----------------------------------------
;;; Description: Explore and stores new nodes
;;; Accessor/Slot-value: open-list
;;; -----------------------------------------

(defclass openlist ()
  ((open-list         
    :initarg :open-list
    :accessor   open-list )))


;;; -------------------------------------------------------
;;; Class: Close List
;;; Description: Stores node discovered for prevent duplication
;;; --------------------------------------------------------

(defclass closelist ()
  ((close-list   :accessor   close-list      :initarg :close-list)))

;;; ------------------------------------------------
;;; Function: Instantiate open list and close list
;;; ------------------------------------------------
;;; Description: 
;;;     open - instance of standard class openlist 
;;;     close - instance of standard class closelist
;;; ------------------------------------------------

(defun make-open-list (start) 
  (setf open (make-instance 'openlist  :open-list (make-list 1 :initial-element 'start))))

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
;;; Output: Return list contains inserted element
;;; --------------------------------------------

(defmethod insert-back-open (element)
  (setf (open-list open) (reverse (cons element (reverse (open-list open))))))

;;; --------------------------------------------
;;; Functions (Setter): open-list-length
;;; --------------------------------------------
;;; Input: NONE
;;; Output: Return number of element in open list 
;;; --------------------------------------------

(defmethod open-list-length ()
    (length (open-list open)))