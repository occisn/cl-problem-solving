;;;; Number theory curiosities from @fermatslibrary.

(in-package :cl-problem-solving)

;;; Various number theory curiosities from Fermat's Library (@fermatslibrary).

(defun fermat--mod-expt (base exp modulus)
  "Compute (BASE ^ EXP) mod MODULUS using binary exponentiation."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer base exp modulus))
  (let ((result 1)
        (b (mod base modulus)))
    (loop while (> exp 0)
          do (when (oddp exp)
               (setf result (mod (* result b) modulus)))
             (setf exp (floor exp 2))
             (setf b (mod (* b b) modulus)))
    result))

(defun fermat--miller-rabin-witness-p (a d n r)
  "Test whether A is a Miller-Rabin witness for compositeness of N.
D and R satisfy N-1 = D * 2^R with D odd."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer a d n)
           (type fixnum r))
  (let ((x (fermat--mod-expt a d n)))
    (when (or (= x 1) (= x (- n 1)))
      (return-from fermat--miller-rabin-witness-p nil))
    (loop for i of-type fixnum from 1 below r
          do (setf x (mod (* x x) n))
             (when (= x (- n 1))
               (return-from fermat--miller-rabin-witness-p nil)))
    t))

(defun fermat--primep-bigint (n)
  "Test primality for integers (including bignums).
Uses trial division for fixnums, deterministic Miller-Rabin for bignums."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer n))
  (cond ((<= n 1) nil)
        ((= n 2) t)
        ((= n 3) t)
        ((evenp n) nil)
        ((<= n most-positive-fixnum) (pe037--primep n))
        (t (let* ((n-1 (- n 1))
                  (d n-1)
                  (r 0))
             (declare (type integer d)
                      (type fixnum r))
             (loop while (evenp d)
                   do (setf d (floor d 2))
                      (incf r))
             (dolist (a '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71))
               (when (>= a n) (return-from fermat--primep-bigint t))
               (when (fermat--miller-rabin-witness-p a d n r)
                 (return-from fermat--primep-bigint nil)))
             t))))

(defun fermat-library-33-as-sum-of-cubes ()
  "33 = 8866128975287528^3 + (-8778405442862239)^3 + (-2736111468807040)^3."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (+ (expt 8866128975287528 3)
     (expt -8778405442862239 3)
     (expt -2736111468807040 3)))

(defun fermat-library-42-as-sum-of-cubes ()
  "42 = (-80538738812075974)^3 + 80435758145817515^3 + 12602123297335631^3."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (+ (expt -80538738812075974 3)
     (expt 80435758145817515 3)
     (expt 12602123297335631 3)))

(defun fermat-library-19-31 (&optional (n 19))
  "N is prime and 19^0 + 19^1 + ... + 19^18 is also prime."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum n))
  (and (pe037--primep n)
       (fermat--primep-bigint
        (loop for i of-type fixnum from 0 below n
              sum (expt n i)))))

(defun fermat-library-116 ()
  "116! + 1 is prime."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (fermat--primep-bigint (+ 1 (let ((f 1))
                                (loop for i from 2 to 116 do (setf f (* f i)))
                                f))))

(defun fermat-library-9-9-9 ()
  "9^9^9 has 369,693,100 digits."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (the fixnum (+ 1 (the fixnum (floor (* (expt 9 9) (log 9.0d0 10)))))))

;;; end
