(in-package :cl-problem-solving)

(defun project-euler-010 (&optional (n 2000000))
  "Sum of all primes below n using Sieve of Eratosthenes."
  (declare (type fixnum n))
  (let ((sieve (make-array n :element-type 'bit :initial-element 0))
        (sum 0))
    (declare (type fixnum sum))
    (loop for i of-type fixnum from 2 below n
          when (zerop (sbit sieve i))
            do (incf sum i)
               (loop for j of-type fixnum from (the fixnum (* i i)) below n by i
                     do (setf (sbit sieve j) 1)))
    sum))

;;; end
