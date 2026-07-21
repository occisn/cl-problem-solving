;;;; Project Euler 56.
;;;;
;;;; https://projecteuler.net/problem=56

(in-package :cl-problem-solving)

(defun project-euler-056 ()
  "Maximum digital sum of a^b for a,b < 100."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((best 0))
    (declare (type fixnum best))
    (loop for a of-type fixnum from 1 to 99
          do (loop for b of-type fixnum from 1 to 99
                   for s of-type fixnum = (let ((n (expt a b)) (sum 0))
                                            (declare (type integer n) (type fixnum sum))
                                            (loop while (> n 0)
                                                  do (incf sum (the fixnum (mod n 10)))
                                                     (setf n (floor n 10)))
                                            sum)
                   when (> s best) do (setf best s)))
    best))

;;; end
