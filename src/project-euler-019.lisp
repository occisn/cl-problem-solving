;;;; Project Euler 19.
;;;;
;;;; https://projecteuler.net/problem=19

(in-package :cl-problem-solving)

(defun project-euler-019 ()
  "Count Sundays that fell on the first of the month from 1 Jan 1901 to 31 Dec 2000."
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for year of-type fixnum from 1901 to 2000
          do (incf sum
                   (loop for month of-type fixnum from 1 to 12
                         count (= 6 (nth-value 6 (decode-universal-time
                                                   (encode-universal-time 0 0 0 1 month year)))))))
    sum))

;;; end
