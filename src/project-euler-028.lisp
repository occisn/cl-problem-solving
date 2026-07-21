;;;; Project Euler 28.
;;;;
;;;; https://projecteuler.net/problem=28

(in-package :cl-problem-solving)

;;; Direct computation: walk the spiral diagonals without building the grid.
;;; Each ring of step size s contributes 4 corners spaced s apart.

(defun project-euler-028 (&optional (n 1001))
  "Sum of numbers on the diagonals of an n x n number spiral."
  (declare (type fixnum n))
  (let ((res 1)
        (current 1))
    (declare (type fixnum res current))
    (loop for step of-type fixnum from 2 to (the fixnum (- n 1)) by 2
          do (loop repeat 4
                   do (incf current step)
                      (incf res current)))
    res))

;;; end
