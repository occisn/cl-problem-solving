(in-package :cl-problem-solving)

(declaim (inline pe037--primep))
(defun pe037--primep (n)
  "Test primality by trial division."
  (declare (type fixnum n))
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((evenp n) nil)
        (t (loop for i of-type fixnum from 3 by 2
                 with root-n of-type fixnum = (isqrt n)
                 while (<= i root-n)
                 never (zerop (mod n i))))))

(declaim (inline pe037--floor-to-power-of-10))
(defun pe037--floor-to-power-of-10 (n)
  "Largest power of 10 <= n."
  (declare (type fixnum n))
  (loop for p of-type fixnum = 1 then (the fixnum (* p 10))
        while (<= (the fixnum (* p 10)) n)
        finally (return p)))

(defun project-euler-037 (&optional (target 11))
  "Sum of the eleven primes that are truncatable from both left and right."
  (declare (type fixnum target))
  (let ((nb 0) (sum 0))
    (declare (type fixnum nb sum))
    (loop for p of-type fixnum from 11 by 2
          while (< nb target)
          when (and (pe037--primep p)
                    ;; truncate from right
                    (loop for a of-type fixnum = (the fixnum (floor p 10)) then (the fixnum (floor a 10))
                          always (pe037--primep a)
                          until (<= a 9))
                    ;; truncate from left
                    (loop for f of-type fixnum = (pe037--floor-to-power-of-10 p) then (the fixnum (floor f 10))
                          for a of-type fixnum = (the fixnum (mod p f)) then (the fixnum (mod a f))
                          always (pe037--primep a)
                          until (<= a 9)))
            do (incf nb) (incf sum p))
    sum))

;;; end
