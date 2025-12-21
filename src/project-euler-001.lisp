(in-package :cl-problem-solving)

(defun project-euler-1 (&optional (n 1000))
  "Solve Project Euler 1."
  (loop for i from 1 below n
        when (or (= 0 (mod i 3)) (= 0 (mod i 5)))
          sum i))

;;; end
