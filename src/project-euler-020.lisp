(in-package :cl-problem-solving)

(defun pe020--factorial (n)
  "Compute n! as a bignum."
  (declare (type fixnum n))
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop with res of-type integer = 1
        for i of-type fixnum from 2 to n
        do (setf res (the integer (* res i)))
        finally (return res)))

(defun pe020--sum-of-digits (n)
  "Sum of digits of a non-negative integer."
  (declare (type integer n))
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop while (> n 0)
          do (multiple-value-bind (q r) (floor n 10)
               (incf sum r)
               (setf n q)))
    sum))

(defun project-euler-020 (&optional (n 100))
  "Sum of digits of n!."
  (declare (type fixnum n))
  (pe020--sum-of-digits (pe020--factorial n)))

;;; end
