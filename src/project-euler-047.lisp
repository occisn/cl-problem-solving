;;;; Project Euler 47.
;;;;
;;;; https://projecteuler.net/problem=47

(in-package :cl-problem-solving)

(declaim (inline pe047--count-distinct-prime-factors))
(defun pe047--count-distinct-prime-factors (n)
  "Count distinct prime factors of n by trial division."
  (declare (type fixnum n))
  (let ((count 0))
    (declare (type fixnum count))
    (loop for p of-type fixnum from 2
          while (<= (the fixnum (* p p)) n)
          when (zerop (mod n p))
            do (incf count)
               (loop while (zerop (mod n p)) do (setf n (the fixnum (floor n p)))))
    (when (> n 1) (incf count))
    count))

(defun project-euler-047 (&optional (target 4))
  "First of target consecutive integers each having exactly target distinct prime factors."
  (declare (type fixnum target))
  (let ((run 0))
    (declare (type fixnum run))
    (loop for n of-type fixnum from 2
          do (if (= target (pe047--count-distinct-prime-factors n))
                 (progn
                   (incf run)
                   (when (= run target)
                     (return (the fixnum (+ (the fixnum (- n target)) 1)))))
                 (setf run 0)))))

;;; end
