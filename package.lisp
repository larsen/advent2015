;;;; package.lisp

(defpackage #:advent2015
  (:use #:cl #:cl-ppcre)
  (:export day1/solution1
           day1/solution2

           day2/solution1
           day2/solution2

           day3/solution1
           day3/solution2))

(defpackage #:advent2015/test
  (:use #:cl
        #:advent2015
        #:fiveam))
