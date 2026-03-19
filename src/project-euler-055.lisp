(in-package :cl-problem-solving)

(defun pe055--reverse-bigint (n)
  "Reverse the digits of an integer (works with bignums)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type integer n))
  (let ((rev 0))
    (declare (type integer rev))
    (loop while (> n 0)
          do (setf rev (+ (* rev 10) (mod n 10)))
             (setf n (floor n 10)))
    rev))

(defun pe055--palindrome-bigint-p (n)
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (= n (pe055--reverse-bigint n)))

(defun pe055--lychrel-p (n)
  "Check if n is a Lychrel number (no palindrome found in 50 iterations)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop repeat 50
        do (setf n (+ n (pe055--reverse-bigint n)))
           (when (pe055--palindrome-bigint-p n) (return nil))
        finally (return t)))

(defun project-euler-055 ()
  "Count Lychrel numbers below ten thousand."
  (loop for n of-type fixnum from 1 below 10000
        count (pe055--lychrel-p n)))

;;; end
