;;;; Project Euler 66.
;;;;
;;;; https://projecteuler.net/problem=66

(in-package :cl-problem-solving)

;;; Pell's equation x^2 - D*y^2 = 1, solved via continued fractions of sqrt(D).

(defun pe066--solve-pell (d)
  "Find minimal x satisfying x^2 - D*y^2 = 1 using continued fraction expansion of sqrt(D)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum d))
  (let ((a0 (isqrt d)))
    (declare (type fixnum a0))
    ;; Generate convergents h/k until h^2 - D*k^2 = 1
    (let ((m 0) (dd 1) (a a0)
          (h-1 1) (h0 a0)
          (k-1 0) (k0 1))
      (declare (type fixnum m dd a)
               (type integer h-1 h0 k-1 k0))
      (loop do (when (= 1 (- (* h0 h0) (* d (* k0 k0))))
                 (return h0))
               (setf m (the fixnum (- (* a dd) m)))
               (setf dd (the fixnum (floor (- d (* m m)) dd)))
               (setf a (the fixnum (floor (+ a0 m) dd)))
               (psetf h-1 h0 h0 (+ (* a h0) h-1))
               (psetf k-1 k0 k0 (+ (* a k0) k-1))))))

(defun project-euler-066 (&optional (lim 1000))
  "Find D <= lim for which the minimal x in x^2-D*y^2=1 is largest."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum lim))
  (let ((best-d 0)
        (best-x 0))
    (declare (type fixnum best-d) (type integer best-x))
    (loop for d of-type fixnum from 2 to lim
          for isqrt of-type fixnum = (isqrt d)
          when (/= d (* isqrt isqrt))
            do (let ((x (pe066--solve-pell d)))
                 (declare (type integer x))
                 (when (> x best-x)
                   (setf best-d d best-x x))))
    best-d))

;;; end
