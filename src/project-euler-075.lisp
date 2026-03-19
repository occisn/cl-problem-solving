(in-package :cl-problem-solving)

;;; Count perimeters with exactly one Pythagorean triple, using Euclid's formula for
;;; primitive triples: a=m^2-n^2, b=2mn, c=m^2+n^2 where m>n>0, gcd(m,n)=1, m-n odd.

(defun project-euler-075 (&optional (pmax 1500000))
  "Count perimeters <= pmax that can be formed by exactly one integer right triangle."
  (declare (type fixnum pmax))
  (let ((counts (make-array (the fixnum (+ 1 pmax)) :element-type 'fixnum :initial-element 0)))
    (declare (type (simple-array fixnum (*)) counts))
    ;; Generate all primitive Pythagorean triples via Euclid's formula
    (loop for m of-type fixnum from 2
          while (<= (the fixnum (* 2 (the fixnum (* m (the fixnum (+ m 1)))))) pmax)
          do (loop for n of-type fixnum from 1 below m
                   when (and (oddp (the fixnum (- m n)))
                             (= 1 (gcd m n)))
                     do (let* ((a (the fixnum (- (the fixnum (* m m)) (the fixnum (* n n)))))
                               (b (the fixnum (* 2 (the fixnum (* m n)))))
                               (c (the fixnum (+ (the fixnum (* m m)) (the fixnum (* n n)))))
                               (p (the fixnum (+ a (the fixnum (+ b c))))))
                          (declare (type fixnum a b c p))
                          ;; Count all multiples k*p <= pmax
                          (loop for kp of-type fixnum from p to pmax by p
                                do (incf (aref counts kp))))))
    ;; Count perimeters with exactly 1 solution
    (loop for i of-type fixnum from 1 to pmax
          count (= 1 (aref counts i)))))

;;; end
