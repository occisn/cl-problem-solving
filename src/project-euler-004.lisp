(in-package :cl-problem-solving)

(defun pe004-reverse-number--fixnum (n)
  "Reverse the N, which is supposed to be a fixnum >= 0.
For instance: 123 --> 321.
(v1, available in occisn/cl-utils GitHub repository)"
  (declare (type fixnum n))
  (labels ((sub (num acc)
             (declare (type fixnum num acc))
             (if (= num 0)
	         acc
                 (multiple-value-bind (quotient remainder)
                     (floor num 10)
                   (declare (type fixnum quotient remainder))
                   (sub quotient (the fixnum (+ (the fixnum (* 10 acc)) remainder)))))))
    (sub n 0)))

(defun project-euler-004--not-optimized (&optional (nb-digits 3))
  "Solve Project Euler 4."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((base (expt 10 (- nb-digits 1))) ; 100 for nb-digits = 3
        (lim (- (expt 10 nb-digits) 1))  ; 999 for nb-digits = 3
        )
    (loop with max-palindrome = 0
          for i from lim downto base
          do (loop for j from i downto base
                   for product = (* i j)
                   while (> product max-palindrome)
                   when (= product (pe004--reverse-number--fixnum product))
                     do (setq max-palindrome product))
          finally (return max-palindrome))))

(defun project-euler-004 (&optional (nb-digits 3))
  "Solve Project Euler 4.
Emacs Lisp with cl-lib"
  (declare (type fixnum nb-digits))
  (let ((base (expt 10 (the (integer 0) (- nb-digits 1)))) ; 100 for nb-digits = 3
        (lim (the fixnum (- (the fixnum (expt 10 (the (integer 1) nb-digits)))
                            1)))  ; 999 for nb-digits = 3
        )
    (declare (type fixnum base lim))
    (loop with max-palindrome = 0
          for i from lim downto base
          do (loop for j from i downto base
                   for product of-type fixnum = (* i j)
                   while (> product max-palindrome)
                   when (= product (the fixnum (pe004--reverse-number--fixnum product)))
                     do (setq max-palindrome product))
          finally (return max-palindrome))))

;;; end
