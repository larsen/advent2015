(in-package #:advent2015)

(let ((last-returned-value))
  (defun flip-flop (value1 value2)
    (unless last-returned-value
      (setf last-returned-value value2))
    (setf last-returned-value
          (if (equal last-returned-value value1)
              value2
              value1)))
  (defun reset-flip-flop ()
    (setf last-returned-value nil)))

(defun remove-nth (n lst)
  (append (subseq lst 0 (- n 1))
          (subseq lst n (length lst))))

(defun replace-substr (str start end substr)
  "Returns a new a string based on STR, where the characters from
START to END have been replaced by SUBSTR."
  (coerce
   (loop with replaced-p = nil
         for idx from 0
         for c across str
         ;; Can't I do something better?
         if (and (>= idx start)
                 (< idx end)
                 (not replaced-p))
           do (setf replaced-p t)
           and append (coerce substr 'list)
         if (or (< idx start)
                (>= idx end))
           collect c)
   'string))

