(in-package :cl-problem-solving)

;;; Count fractions n/d with 1/3 < n/d < 1/2 and gcd(n,d)=1, for d <= dmax.

(defun project-euler-073 (&optional (dmax 12000))
  "Count fractions between 1/3 and 1/2 in the Farey sequence F_dmax."
  (declare (type fixnum dmax))
  (let ((count 0))
    (declare (type fixnum count))
    (loop for d of-type fixnum from 2 to dmax
          do (loop for n of-type fixnum from (the fixnum (+ 1 (the fixnum (floor d 3))))
                     to (the fixnum (- (the fixnum (ceiling d 2)) 1))
                   when (= 1 (gcd n d))
                     do (incf count)))
    count))

;;; end
