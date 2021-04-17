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
