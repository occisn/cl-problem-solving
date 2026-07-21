;;;; Project Euler 43.
;;;;
;;;; https://projecteuler.net/problem=43

(in-package :cl-problem-solving)

(defun project-euler-043 ()
  "Sum of all 0-9 pandigital numbers with sub-string divisibility property."
  (let ((res 0)
        (vec (make-array 10 :element-type 'fixnum :initial-contents '(0 1 2 3 4 5 6 7 8 9)))
        (divisors (make-array 8 :element-type 'fixnum :initial-contents '(0 2 3 5 7 11 13 17))))
    (declare (type fixnum res)
             (type (simple-array fixnum (8)) divisors))
    (pe041--for-each-permutation
     vec
     (lambda ()
       (when (loop for k of-type fixnum from 1 to 7
                   for sub of-type fixnum = (the fixnum (+ (the fixnum (* 100 (aref vec k)))
                                                           (the fixnum (* 10 (aref vec (the fixnum (+ k 1)))))
                                                           (aref vec (the fixnum (+ k 2)))))
                   always (zerop (mod sub (aref divisors k))))
         (incf res (the fixnum (pe041--vec-to-number vec 10))))))
    res))

;;; end
