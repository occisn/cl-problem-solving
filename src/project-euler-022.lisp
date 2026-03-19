(in-package :cl-problem-solving)

(defun project-euler-022 ()
  "Total of all name scores in the names file."
  (labels ((string-split (str delimiter)
             (declare (type (simple-array character) str))
             (loop for start = 0 then (the fixnum (+ 1 finish))
                   for finish = (position delimiter str :start start)
                   collecting (subseq str start finish)
                   until (null finish)))
           (weight-of-string (str)
             (declare (type simple-string str))
             (let ((sum 0))
               (declare (type fixnum sum))
               (loop for c of-type character across str
                     do (incf sum (the fixnum (- (char-code c) 64))))
               sum)))
    (let* ((input-file (merge-pathnames "project-euler-input-files/p022_names.txt"
                                        (asdf:system-source-directory "cl-problem-solving")))
           (string1 (the simple-string (with-open-file (stream input-file)
                                        (read-line stream nil))))
           (string2 (the simple-string (delete #\" string1)))
           (names (string-split string2 #\,))
           (sorted-names (sort names #'string<))
           (sum 0))
      (declare (type fixnum sum))
      (loop for name in sorted-names
            for i of-type fixnum from 1
            do (incf sum (the fixnum (* i (weight-of-string name)))))
      sum)))

;;; end
