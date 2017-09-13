(defun load-relative (filename)
  (load (compile-file (merge-pathnames filename *load-truename*))))



