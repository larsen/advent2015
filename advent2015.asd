;;;; advent2015.asd

(asdf:defsystem #:advent2015
  :description "Advent of Code 201k"
  :author "Stefano Rodighiero <stefano.rodighiero@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-ppcre #:alexandria #:md5 #:memoize #:split-sequence #:jonathan #:fiveam)
  :components ((:file "package")
               (:file "utils")
               (:file "day1")
               (:file "day2")
               (:file "day3")
               (:file "day4")
               (:file "day5")
               (:file "day6")
               (:file "day7")
               (:file "day8")
               (:file "day9")
               (:file "day10")
               (:file "day11")
               (:file "day12")
               (:file "day13")
               (:file "day14"))
  :in-order-to ((test-op (test-op #:advent2015/test))))

(asdf:defsystem #:advent2015/test
  :depends-on (#:advent2015
               #:fiveam)
  :components ((:module "tests"
                :components ((:file "main"))))
  :perform (test-op (op _) (symbol-call :fiveam :run-all-tests)))

