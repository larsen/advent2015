(in-package #:advent2015/test)

(def-suite advent2015)
(in-suite advent2015)

(test day1
  (is (= (advent2015:day1/solution1) 74))
  (is (= (advent2015:day1/solution2) 1795)))

(test day2
  (is (= (advent2015:day2/solution1) 1586300))
  (is (= (advent2015:day2/solution2) 3737498)))
