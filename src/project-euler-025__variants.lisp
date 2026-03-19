(in-package :cl-problem-solving)

;;; Variant: count digits each iteration (slower due to repeated bignum digit counting)

(defun project-euler-025--count-digits (&optional (nb-digits 1000))
  "Index of the first Fibonacci term to contain nb-digits digits (counting digits each step)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum nb-digits))
  (loop for i of-type fixnum from 1
        for f1 of-type integer = 0 then f2
        and f2 of-type integer = 1 then (+ f1 f2)
        until (>= (length (write-to-string f2)) nb-digits)
        finally (return i)))

;;; end
