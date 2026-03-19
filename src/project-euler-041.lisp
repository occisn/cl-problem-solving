(in-package :cl-problem-solving)

;;; 8-digit and 9-digit pandigitals are always divisible by 3
;;; (1+2+...+8=36, 1+2+...+9=45), so we only need to check 7-digit and 4-digit.

(defun pe041--vec-to-number (vec n)
  "Convert first n elements of fixnum vector to a number."
  (declare (type (simple-array fixnum (*)) vec) (type fixnum n))
  (let ((res 0))
    (declare (type fixnum res))
    (loop for i of-type fixnum from 0 below n
          do (setf res (the fixnum (+ (the fixnum (* res 10)) (aref vec i)))))
    res))

(defun pe041--for-each-permutation (vec fn)
  "Call FN for each permutation of fixnum vector VEC (Heap's algorithm). VEC is mutated."
  (declare (type (simple-array fixnum (*)) vec) (type function fn))
  (let* ((n (length vec))
         (c (make-array n :element-type 'fixnum :initial-element 0)))
    (declare (type fixnum n))
    (funcall fn)
    (loop with i of-type fixnum = 0
          while (< i n)
          do (if (< (aref c i) i)
                 (progn
                   (if (evenp i)
                       (rotatef (aref vec 0) (aref vec i))
                       (rotatef (aref vec (aref c i)) (aref vec i)))
                   (funcall fn)
                   (incf (aref c i))
                   (setf i 0))
                 (progn
                   (setf (aref c i) 0)
                   (incf i))))))

(defun project-euler-041 ()
  "Largest n-digit pandigital prime."
  (loop for rank of-type fixnum from 7 downto 1
        do (let ((best 0)
                 (vec (make-array rank :element-type 'fixnum)))
             (declare (type fixnum best))
             (loop for i of-type fixnum from 0 below rank
                   do (setf (aref vec i) (the fixnum (+ 1 i))))
             (pe041--for-each-permutation
              vec
              (lambda ()
                (let ((n (pe041--vec-to-number vec rank)))
                  (declare (type fixnum n))
                  (when (and (pe037--primep n) (> n best))
                    (setf best n)))))
             (when (> best 0)
               (return best)))))

;;; end
