(in-package :cl-problem-solving)

(defun pe065--sum-of-digits-bigint (n)
  "Sum of digits of a non-negative integer."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop while (> n 0)
          do (incf sum (the fixnum (mod n 10)))
             (setf n (floor n 10)))
    sum))

(defun project-euler-065 (&optional (lim 100))
  "Sum of digits of the numerator of the lim-th convergent of e's continued fraction."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum lim))
  ;; e = [2; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...]
  ;; Coefficients: a0=2, then for k>=1: a_k = if k%3==2 then 2*(k+1)/3 else 1
  (let ((num 1) (den 0))
    (declare (type integer num den))
    ;; Build from the bottom up: start from a_{lim-1} and work back to a_0
    (loop for k of-type fixnum from (the fixnum (- lim 1)) downto 0
          for a of-type fixnum = (cond ((= k 0) 2)
                                       ((= 2 (mod k 3)) (the fixnum (* 2 (the fixnum (floor (the fixnum (+ k 1)) 3)))))
                                       (t 1))
          do (psetf num (+ (* a num) den) den num))
    (pe065--sum-of-digits-bigint num)))

;;; end
