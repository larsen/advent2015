(in-package #:advent2015/test)

(def-suite advent2015)
(in-suite advent2015)

(test day1
  (is (= (advent2015:day1/solution1) 74))
  (is (= (advent2015:day1/solution2) 1795)))

(test day2
  (is (= (advent2015:day2/solution1) 1586300))
  (is (= (advent2015:day2/solution2) 3737498)))

(test day3
  (is (= (advent2015:day3/solution1) 2572))
  (is (= (advent2015:day3/solution2) 2631)))

(test day4
  (is (= (advent2015:day4/solution1) 346386))
  ; SLOW (is (= (advent2015:day4/solution2) 9958218))
  )

(test day5
  (is (= (advent2015:day5/solution1) 258))
  (is (= (advent2015:day5/solution2) 53)))

(test day6
  (is (= (advent2015:day6/solution1) 569999))
  (is (= (advent2015:day6/solution2) 17836115)))
