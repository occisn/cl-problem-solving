(in-package :cl-problem-solving)

(declaim (inline pe049--sorted-digits))
(defun pe049--sorted-digits (n)
  "Return sorted list of digits of n."
  (declare (type fixnum n))
  (sort (loop while (> n 0)
             collect (the fixnum (mod n 10))
             do (setf n (the fixnum (floor n 10))))
        #'<))

(defun project-euler-049 ()
  "Find the 12-digit number formed by concatenating the three terms of the
4-digit prime permutation arithmetic sequence (other than 1487/4817/8147)."
  (let ((sieve (make-array 10000 :element-type 'bit :initial-element 0)))
    ;; Build sieve
    (loop for i of-type fixnum from 2 below 10000
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) below 10000 by i
                     do (setf (sbit sieve j) 1)))
    ;; Collect 4-digit primes
    (let ((primes (loop for i of-type fixnum from 1000 below 10000
                        when (zerop (sbit sieve i)) collect i)))
      (dolist (p1 primes)
        (declare (type fixnum p1))
        (let ((d1 (pe049--sorted-digits p1)))
          (dolist (p2 primes)
            (declare (type fixnum p2))
            (when (> p2 p1)
              (let ((p3 (the fixnum (+ p2 (the fixnum (- p2 p1))))))
                (declare (type fixnum p3))
                (when (and (< p3 10000)
                           (zerop (sbit sieve p3))
                           (equal d1 (pe049--sorted-digits p2))
                           (equal d1 (pe049--sorted-digits p3))
                           (/= p1 1487))
                  (return-from project-euler-049
                    (the fixnum (+ (the fixnum (* 100000000 p1))
                                   (the fixnum (* 10000 p2))
                                   p3))))))))))))

;;; end
