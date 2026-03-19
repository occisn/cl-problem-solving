(in-package :cl-problem-solving)

;;; Compare to 10^(nb-digits-1) threshold instead of counting digits each iteration.

(defun project-euler-025 (&optional (nb-digits 1000))
  "Index of the first Fibonacci term to contain nb-digits digits."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum nb-digits))
  (let ((threshold (expt 10 (the fixnum (- nb-digits 1)))))
    (declare (type integer threshold))
    (loop for i of-type fixnum from 1
          for f1 of-type integer = 0 then f2
          and f2 of-type integer = 1 then (+ f1 f2)
          until (>= f2 threshold)
          finally (return i))))

;;; end
