(in-package #:advent2015)

(defun read-json-file ()
  (jonathan:parse
   (uiop:read-file-string
    (asdf:system-relative-pathname 'advent2015
                                   "inputs/day12"))))

(defun traverse-and-grep-struct (struct fn)
  (loop for elem in struct
        if (and (atom elem) (funcall fn elem))
          collect elem
        if (listp elem)
          append (traverse-and-grep-struct elem fn)))

(defun day12/solution1 ()
  (reduce #'+
          (traverse-and-grep-struct
           (read-json-file) #'numberp)))

(defun day12/solution2 ()
  )
