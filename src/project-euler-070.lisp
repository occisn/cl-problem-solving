(in-package :cl-problem-solving)

;;; n/phi(n) is minimized when n is a product of two large primes near sqrt(10^7).
;;; Check products of two primes in range [2000, 4000].

(defun project-euler-070 ()
  "Find n < 10^7 where phi(n) is a digit permutation of n and n/phi(n) is minimized."
  (let* ((limit 10000000)
         (sieve (make-array 4001 :element-type 'bit :initial-element 0)))
    (declare (type fixnum limit))
    ;; Build sieve for primes up to 4000
    (loop for i of-type fixnum from 2 to 4000
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) to 4000 by i
                     do (setf (sbit sieve j) 1)))
    (let ((primes (loop for i of-type fixnum from 2000 to 4000
                        when (zerop (sbit sieve i)) collect i))
          (best-n 0)
          (best-ratio 1.0d10))
      (declare (type fixnum best-n) (type double-float best-ratio))
      (dolist (p1 primes)
        (declare (type fixnum p1))
        (dolist (p2 primes)
          (declare (type fixnum p2))
          (when (>= p2 p1)
            (let ((n (the fixnum (* p1 p2))))
              (declare (type fixnum n))
              (when (< n limit)
                (let* ((tot (the fixnum (* (the fixnum (- p1 1)) (the fixnum (- p2 1)))))
                       (ratio (/ (coerce n 'double-float) (coerce tot 'double-float))))
                  (declare (type fixnum tot) (type double-float ratio))
                  (when (and (< ratio best-ratio)
                             (equal (pe049--sorted-digits n) (pe049--sorted-digits tot)))
                    (setf best-n n best-ratio ratio))))))))
      best-n)))

;;; end
