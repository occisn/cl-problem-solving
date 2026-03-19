(in-package :cl-problem-solving)

;;; Math trick: T(n) = n(n+1)/2 where n and n+1 are coprime,
;;; so d(T(n)) = d(n/2)*d(n+1) or d(n)*d((n+1)/2) depending on parity.

(declaim (inline pe012--nb-of-divisors))
(defun pe012--nb-of-divisors (n)
  "Count divisors of n by trial division up to sqrt(n)."
  (declare (type fixnum n))
  (let ((count 0))
    (declare (type fixnum count))
    (loop for i of-type fixnum from 1
          with root-n of-type fixnum = (isqrt n)
          while (<= i root-n)
          when (zerop (mod n i))
            do (incf count (if (= i (the fixnum (floor n i))) 1 2)))
    count))

(defun project-euler-012 (&optional (k 500))
  "First triangle number with over k divisors, using d(n(n+1)/2) = d(n/2)*d(n+1) trick."
  (declare (type fixnum k))
  (loop for n of-type fixnum from 1
        for even-p of-type boolean = nil then (not even-p)
        for d1 of-type fixnum = (pe012--nb-of-divisors (if even-p (the fixnum (ash n -1)) n))
        for d2 of-type fixnum = (pe012--nb-of-divisors (if even-p (the fixnum (+ n 1)) (the fixnum (ash (the fixnum (+ n 1)) -1))))
        when (> (the fixnum (* d1 d2)) k)
          do (return (the fixnum (ash (the fixnum (* n (the fixnum (+ n 1)))) -1)))))

;;; end
