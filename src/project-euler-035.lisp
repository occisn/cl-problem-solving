;;;; Project Euler 35.
;;;;
;;;; https://projecteuler.net/problem=35

(in-package :cl-problem-solving)

(declaim (inline pe035--nb-digits))
(defun pe035--nb-digits (n)
  "Number of digits in positive fixnum n."
  (declare (type fixnum n))
  (loop for d of-type fixnum from 1
        for m of-type fixnum = 10 then (the fixnum (* m 10))
        when (< n m) do (return d)))

(defun pe035--all-rotations-prime-p (n sieve ceiling)
  "Check if all digit rotations of n are prime (using precomputed sieve)."
  (declare (type fixnum n ceiling)
           (type (simple-array bit (*)) sieve))
  (let ((pow (the fixnum (expt 10 (the fixnum (- (pe035--nb-digits n) 1))))))
    (declare (type fixnum pow))
    (loop for r of-type fixnum = n then (the fixnum (+ (the fixnum (* (the fixnum (mod r 10)) pow))
                                                       (the fixnum (floor r 10))))
          repeat (pe035--nb-digits n)
          always (and (< r ceiling) (zerop (sbit sieve r))))))

(defun project-euler-035 (&optional (ceiling 1000000))
  "Count circular primes below ceiling using sieve."
  (declare (type fixnum ceiling))
  (let ((sieve (make-array ceiling :element-type 'bit :initial-element 0)))
    (loop for i of-type fixnum from 2 below ceiling
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) below ceiling by i
                     do (setf (sbit sieve j) 1)))
    (let ((count 0))
      (declare (type fixnum count))
      (loop for n of-type fixnum from 2 below ceiling
            when (and (zerop (sbit sieve n))
                      (pe035--all-rotations-prime-p n sieve ceiling))
              do (incf count))
      count)))

;;; end
