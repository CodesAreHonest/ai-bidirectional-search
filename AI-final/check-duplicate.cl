;;---------------------------------------------------------------------------
;; Function: Check Duplicate
;;---------------------------------------------------------------------------
;; Description: 
;;  1. Check if element to be inserted into Open-list is already in Close-list
;;  2. Check if element to be inserted into Open-list is already in Open-list
;;  3. Remove current(Parent) from Open, and insert it into Close-list
;;---------------------------------------------------------------------------
;; Written by: Chong Hoe Ren  
;;---------------------------------------------------------------------------

(defun check-duplicate(list)
  (setf parent (get-current))
  (dolist (n list)
    (setf element (car list))
    (if (eq (find-elements-close element) NIL)
        (progn
          (setf totalnode (+ totalnode 1))
          (insert-back-open element)
          (setparent element parent))) 
    (setf list (cdr list)))
  (remove-element-open parent)
  (insert-back-close parent)
  (format t "~% Search Tree contains: ~a" tempmap)
  (format t "~% OPEN LIST contains ~a" (open-list open))
  (format t "~% CLOSE LIST contains ~a%" (close-list close)))