(defun setparent(element parent)
  (loop for x from  0 to 19
        if(equal (aref tempmap 0 x) element)
        do(setf(aref tempmap 1 x) parent))
)