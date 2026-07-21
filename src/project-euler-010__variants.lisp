;;;; Project Euler 10: alternative implementations.
;;;;
;;;; https://projecteuler.net/problem=10

(in-package :cl-problem-solving)

;;; Variant: next-prime loop (slower — trial division per prime)

(declaim (inline pe010--primep))
(defun pe010--primep (n)
  "Test primality by trial division."
  (declare (type fixnum n))
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((evenp n) nil)
        (t (loop for i of-type fixnum from 3 by 2
                 with root-n of-type fixnum = (isqrt n)
                 while (<= i root-n)
                 never (zerop (mod n i))))))

(declaim (inline pe010--next-prime))
(defun pe010--next-prime (p)
  "Return the next prime after p."
  (declare (type fixnum p))
  (if (= p 2)
      3
      (loop for candidate of-type fixnum from (the fixnum (+ p 2)) by 2
            when (pe010--primep candidate)
              do (return candidate))))

(defun project-euler-010--next-prime-loop (&optional (n 2000000))
  "Sum of all primes below n using next-prime iteration."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for p of-type fixnum = 2 then (pe010--next-prime p)
          while (< p n)
          do (incf sum p))
    sum))

;;; end
