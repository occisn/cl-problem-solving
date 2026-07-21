;;;; Project Euler 15: alternative implementations.
;;;;
;;;; https://projecteuler.net/problem=15

(in-package :cl-problem-solving)

;;; Variant 1: recursive brute force (too slow for n=20)

(defun project-euler-015--brute-force (&optional (n 20))
  "Lattice paths by brute-force recursion (exponential time)."
  (declare (type fixnum n))
  (labels ((sub (x y)
             (declare (type fixnum x y))
             (cond ((= x n) 1)
                   ((= y n) 1)
                   (t (the fixnum (+ (sub (the fixnum (+ 1 x)) y)
                                     (sub x (the fixnum (+ 1 y)))))))))
    (sub 0 0)))

;;; Variant 2: memoized recursion with array

(defun project-euler-015--memo-array (&optional (n 20))
  "Lattice paths by memoized recursion using a 2D array."
  (declare (type fixnum n))
  (let ((memo (make-array (list (the fixnum (+ 1 n)) (the fixnum (+ 1 n)))
                          :element-type 'fixnum :initial-element -1)))
    (labels ((sub (x y)
               (declare (type fixnum x y))
               (cond ((= x n) 1)
                     ((= y n) 1)
                     ((>= (aref memo x y) 0) (aref memo x y))
                     (t (let ((val (the fixnum (+ (the fixnum (sub (the fixnum (+ 1 x)) y))
                                                  (the fixnum (sub x (the fixnum (+ 1 y))))))))
                          (setf (aref memo x y) val)
                          val)))))
      (sub 0 0))))

;;; end
