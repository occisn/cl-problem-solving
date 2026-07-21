;;;; Devil Math Facts puzzles.

(in-package :cl-problem-solving)

;;; Devil Math Facts from various sources.

(defun devil--number->digits (n)
  "Return list of digits of fixnum n (most significant first)."
  (declare (type fixnum n))
  (if (zerop n) '(0)
      (nreverse (loop while (> n 0)
                      collect (the fixnum (mod n 10))
                      do (setf n (the fixnum (floor n 10)))))))

(defun devil-math-fact-2 ()
  "6935 is the smallest number whose cube contains six 3's."
  (loop for n of-type fixnum from 2
        for n3 of-type fixnum = (the fixnum (* n (the fixnum (* n n))))
        when (= 6 (count 3 (devil--number->digits n3)))
          do (return n)))

;;; end
