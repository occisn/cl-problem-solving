(in-package :cl-problem-solving)

(defun project-euler-033 ()
  "Find the denominator of the product of the four digit-cancelling fractions."
  (let ((prod-num 1)
        (prod-den 1))
    (declare (type fixnum prod-num prod-den))
    ;; Try all fractions a/b where both have 2 digits
    ;; Cancelling a shared digit c should give the same value
    (loop for a of-type fixnum from 1 to 8
          do (loop for b of-type fixnum from (the fixnum (+ a 1)) to 9
                   do (loop for c of-type fixnum from 1 to 9
                            ;; Case: a is tens digit of numerator (ac), c is tens digit of denominator (cb)
                            for num of-type fixnum = (the fixnum (+ (the fixnum (* 10 a)) c))
                            for den of-type fixnum = (the fixnum (+ (the fixnum (* 10 c)) b))
                            when (= (the fixnum (* a den)) (the fixnum (* num b)))
                              do (setf prod-num (the fixnum (* prod-num num)))
                                 (setf prod-den (the fixnum (* prod-den den))))))
    (the fixnum (/ prod-den (the fixnum (gcd (the (integer 1) prod-num) (the (integer 1) prod-den)))))))

;;; end
