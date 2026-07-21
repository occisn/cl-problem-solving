;;;; Project Euler 53.
;;;;
;;;; https://projecteuler.net/problem=53

(in-package :cl-problem-solving)

(defun pe053--combin (n r)
  "Binomial coefficient C(n,r)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum n r))
  (if (or (< r 0) (> r n))
      0
      (let ((result 1))
        (declare (type integer result))
        (when (> r (- n r)) (setf r (- n r)))
        (loop for i of-type fixnum from 0 below r
              do (setf result (* result (- n i)))
                 (setf result (floor result (+ 1 i))))
        result)))

(defun project-euler-053 ()
  "Count values of C(n,r) for 1<=n<=100 that exceed one million."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((count 0))
    (declare (type fixnum count))
    (loop for n of-type fixnum from 1 to 100
          do (loop for r of-type fixnum from 0 to n
                   when (> (pe053--combin n r) 1000000)
                     do (incf count)))
    count))

;;; end
