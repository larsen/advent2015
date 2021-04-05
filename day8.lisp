(in-package #:advent2015)

(defun read-string-literals-as-bytes ()
  (with-open-file (stream (asdf:system-relative-pathname 'advent2015
                                                       "inputs/day8")
                        :direction :input
                        :element-type 'unsigned-byte)
  (loop with counter = 0
        for c = (read-byte stream nil)
        while c collect c)))

(defun count-bytes-in-strings (bytes)
  (count-if-not (lambda (c) (= c 10)) bytes))

(defun length-unescaped (bytes)
  (loop with char-counter = 0
        with pos = 0
        while (< pos (length bytes))
        do ;; Simple escape sequence
           (if (= 92 (nth pos bytes))
               (if (= 120 (nth (+ pos 1) bytes))
                   ;; \x.. escape sequence
                   (incf pos 4)
                   (incf pos 2))
               (incf pos))
           (incf char-counter)
        finally (return char-counter)))

(defun escaped-sequences-length (bytes)
  (reduce #'+ (mapcar (lambda (s)
                        (if s
                          (length-unescaped
                           (subseq s 1 (- (length s) 1)))
                          0))
                      (split-sequence 10 bytes))))

(defun day8/solution1 ()
  (let* ((literals-as-bytes (read-string-literals-as-bytes)))
    (- (count-bytes-in-strings literals-as-bytes)
       (escaped-sequences-length literals-as-bytes))))

(defun day8/solution2 ()
  )
