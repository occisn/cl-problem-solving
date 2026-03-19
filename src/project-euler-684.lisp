(in-package :cl-problem-solving)

;;; s(n) = smallest number with digit sum n = 10^(n div 9) * (1 + n mod 9) - 1.
;;; S(n) = sum_{k=1}^{n} s(k), computed using a closed form for blocks of 9.

(defun pe684--mod-expt (base exp modulus)
  "Compute base^exp mod modulus."
  (declare (type fixnum base modulus) (type integer exp))
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((result 1)
        (b (mod base modulus)))
    (declare (type fixnum result b))
    (loop while (> exp 0)
          do (when (oddp exp)
               (setf result (the fixnum (mod (the fixnum (* result b)) modulus))))
             (setf exp (ash exp -1))
             (setf b (the fixnum (mod (the fixnum (* b b)) modulus))))
    result))

(defun pe684--s-mod (n modulus)
  "s(n) mod modulus."
  (declare (type integer n) (type fixnum modulus))
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((q (floor n 9))
        (r (mod n 9)))
    (declare (type integer q) (type fixnum r))
    (mod (- (* (pe684--mod-expt 10 q modulus) (+ 1 r)) 1) modulus)))

(defun pe684--grand-S-mod (n modulus)
  "S(n) = sum_{k=1}^{n} s(k), mod modulus."
  (declare (type integer n) (type fixnum modulus))
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let* ((m (floor n 9))
         ;; S(9m-1) = 5*(10^m - 1) - 9m
         (res (mod (- (* 5 (- (pe684--mod-expt 10 m modulus) 1)) (mod (* 9 m) modulus)) modulus)))
    (declare (type integer m) (type fixnum res))
    ;; Add remaining terms s(9m)..s(n)
    (loop for k of-type integer from (* 9 m) to n
          do (setf res (the fixnum (mod (the fixnum (+ res (pe684--s-mod k modulus))) modulus))))
    res))

(defun project-euler-684 (&optional (lim 90))
  "Sum of S(f_k) for k=2..lim where f_k is the k-th Fibonacci number, mod 1000000007."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum lim))
  (let ((modulus 1000000007)
        (res 0))
    (declare (type fixnum modulus res))
    (loop for i of-type fixnum from 1
          for f1 of-type integer = 0 then f2
          and f2 of-type integer = 1 then (+ f1 f2)
          while (<= i lim)
          when (>= i 2)
            do (setf res (the fixnum (mod (the fixnum (+ res (pe684--grand-S-mod f2 modulus))) modulus))))
    res))

;;; end
