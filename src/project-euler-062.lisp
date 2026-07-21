;;;; Project Euler 62.
;;;;
;;;; https://projecteuler.net/problem=62

(in-package :cl-problem-solving)

;;; Hash table approach: group cubes by sorted digits, find first group of target size.

(defun project-euler-062 (&optional (target 5))
  "Smallest cube for which exactly target permutations of its digits are also cubes."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum target))
  (let ((cache (make-hash-table :test 'equalp)))
    (loop for i of-type fixnum from 1
          for n = (* i (* i i))
          for key = (pe049--sorted-digits n)
          for already = (gethash key cache)
          do (if (= (the fixnum (- target 1)) (length already))
                 (return (car (last already)))
                 (setf (gethash key cache) (cons n already))))))

;;; end
