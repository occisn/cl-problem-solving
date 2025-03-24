
(defun project-euler-5 (n)
  "Solve Project Euler 5."
  (let ((res 1))
    (loop for i from 1 to n do
          (setq res (lcm res i)))
    res))

(project-euler-5 10) ; 2520
(project-euler-5 20)

