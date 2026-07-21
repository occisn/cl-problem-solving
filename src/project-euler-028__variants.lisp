;;;; Project Euler 28: alternative implementations.
;;;;
;;;; https://projecteuler.net/problem=28

(in-package :cl-problem-solving)

;;; Variant: build the actual spiral as a 2D array, then sum diagonals.
;;; Much slower than the direct computation, but verifies correctness.

(defun project-euler-028--build-spiral (&optional (n 1001))
  "Sum of diagonal numbers by actually constructing the spiral."
  (declare (type fixnum n))
  (let* ((grid (make-array (list n n) :element-type 'fixnum))
         (mid (the fixnum (floor n 2)))
         (x mid) (y mid) (current 1))
    (declare (type fixnum x y current))
    (setf (aref grid x y) 1)
    (loop for step of-type fixnum from 1 below n
          for directions = '(:east :south :west :north) then (cdr directions)
          do ;; Two sides per step size (except last which is one side)
             (dotimes (side (if (= step (the fixnum (- n 1))) 1 2))
               (declare (type fixnum side) (ignorable side))
               (let ((dir (car directions)))
                 (loop repeat step
                       do (incf current)
                          (ecase dir
                            (:east (incf y))
                            (:south (incf x))
                            (:west (decf y))
                            (:north (decf x)))
                          (setf (aref grid x y) current))
                 (setf directions (cdr directions)))))
    ;; Sum diagonals
    (let ((sum 0))
      (declare (type fixnum sum))
      (loop for k of-type fixnum from 0 below n
            do (incf sum (aref grid k k))
               (incf sum (aref grid k (the fixnum (- n 1 k)))))
      (the fixnum (- sum (aref grid mid mid))))))

;;; end
