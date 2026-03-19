(in-package :cl-problem-solving)

(defun project-euler-016 (&optional (exponent 1000))
  "Sum of digits of 2^exponent."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((n (expt 2 exponent))
        (sum 0))
    (declare (type integer n) (type fixnum sum))
    (loop while (> n 0)
          do (multiple-value-bind (q r) (floor n 10)
               (incf sum r)
               (setf n q)))
    sum))

;;; end
