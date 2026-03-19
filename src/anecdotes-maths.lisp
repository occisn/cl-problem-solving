(in-package :cl-problem-solving)

;;; Mathematical anecdotes and curiosities from @AnecdotesMaths.

(defun anecdotes-maths-2357 (&optional (n 2357))
  "2357 is prime and 2^2 + 3^3 + 5^5 + 7^7 is also prime."
  (declare (type fixnum n))
  (and (pe037--primep n)
       (pe037--primep
        (let ((sum 0))
          (declare (type fixnum sum))
          (loop for m of-type fixnum = n then (the fixnum (floor m 10))
                while (> m 0)
                do (let ((d (the fixnum (mod m 10))))
                     (incf sum (the fixnum (expt d d)))))
          sum))))

(defun anecdotes-maths-65536-v1 ()
  "65536 is the smallest number with exactly 17 divisors."
  (loop for n of-type fixnum from 1
        when (= 17 (pe012--nb-of-divisors n))
          do (return n)))

(defun anecdotes-maths-2-127-1-is-prime ()
  "2^127 - 1 is prime (largest prime proven by a human)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (fermat--primep-bigint (- (expt 2 127) 1)))

(defun anecdotes-maths-12345678910987654321-prime ()
  "12345678910987654321 is prime."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (fermat--primep-bigint 12345678910987654321))

(defun anecdotes--prime-decomposition-bigint (n)
  "Return flat list of prime factors of integer n (with repetition)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer n))
  (let ((factors nil))
    (loop while (zerop (mod n 2)) do (push 2 factors) (setf n (floor n 2)))
    (loop for d from 3 by 2
          while (<= (* d d) n)
          do (loop while (zerop (mod n d)) do (push d factors) (setf n (floor n d))))
    (when (> n 1) (push n factors))
    (nreverse factors)))

(defun anecdotes-maths-13532385396179 ()
  "Prime factorization of 13532385396179 is 13 * 53^2 * 3853 * 96179."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (anecdotes--prime-decomposition-bigint 13532385396179))

;;; end
