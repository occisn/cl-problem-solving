;;;; Project Euler 26.
;;;;
;;;; https://projecteuler.net/problem=26

(in-package :cl-problem-solving)

(declaim (inline pe026--recurring-cycle-length))
(defun pe026--recurring-cycle-length (d)
  "Length of the recurring cycle in the decimal expansion of 1/d.
This is the multiplicative order of 10 modulo d (after removing factors of 2 and 5)."
  (declare (type fixnum d))
  (loop while (zerop (mod d 2)) do (setf d (ash d -1)))
  (loop while (zerop (mod d 5)) do (setf d (the fixnum (floor d 5))))
  (if (= d 1)
      0
      (loop for k of-type fixnum from 1
            for r of-type fixnum = (mod 10 d) then (the fixnum (mod (the fixnum (* 10 r)) d))
            until (= r 1)
            finally (return k))))

(defun project-euler-026 (&optional (n 1000))
  "Find d < n for which 1/d has the longest recurring decimal cycle."
  (declare (type fixnum n))
  (let ((best-d 1)
        (best-len 0))
    (declare (type fixnum best-d best-len))
    (loop for d of-type fixnum from 2 below n
          for len of-type fixnum = (pe026--recurring-cycle-length d)
          when (> len best-len)
            do (setf best-d d best-len len))
    best-d))

;;; end
