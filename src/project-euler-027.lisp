;;;; Project Euler 27.
;;;;
;;;; https://projecteuler.net/problem=27

(in-package :cl-problem-solving)

(declaim (inline pe027--primep))
(defun pe027--primep (n)
  "Test primality by trial division."
  (declare (type fixnum n))
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((evenp n) nil)
        (t (loop for i of-type fixnum from 3 by 2
                 with root-n of-type fixnum = (isqrt n)
                 while (<= i root-n)
                 never (zerop (mod n i))))))

(defun project-euler-027 ()
  "Find the product a*b for |a|<1000, |b|<=1000 where n^2+an+b produces
the maximum number of consecutive primes starting at n=0."
  (let ((best-count 0)
        (best-product 0))
    (declare (type fixnum best-count best-product))
    (loop for a of-type fixnum from -999 to 999
          do (loop for b of-type fixnum from -1000 to 1000
                   for count of-type fixnum = (loop for n of-type fixnum from 0
                                                    for x of-type fixnum = (the fixnum (+ (the fixnum (* n n))
                                                                                          (the fixnum (* a n))
                                                                                          b))
                                                    while (pe027--primep x)
                                                    finally (return n))
                   when (> count best-count)
                     do (setf best-count count
                              best-product (the fixnum (* a b)))))
    best-product))

;;; end
