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

(test day7
  (is (= (advent2015:day7/solution1) 16076))
  (is (= (advent2015:day7/solution2) 2797)))

(test day8
  (is (= (advent2015:day8/solution1) 1342))
  (is (= (advent2015:day8/solution2) 2074)))

(test day9
  (is (= (advent2015:day9/solution1) 251))
  (is (= (advent2015:day9/solution2) 898)))

(test day10
  (is (= (advent2015:day10/solution1) 329356))
  (is (= (advent2015:day10/solution2) 4666278)))

(test day11
  (is (string= (advent2015:day11/solution1) "hepxxyzz"))
  (is (string= (advent2015:day11/solution2) "heqaabcc")))
