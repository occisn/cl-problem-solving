(in-package :cl-problem-solving)

;;; Variant 1: brute-force recursion (exponential time, works for small triangles)

(defun project-euler-018--brute-force (&optional (triangle +pe018-triangle+))
  "Maximum path sum by brute-force recursion."
  (declare (type list triangle))
  (let* ((arr (pe018--triangle-to-2d-array triangle))
         (nb-rows (length triangle)))
    (declare (type fixnum nb-rows)
             (type (simple-array fixnum (* *)) arr))
    (labels ((sub (row col)
               (declare (type fixnum row col))
               (if (= row (the fixnum (- nb-rows 1)))
                   (aref arr row col)
                   (the fixnum (+ (aref arr row col)
                                  (the fixnum (max (the fixnum (sub (the fixnum (+ 1 row)) col))
                                                   (the fixnum (sub (the fixnum (+ 1 row)) (the fixnum (+ 1 col)))))))))))
      (sub 0 0))))

;;; Variant 2: memoized recursion with array

(defun project-euler-018--memo-array (&optional (triangle +pe018-triangle+))
  "Maximum path sum by memoized recursion."
  (declare (type list triangle))
  (let* ((arr (pe018--triangle-to-2d-array triangle))
         (nb-rows (length triangle))
         (memo (make-array (list nb-rows nb-rows) :element-type 'fixnum :initial-element -1)))
    (declare (type fixnum nb-rows)
             (type (simple-array fixnum (* *)) arr memo))
    (labels ((sub (row col)
               (declare (type fixnum row col))
               (cond ((>= (aref memo row col) 0) (aref memo row col))
                     ((= row (the fixnum (- nb-rows 1)))
                      (setf (aref memo row col) (aref arr row col)))
                     (t (setf (aref memo row col)
                              (the fixnum (+ (aref arr row col)
                                             (the fixnum (max (the fixnum (sub (the fixnum (+ 1 row)) col))
                                                              (the fixnum (sub (the fixnum (+ 1 row)) (the fixnum (+ 1 col)))))))))))))
      (sub 0 0))))

;;; end
