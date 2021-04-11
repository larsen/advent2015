(in-package #:advent2015)

(defun read-reindeers ()
  (let ((reindeers (make-hash-table :test #'equal))
        (re "(\\w+) can fly (\\d+) km/s for (\\d+) seconds, but then must rest for (\\d+) seconds."))
    (loop for r in (uiop:read-file-lines (asdf:system-relative-pathname 'advent2015
                                                                        "inputs/day14"))
          do (register-groups-bind (name
                                    (#'parse-integer speed)
                                    (#'parse-integer flying-time)
                                    (#'parse-integer rest-time))
                 (re r)
               (setf (gethash name reindeers)
                     (list speed flying-time rest-time)))
          finally (return reindeers))))

(let ((last-returned-value))
  (defun flip-flop (value1 value2)
    (unless last-returned-value
      (setf last-returned-value value1))
    (setf last-returned-value
          (if (equal last-returned-value value1)
              value2
              value1))))

(defun reindeer-flying-or-resting (elapsed-time flying-time rest-time)
  (loop with acc = 0
        for state = (flip-flop 'flying 'resting)
        do (incf acc (if (eql state 'resting)
                         rest-time
                         flying-time))
        while (< acc elapsed-time)
        finally (return state)))

(defun day14/solution1 ()
  (let ((reindeers (read-reindeers))
        (reindeers-distance (make-hash-table :test #'equal)))
    (loop for r being the hash-keys of reindeers
          do (setf (gethash r reindeers-distance) 0))
    (loop for elapsed from 1 to 2503
          do (loop for r being the hash-keys of reindeers
                   do (destructuring-bind (speed flying-time rest-time)
                          (gethash r reindeers)
                        (incf (gethash r reindeers-distance)
                              (if (eql 'flying (reindeer-flying-or-resting elapsed
                                                                           flying-time
                                                                           rest-time))
                             speed
                             0))))
          finally (return (apply #'max (hash-table-values reindeers-distance))))))

(defun day14/solution2 ()
  )
