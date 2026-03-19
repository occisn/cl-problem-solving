(in-package :cl-problem-solving)

(defun project-euler-052 ()
  "Smallest positive integer x such that 2x, 3x, 4x, 5x, 6x contain the same digits."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop for n of-type fixnum from 1
        for sd = (pe049--sorted-digits n)
        until (and (equal sd (pe049--sorted-digits (the fixnum (* 2 n))))
                   (equal sd (pe049--sorted-digits (the fixnum (* 3 n))))
                   (equal sd (pe049--sorted-digits (the fixnum (* 4 n))))
                   (equal sd (pe049--sorted-digits (the fixnum (* 5 n))))
                   (equal sd (pe049--sorted-digits (the fixnum (* 6 n)))))
        finally (return n)))

;;; end
