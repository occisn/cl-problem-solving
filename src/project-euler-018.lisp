;;;; Project Euler 18.
;;;;
;;;; https://projecteuler.net/problem=18

(in-package :cl-problem-solving)

;;; Bottom-up iteration: start from the second-to-last row, replace each
;;; element with itself + max of its two children. Final answer is at the top.

(defun pe018--triangle-to-2d-array (triangle)
  "Convert a triangle (list of lists) to a 2D fixnum array."
  (declare (type list triangle))
  (let* ((n (length triangle))
         (width (length (the list (car (last triangle))))))
    (declare (type fixnum n width))
    (flet ((pad (row)
             (declare (type list row))
             (append row (loop for i of-type fixnum from (length row) below width collect 0))))
      (make-array (list n width)
                  :element-type 'fixnum
                  :initial-contents (mapcar #'pad triangle)))))

(defparameter +pe018-triangle+
  '((75)
    (95 64)
    (17 47 82)
    (18 35 87 10)
    (20 04 82 47 65)
    (19 01 23 75 03 34)
    (88 02 77 73 07 63 67)
    (99 65 04 28 06 16 70 92)
    (41 41 26 56 83 40 80 70 33)
    (41 48 72 33 47 32 37 16 94 29)
    (53 71 44 65 25 43 91 52 97 51 14)
    (70 11 33 28 77 73 17 78 39 68 17 57)
    (91 71 52 38 17 14 91 43 58 50 27 29 48)
    (63 66 04 68 89 53 67 30 73 16 69 87 40 31)
    (04 62 98 27 23 09 70 98 73 93 38 53 60 04 23)))

(defun project-euler-018 (&optional (triangle +pe018-triangle+))
  "Maximum path sum from top to bottom of a triangle, using bottom-up iteration."
  (declare (type list triangle))
  (let* ((arr (pe018--triangle-to-2d-array triangle))
         (nb-rows (length triangle)))
    (declare (type fixnum nb-rows)
             (type (simple-array fixnum (* *)) arr))
    (loop for row of-type fixnum from (the fixnum (- nb-rows 2)) downto 0
          do (loop for col of-type fixnum from 0 to row
                   do (setf (aref arr row col)
                            (the fixnum (+ (aref arr row col)
                                           (the fixnum (max (aref arr (the fixnum (+ 1 row)) col)
                                                            (aref arr (the fixnum (+ 1 row)) (the fixnum (+ 1 col))))))))))
    (aref arr 0 0)))

;;; end
