(in-package :cl-problem-solving)

(defun project-euler-005--not-optimized (&optional (n 20))
  "Solve Project Euler 5."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((res 1))
    (loop for i from 1 to n do
      (setq res (lcm res i)))
    res))

(defun project-euler-005 (&optional (n 20))
  "Solve Project Euler 5."
  (declare (type fixnum n))
  (let ((res 1))
    (declare (type fixnum res))
    (loop for i of-type fixnum from 1 to n do
      (setq res (lcm res i)))
    res))

;;; end
