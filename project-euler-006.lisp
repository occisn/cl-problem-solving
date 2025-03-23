
(defun project-euler-6 (n)
  "Solve Project Euler 6."
  (let ((res 0))
    (loop for i from 1 to n do
      (setq res (+ res i)))
    (setq res (* res res))
    (loop for i from 1 to n do
      (setq res (- res (* i i))))
    res))

(project-euler-6 10) ; 2640
(project-euler-6 100)

