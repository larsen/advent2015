(in-package #:advent2015)

(defun read-santa-instructions ()
  (uiop:read-file-string (asdf:system-relative-pathname 'advent2015
                                                        "inputs/day3")))

(defun day3/solution1 ()
  (let ((recipient-houses (make-hash-table :test 'equal))
        (pos-x 0)
        (pos-y 0))
    (labels ((deliver-present (x y)
               (incf (gethash (format nil "~a,~a" x y)
                              recipient-houses 0))))
      (loop for instr across (read-santa-instructions)
            do (deliver-present pos-x pos-y)
            if (char-equal instr #\^)
              do (decf pos-y)
            if (char-equal instr #\v)
              do (incf pos-y)
            if (char-equal instr #\<)
              do (decf pos-x)
            if (char-equal instr #\>)
              do (incf pos-x)
            finally (return (hash-table-count recipient-houses))))))

(let ((last-returned-value))
  (defun flip-flop (value1 value2)
    (unless last-returned-value
      (setf last-returned-value value1))
    (setf last-returned-value
          (if (equal last-returned-value value1)
              value2
              value1))))

(defun day3/solution2 ()
  (let ((recipient-houses (make-hash-table :test 'equal))
        (pos-santa-x 0)
        (pos-santa-y 0)
        (pos-bot-x 0)
        (pos-bot-y 0))
    (labels ((deliver-present (x y)
               (incf (gethash (format nil "~a,~a" x y)
                              recipient-houses 0))))
      (loop for instr across (read-santa-instructions)
            do (deliver-present pos-santa-x pos-santa-y)
               (deliver-present pos-bot-x pos-bot-y)
            do (let ((agent (flip-flop 'santa 'bot)))
                 (if (equal agent 'santa)
                     (progn (if (char-equal instr #\^)
                                (decf pos-santa-y))
                            (if (char-equal instr #\v)
                                (incf pos-santa-y))
                            (if (char-equal instr #\>)
                                (incf pos-santa-x))
                            (if (char-equal instr #\<)
                                (decf pos-santa-x))))
                 (if (equal agent 'bot)
                     (progn (if (char-equal instr #\^)
                                (decf pos-bot-y))
                            (if (char-equal instr #\v)
                                (incf pos-bot-y))
                            (if (char-equal instr #\>)
                                (incf pos-bot-x))
                            (if (char-equal instr #\<)
                                (decf pos-bot-x)))))
            finally (return (hash-table-count recipient-houses))))))
