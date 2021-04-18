(in-package #:advent2015)

(defun read-replacements-and-molecule ()
  (let ((replacements (make-hash-table :test #'equal))
        (molecule))
    (loop with mode = :reading-replacements
          for line in (uiop:read-file-lines
                       (asdf:system-relative-pathname 'advent2015 "inputs/day19"))
          if (string= line"")
            do (setf mode :reading-molecule)
          do (if (eql mode :reading-molecule)
                 (setf molecule line)
                 (register-groups-bind (molecule replacement)
                     ("(\\w+) => (\\w+)" line)
                   (push replacement
                         (gethash molecule replacements '())))))
    (values replacements
            molecule)))

(defun replace-substr (str start end substr)
  "Returns a new a string based on STR, where the characters from
START to END have been replaced by SUBSTR."
  (coerce
   (loop with replaced-p = nil
         for idx from 0
         for c across str
         ;; Can't I do something better?
         if (and (>= idx start)
                 (< idx end)
                 (not replaced-p))
           do (setf replaced-p t)
           and append (coerce substr 'list)
         if (or (< idx start)
                (>= idx end))
           collect c)
   'string))

(defun day19/solution1 ()
  (let ((resulting-molecules (make-hash-table :test #'equal)))
    (multiple-value-bind (replacements molecule)
        (read-replacements-and-molecule)
      (loop for substring being the hash-keys of replacements
            do (loop for possible-replacement in (gethash substring replacements)
                     ;; Ora bisogna fare tutte le sostituzioni possibili
                     do (do-matches (s e substring molecule)
                          (incf (gethash (replace-substr molecule s e possible-replacement)
                                         resulting-molecules 0))))
            finally (return (length (hash-table-keys resulting-molecules)))))))

(defun day19/solution2 ()
   )
