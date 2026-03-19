(in-package :cl-problem-solving)

(defun pe024--next-lexicographic-permutation (vec)
  "Advance string VEC to its next lexicographic permutation in place. Returns VEC or NIL if last."
  (declare (type (simple-array character (*)) vec))
  (macrolet ((el (i) `(aref vec ,i)))
    (loop with len of-type fixnum = (the fixnum (- (length vec) 1))
          for i of-type fixnum from (the fixnum (- len 1)) downto 0
          when (char< (el i) (el (the fixnum (+ 1 i))))
            do (loop for k of-type fixnum from len downto i
                     when (char< (el i) (el k)) do
                       (rotatef (el i) (el k))
                       (setf k (the fixnum (+ 1 len)))
                       (loop while (< (incf i) (decf k)) do
                         (rotatef (el i) (el k)))
                       (return-from pe024--next-lexicographic-permutation vec)))))

(defun project-euler-024 ()
  "The millionth lexicographic permutation of digits 0-9."
  (let ((str (make-array 10 :element-type 'character :initial-contents "0123456789")))
    (loop for i of-type fixnum from 1 below 1000000
          do (pe024--next-lexicographic-permutation str))
    (parse-integer str)))

;;; end
