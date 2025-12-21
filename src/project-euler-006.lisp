(in-package :cl-problem-solving)

(defun project-euler-6 (&optional (n 100))
  "Solve Project Euler 6."
  (let ((res 0))
    (loop for i from 1 to n do
      (setq res (+ res i)))
    (setq res (* res res))
    (loop for i from 1 to n do
      (setq res (- res (* i i))))
    res))

;;; end
