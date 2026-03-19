(in-package :cl-problem-solving)

;;; Classic dynamic programming coin change — bottom-up, O(n * num_coins) time.

(defun project-euler-031 (&optional (n 200))
  "Number of ways to make n pence using British coins."
  (declare (type fixnum n))
  (let ((ways (make-array (the fixnum (+ 1 n)) :element-type 'fixnum :initial-element 0)))
    (declare (type (simple-array fixnum (*)) ways))
    (setf (aref ways 0) 1)
    (dolist (coin '(1 2 5 10 20 50 100 200))
      (declare (type fixnum coin))
      (loop for amount of-type fixnum from coin to n
            do (incf (aref ways amount) (aref ways (the fixnum (- amount coin))))))
    (aref ways n)))

;;; end
