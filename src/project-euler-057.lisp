(in-package :cl-problem-solving)

(defun project-euler-057 ()
  "In sqrt(2) continued fraction expansions 1..1000, count where numerator has more digits than denominator."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop for i of-type fixnum from 1 to 1000
        for q of-type rational = 3/2 then (+ 1 (/ 1 (+ 1 q)))
        count (> (length (write-to-string (numerator q)))
                 (length (write-to-string (denominator q))))))

;;; end
