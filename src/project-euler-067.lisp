;;;; Project Euler 67.
;;;;
;;;; https://projecteuler.net/problem=67

(in-package :cl-problem-solving)

;;; Same algorithm as PE018 (bottom-up iteration) but with a 100-row triangle from file.

(defun project-euler-067 ()
  "Maximum path sum from top to bottom of the 100-row triangle."
  (let* ((input-file (merge-pathnames "project-euler-input-files/p067_triangle.txt"
                                      (asdf:system-source-directory "cl-problem-solving")))
         (triangle (with-open-file (stream input-file)
                     (loop for raw-line = (read-line stream nil)
                           while raw-line
                           for line of-type simple-string = raw-line
                           collect (mapcar #'parse-integer
                                           (loop for start = 0 then (the fixnum (+ 1 finish))
                                                 for finish = (position #\Space line :start start)
                                                 collecting (subseq line start finish)
                                                 until (null finish)))))))
    (project-euler-018 triangle)))

;;; end
