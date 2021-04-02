(in-package #:advent2015)

(defparameter *adventcoins-secret-key* "iwrupvqb")

(defun right-suffix (suffix secret-key
                     &key (hash-prefix "^00000"))
  (let ((md5-hash (md5:md5sum-string
                   (format nil "~a~a" secret-key suffix))))
    (scan hash-prefix
          (format nil "~{~2,'0x~}"
                  (map 'list #'identity md5-hash)))))

(defun day4/solution1 ()
  (loop for suffix from 0
        until (right-suffix suffix
                            *adventcoins-secret-key*)
        finally (return suffix)))

(defun day4/solution2 ()
  (loop for suffix from 0
        until (right-suffix suffix
                            *adventcoins-secret-key*
                            :hash-prefix "^000000"
                            )
        finally (return suffix)))
