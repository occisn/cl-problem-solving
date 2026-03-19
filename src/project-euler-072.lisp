(in-package :cl-problem-solving)

;;; |F_n| = 1 + sum_{d=1}^{n} phi(d). Use a totient sieve for efficiency.

(defun project-euler-072 (&optional (qmax 1000000))
  "Number of reduced proper fractions with denominator <= qmax."
  (declare (type fixnum qmax))
  ;; Totient sieve: initialize phi[i]=i, then for each prime p, multiply phi[k] by (1-1/p)
  (let ((phi (make-array (the fixnum (+ 1 qmax)) :element-type 'fixnum)))
    (declare (type (simple-array fixnum (*)) phi))
    (loop for i of-type fixnum from 0 to qmax do (setf (aref phi i) i))
    (loop for p of-type fixnum from 2 to qmax
          when (= (aref phi p) p) ;; p is prime
            do (loop for k of-type fixnum from p to qmax by p
                     do (setf (aref phi k) (the fixnum (- (aref phi k) (the fixnum (floor (aref phi k) p)))))))
    ;; Sum phi[2] through phi[qmax]
    (let ((sum 0))
      (declare (type fixnum sum))
      (loop for d of-type fixnum from 2 to qmax
            do (incf sum (aref phi d)))
      sum)))

;;; end
