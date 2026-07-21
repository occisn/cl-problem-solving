;;;; Project Euler 50.
;;;;
;;;; https://projecteuler.net/problem=50

(in-package :cl-problem-solving)

(defun project-euler-050 (&optional (n 1000000))
  "Prime below n that can be written as the longest sum of consecutive primes."
  (declare (type fixnum n))
  ;; Build sieve and collect primes
  (let ((sieve (make-array n :element-type 'bit :initial-element 0)))
    (loop for i of-type fixnum from 2 below n
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) below n by i
                     do (setf (sbit sieve j) 1)))
    (let* ((primes (loop for i of-type fixnum from 2 below n
                         when (zerop (sbit sieve i)) collect i))
           (nb-primes (length primes))
           (pvec (make-array nb-primes :element-type 'fixnum :initial-contents primes))
           (best-len 0)
           (best-sum 0))
      (declare (type fixnum nb-primes best-len best-sum)
               (type (simple-array fixnum (*)) pvec))
      (loop for start of-type fixnum from 0 below nb-primes
            do (loop for end of-type fixnum from (the fixnum (+ start 1)) below nb-primes
                     for count of-type fixnum from 2
                     for s of-type fixnum = (the fixnum (+ (aref pvec start) (aref pvec (the fixnum (+ start 1)))))
                       then (the fixnum (+ s (aref pvec end)))
                     while (< s n)
                     when (and (> count best-len)
                               (zerop (sbit sieve s)))
                       do (setf best-len count best-sum s)))
      best-sum)))

;;; end
