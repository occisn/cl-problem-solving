(in-package :cl-problem-solving)

;;; Bottom-up iteration: fill grid from bottom-right to top-left.
;;; Each cell = sum of cell below + cell to the right.
;;; Equivalent to computing C(2n, n) but generalizes to non-square grids.

(defun project-euler-015 (&optional (n 20))
  "Count lattice paths through an n x n grid, moving only right and down."
  (declare (type fixnum n))
  (let ((grid (make-array (list (the fixnum (+ 1 n)) (the fixnum (+ 1 n)))
                          :element-type 'fixnum :initial-element 1)))
    (loop for x of-type fixnum from (the fixnum (- n 1)) downto 0
          do (loop for y of-type fixnum from (the fixnum (- n 1)) downto 0
                   do (setf (aref grid x y)
                            (the fixnum (+ (aref grid (the fixnum (+ 1 x)) y)
                                           (aref grid x (the fixnum (+ 1 y))))))))
    (aref grid 0 0)))

;;; end
