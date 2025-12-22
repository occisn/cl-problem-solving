(in-package :cl-problem-solving)

(defun project-euler-006--not-optimized (&optional (n 100))
  "Solve Project Euler 6."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((res 0))
    (loop for i from 1 to n do
      (setq res (+ res i)))
    (setq res (* res res))
    (loop for i from 1 to n do
      (setq res (- res (* i i))))
    res))

(defun project-euler-006 (&optional (n 100))
  "Solve Project Euler 6."
  (declare (type fixnum n))
  (let ((res 0))
    (declare (type fixnum res))
    (loop for i of-type fixnum from 1 to n do
      (setq res (+ res i)))
    (setq res (* res res))
    (loop for i of-type fixnum from 1 to n do
      (setq res (- res (the fixnum (* i i)))))
    res))

;;; end
