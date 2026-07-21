;;;; Project Euler 51.
;;;;
;;;; https://projecteuler.net/problem=51

(in-package :cl-problem-solving)

;;; For each number, try all bitmasks of digit positions to replace with the same digit.
;;; Count how many of the 10 resulting numbers are prime (using sieve).

(defun project-euler-051 (&optional (target 8))
  "Smallest prime which, by replacing part of the number with the same digit,
is part of a target-prime value family."
  (declare (type fixnum target))
  (let* ((limit 1000000)
         (sieve (make-array limit :element-type 'bit :initial-element 0))
         (digits (make-array 7 :element-type 'fixnum)))
    (declare (type fixnum limit))
    ;; Build sieve
    (loop for i of-type fixnum from 2 below limit
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) below limit by i
                     do (setf (sbit sieve j) 1)))
    ;; Search
    (loop for n of-type fixnum from 10 below limit
          for nd of-type fixnum = (let ((c 0) (m n))
                                    (declare (type fixnum c m))
                                    (loop while (> m 0) do (incf c) (setf m (the fixnum (floor m 10))))
                                    c)
          do ;; Fill digits array (most significant first)
             (let ((m n))
               (declare (type fixnum m))
               (loop for i of-type fixnum from (the fixnum (- nd 1)) downto 0
                     do (setf (aref digits i) (the fixnum (mod m 10)))
                        (setf m (the fixnum (floor m 10)))))
             ;; Try all non-empty proper subsets of positions
             (loop for mask of-type fixnum from 1 below (the fixnum (- (the fixnum (ash 1 nd)) 1))
                   do (let ((count 0) (first-prime 0))
                        (declare (type fixnum count first-prime))
                        (loop for d of-type fixnum from 0 to 9
                              when (not (and (= d 0) (logbitp 0 mask)))
                                do (let ((num 0))
                                     (declare (type fixnum num))
                                     (loop for i of-type fixnum from 0 below nd
                                           do (setf num (the fixnum (+ (the fixnum (* num 10))
                                                                       (if (logbitp i mask) d (aref digits i))))))
                                     (when (and (>= num 10) (< num limit) (zerop (sbit sieve num)))
                                       (incf count)
                                       (when (= count 1) (setf first-prime num)))))
                        (when (>= count target)
                          (return-from project-euler-051 first-prime)))))))

;;; end
