;;;; Project Euler 36.
;;;;
;;;; https://projecteuler.net/problem=36

(in-package :cl-problem-solving)

(declaim (inline pe036--reverse-number))
(defun pe036--reverse-number (n)
  "Reverse the digits of fixnum n."
  (declare (type fixnum n))
  (let ((rev 0))
    (declare (type fixnum rev))
    (loop for m of-type fixnum = n then (the fixnum (floor m 10))
          while (> m 0)
          do (setf rev (the fixnum (+ (the fixnum (* rev 10)) (the fixnum (mod m 10))))))
    rev))

(declaim (inline pe036--palindrome-p))
(defun pe036--palindrome-p (n)
  "Check if fixnum n is a decimal palindrome."
  (declare (type fixnum n))
  (= n (pe036--reverse-number n)))

(declaim (inline pe036--binary-palindrome-p))
(defun pe036--binary-palindrome-p (n)
  "Check if fixnum n is a binary palindrome."
  (declare (type fixnum n))
  (let ((rev 0) (m n))
    (declare (type fixnum rev m))
    (loop while (> m 0)
          do (setf rev (the fixnum (+ (the fixnum (ash rev 1)) (the fixnum (logand m 1)))))
             (setf m (ash m -1)))
    (= n rev)))

(defun project-euler-036 ()
  "Sum of all numbers below one million palindromic in both base 10 and base 2."
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for n of-type fixnum from 1 to 999999
          when (and (pe036--palindrome-p n) (pe036--binary-palindrome-p n))
            do (incf sum n))
    sum))

;;; end
