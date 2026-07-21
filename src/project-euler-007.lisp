;;;; Project Euler 7.
;;;;
;;;; https://projecteuler.net/problem=7

(in-package :cl-problem-solving)

(declaim (inline pe007--primep))
(defun pe007--primep (n)
  "Return t if and only if fixnum N is prime.
(v1, available in occisn/cl-utils GitHub repository)"
  (declare (type fixnum n))
  (block outer
    (when (or (= n 2) (= n 3) (= n 5) (= n 7))
      (return-from outer t))
    (when (or (<= n 1) (evenp n) (zerop (mod n 3)))
      (return-from outer nil))
    (loop for factor of-type fixnum from 5 by 6
          with root-n of-type fixnum = (isqrt n) ; root-n^2 <= n < (root-n + 1)^2
          while (<= factor root-n)
          never (or (zerop (mod n factor))
                    (zerop (mod n (+ factor 2)))))))

(declaim (inline pe007--next-prime))
(defun pe007--next-prime (n)
  "Return next prime after fixnum N.
Note: if N is prime, the result is not N.
(v1, available in occisn/cl-utils GitHub repository)"
  (declare (type fixnum n))
  (cond ((<= n 1) 2)
        (t
         (loop for i of-type fixnum from (+ n (if (evenp n) 1 2)) by 2
               when (pe007--primep i) return i))))

(defun pe007--nth-prime (rank)
  "Return RANK-th prime.
For instance: 1 --> 2 ; 2 --> 3 ; 6 --> 13.
The argument is supposed to be an integer >= 1.
(v1, available in occisn/cl-utils GitHub repository)"
  (declare (type fixnum rank))
  (loop for n of-type fixnum = 2 then (pe007--next-prime n)
        and count of-type fixnum = 1 then (the fixnum (+ count 1))
        when (= count rank) do (return n)))

(defun project-euler-007 (&optional (n 10001))
  "Solve Project Euler 7."
  (declare (type fixnum n))
  (pe007--nth-prime n))

;;; end
