;;;; Project Euler 39.
;;;;
;;;; https://projecteuler.net/problem=39

(in-package :cl-problem-solving)

(defun project-euler-039 (&optional (pmax 1000))
  "Value of perimeter p <= pmax with the most integer right triangle solutions."
  (declare (type fixnum pmax))
  (let ((counts (make-array (the fixnum (+ 1 pmax)) :element-type 'fixnum :initial-element 0)))
    (declare (type (simple-array fixnum (*)) counts))
    ;; Enumerate Pythagorean triples: a <= b < c, a+b+c <= pmax
    (loop for a of-type fixnum from 1 to (the fixnum (floor pmax 3))
          do (loop for b of-type fixnum from a to (the fixnum (floor (the fixnum (- pmax a)) 2))
                   for c2 of-type fixnum = (the fixnum (+ (the fixnum (* a a)) (the fixnum (* b b))))
                   for c of-type fixnum = (isqrt c2)
                   when (and (= c2 (the fixnum (* c c)))
                             (<= (the fixnum (+ a (the fixnum (+ b c)))) pmax))
                     do (incf (aref counts (the fixnum (+ a (the fixnum (+ b c))))))))
    ;; Find perimeter with max solutions
    (let ((best-p 0) (best-count 0))
      (declare (type fixnum best-p best-count))
      (loop for p of-type fixnum from 1 to pmax
            when (> (aref counts p) best-count)
              do (setf best-p p best-count (aref counts p)))
      best-p)))

;;; end
