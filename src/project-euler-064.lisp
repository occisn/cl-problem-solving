(in-package :cl-problem-solving)

(defun pe064--cf-period-length (n)
  "Length of the continued fraction period of sqrt(n). Returns 0 if n is a perfect square."
  (declare (type fixnum n))
  (let ((a0 (isqrt n)))
    (declare (type fixnum a0))
    (when (= n (* a0 a0)) (return-from pe064--cf-period-length 0))
    (let ((m 0) (d 1) (count 0))
      (declare (type fixnum m d count))
      (loop do (setf m (the fixnum (- (the fixnum (* (the fixnum (floor (the fixnum (+ a0 m)) d)) d)) m)))
               (setf d (the fixnum (floor (the fixnum (- n (the fixnum (* m m)))) d)))
               (incf count)
            until (= d 1))
      count)))

(defun project-euler-064 (&optional (lim 10000))
  "Count square roots with odd continued fraction period for n <= lim."
  (declare (type fixnum lim))
  (loop for n of-type fixnum from 2 to lim
        count (oddp (pe064--cf-period-length n))))

;;; end
