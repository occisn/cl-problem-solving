
(defun project-euler-1 (n)
  "Solve Project Euler 1."
  (loop for i from 1 below n
        when (or (= 0 (mod i 3)) (= 0 (mod i 5)))
          sum i))

(project-euler-1 10) ; 23
(project-euler-1 1000)
