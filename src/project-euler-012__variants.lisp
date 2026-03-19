(in-package :cl-problem-solving)

;;; Variant 1: naive loop counting divisors of each triangle number directly

(defun project-euler-012--naive (&optional (k 500))
  "First triangle number with over k divisors (brute force)."
  (declare (type fixnum k))
  (loop for i of-type fixnum from 1
        for n of-type fixnum = 1 then (the fixnum (+ n i))
        when (> (pe012--nb-of-divisors n) k)
          do (return (values n (pe012--nb-of-divisors n)))))

;;; end
