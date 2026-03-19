(in-package :cl-problem-solving)

(declaim (inline pe044--pentagonal))
(defun pe044--pentagonal (n)
  "N-th pentagonal number."
  (declare (type fixnum n))
  (the fixnum (ash (the fixnum (* n (the fixnum (- (the fixnum (* 3 n)) 1)))) -1)))

(declaim (inline pe044--pentagonal-p))
(defun pe044--pentagonal-p (x)
  "Check if x is a pentagonal number using the inverse formula."
  (declare (type fixnum x))
  (let* ((discriminant (the fixnum (+ 1 (the fixnum (* 24 x)))))
         (root (isqrt discriminant)))
    (declare (type fixnum discriminant root))
    (and (= discriminant (the fixnum (* root root)))
         (= 5 (the fixnum (mod root 6))))))

(defun project-euler-044 ()
  "Find the pair of pentagonal numbers whose sum and difference are pentagonal, minimizing |Pk-Pj|."
  (block outer
    (loop for k of-type fixnum from 2
          for pk of-type fixnum = (pe044--pentagonal k)
          do (loop for j of-type fixnum from (the fixnum (- k 1)) downto 1
                   for pj of-type fixnum = (pe044--pentagonal j)
                   for d of-type fixnum = (the fixnum (- pk pj))
                   when (and (pe044--pentagonal-p d)
                             (pe044--pentagonal-p (the fixnum (+ pj pk))))
                     do (return-from outer d)))))

;;; end
