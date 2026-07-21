;;;; Project Euler 21.
;;;;
;;;; https://projecteuler.net/problem=21

(in-package :cl-problem-solving)

(defun pe021--sum-of-proper-divisors (n)
  "Sum of proper divisors of n (all divisors less than n)."
  (declare (type fixnum n))
  (if (= n 1)
      1
      (let* ((isqrt (isqrt n))
             (perfect-square-p (= n (the fixnum (* isqrt isqrt)))))
        (declare (type fixnum isqrt))
        (the fixnum
             (+ (loop for i of-type fixnum from 2 to isqrt
                      when (zerop (mod n i))
                        sum (the fixnum (+ i (the fixnum (floor n i)))) of-type fixnum)
                1
                (if perfect-square-p (- isqrt) 0))))))

(defun project-euler-021 (&optional (maxi 10000))
  "Sum of all amicable numbers under maxi."
  (declare (type fixnum maxi))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for a of-type fixnum from 2 below maxi
          for b of-type fixnum = (pe021--sum-of-proper-divisors a)
          when (and (/= a b) (= a (pe021--sum-of-proper-divisors b)))
            do (incf sum a))
    sum))

;;; end
