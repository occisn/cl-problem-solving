(defpackage project-euler-5
  (:use :cl))

(in-package :project-euler-5)

(defun project-euler-5 (&optional (n 20))
  "Solve Project Euler 5."
  (let ((res 1))
    (loop for i from 1 to n do
          (setq res (lcm res i)))
    res))

;;; end

