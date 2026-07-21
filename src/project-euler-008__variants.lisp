;;;; Project Euler 8: alternative implementations.
;;;;
;;;; https://projecteuler.net/problem=8

(in-package :cl-problem-solving)

;;; Variant 1: list-of-digits approach (from cl-problem-solving-3)
;;; Converts the 1000-digit number to a bignum, extracts digits as a list,
;;; then slides a window with subseq + apply #'*.

(declaim (inline pe008--number->digits--bigint))
(defun pe008--number->digits--bigint (n)
  "Convert a bignum to a list of its digits."
  (declare (type integer n))
  ;; Bignum arithmetic: generic ops unavoidable since n exceeds fixnum range
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((digits nil))
    (loop while (> n 0)
          do (multiple-value-bind (q r) (floor n 10)
               (push r digits)
               (setf n q)))
    digits))

(defun project-euler-008--list-of-digits (&optional (n 13))
  "Solve PE8 by converting to bignum then extracting digits as a list."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let* ((strings '("73167176531330624919225119674426574742355349194934"
                     "96983520312774506326239578318016984801869478851843"
                     "85861560789112949495459501737958331952853208805511"
                     "12540698747158523863050715693290963295227443043557"
                     "66896648950445244523161731856403098711121722383113"
                     "62229893423380308135336276614282806444486645238749"
                     "30358907296290491560440772390713810515859307960866"
                     "70172427121883998797908792274921901699720888093776"
                     "65727333001053367881220235421809751254540594752243"
                     "52584907711670556013604839586446706324415722155397"
                     "53697817977846174064955149290862569321978468622482"
                     "83972241375657056057490261407972968652414535100474"
                     "82166370484403199890008895243450658541227588666881"
                     "16427171479924442928230863465674813919123162824586"
                     "17866458359124566529476545682848912883142607690042"
                     "24219022671055626321111109370544217506941658960408"
                     "07198403850962455444362981230987879927244284909188"
                     "84580156166097919133875499200524063689912560717606"
                     "05886116467109405077541002256983155200055935729725"
                     "71636269561882670428252483600823257530420752963450"))
         (one-string (apply #'concatenate (cons 'string strings)))
         (the-number-as-bigint (parse-integer one-string))
         (digits (pe008--number->digits--bigint the-number-as-bigint)))
    (declare (type list digits))
    (loop for l of-type list on digits
          until (< (length l) n)
          maximize (the fixnum (apply #'* (subseq l 0 n))))))

;;; Variant 2: integer-arithmetic approach (from cl-problem-solving-3)
;;; Works with the bignum directly, extracting n-digit windows via mod/floor.

(declaim (inline pe008--product-of-digits))
(defun pe008--product-of-digits (n)
  "Multiply all digits of a non-negative integer."
  (declare (type integer n))
  ;; Bignum arithmetic: generic ops unavoidable since n exceeds fixnum range
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((prod 1))
    (declare (type fixnum prod))
    (loop while (> n 0)
          do (multiple-value-bind (q r) (floor n 10)
               (declare (type fixnum r))
               (setf prod (the fixnum (* prod r)))
               (setf n q)))
    prod))

(defun project-euler-008--integer-arithmetic (&optional (n 13))
  "Solve PE8 using integer arithmetic on the bignum directly."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum n))
  (let* ((strings '("73167176531330624919225119674426574742355349194934"
                     "96983520312774506326239578318016984801869478851843"
                     "85861560789112949495459501737958331952853208805511"
                     "12540698747158523863050715693290963295227443043557"
                     "66896648950445244523161731856403098711121722383113"
                     "62229893423380308135336276614282806444486645238749"
                     "30358907296290491560440772390713810515859307960866"
                     "70172427121883998797908792274921901699720888093776"
                     "65727333001053367881220235421809751254540594752243"
                     "52584907711670556013604839586446706324415722155397"
                     "53697817977846174064955149290862569321978468622482"
                     "83972241375657056057490261407972968652414535100474"
                     "82166370484403199890008895243450658541227588666881"
                     "16427171479924442928230863465674813919123162824586"
                     "17866458359124566529476545682848912883142607690042"
                     "24219022671055626321111109370544217506941658960408"
                     "07198403850962455444362981230987879927244284909188"
                     "84580156166097919133875499200524063689912560717606"
                     "05886116467109405077541002256983155200055935729725"
                     "71636269561882670428252483600823257530420752963450"))
         (one-string (apply #'concatenate (cons 'string strings)))
         (the-number-as-bigint (parse-integer one-string))
         (ten-power-n (expt 10 n))
         (res 0))
    (declare (type fixnum res)
             (type integer ten-power-n the-number-as-bigint))
    (loop for nb of-type integer = the-number-as-bigint then (floor nb 10)
          for r of-type integer = (mod nb ten-power-n)
          for prod of-type fixnum = (pe008--product-of-digits r)
          while (>= nb ten-power-n)
          when (> prod res) do (setq res prod))
    res))

;;; end
