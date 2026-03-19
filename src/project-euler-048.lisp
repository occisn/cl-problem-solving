(in-package :cl-problem-solving)

;;; Modular exponentiation to avoid bignum arithmetic.

(declaim (inline pe048--mod-expt))
(defun pe048--mod-expt (base exp modulus)
  "Compute base^exp mod modulus using repeated squaring."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum base exp modulus))
  (let ((result 1)
        (b (mod base modulus)))
    (declare (type fixnum result b))
    (loop while (> exp 0)
          do (when (oddp exp)
               (setf result (the fixnum (mod (* result b) modulus))))
             (setf exp (ash exp -1))
             (setf b (the fixnum (mod (* b b) modulus))))
    result))

(defun project-euler-048 ()
  "Last ten digits of 1^1 + 2^2 + 3^3 + ... + 1000^1000."
  (let ((modulus 10000000000)
        (sum 0))
    (declare (type fixnum modulus sum))
    (loop for i of-type fixnum from 1 to 1000
          do (incf sum (pe048--mod-expt i i modulus))
             (setf sum (the fixnum (mod sum modulus))))
    sum))

;;; end
