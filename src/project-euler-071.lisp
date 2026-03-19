(in-package :cl-problem-solving)

;;; For each denominator q, find largest p/q < 3/7 via p = ceiling(3q/7) - 1.

(defun project-euler-071 (&optional (qmax 1000000))
  "Numerator of the fraction immediately left of 3/7 in the Farey sequence F_qmax."
  (declare (type fixnum qmax))
  (let ((best-num 0)
        (best-den 1))
    (declare (type fixnum best-num best-den))
    (loop for q of-type fixnum from 2 to qmax
          for p of-type fixnum = (the fixnum (- (the fixnum (ceiling (the fixnum (* 3 q)) 7)) 1))
          when (and (> p 0)
                    (> (the fixnum (* p best-den)) (the fixnum (* best-num q))))
            do (setf best-num p best-den q))
    best-num))

;;; end
