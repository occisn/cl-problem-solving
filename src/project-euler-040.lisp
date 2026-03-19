(in-package :cl-problem-solving)

(defun pe040--champernowne-digit (m)
  "Return the m-th digit of Champernowne's constant (1-indexed)."
  (declare (type fixnum m))
  (loop for digits of-type fixnum from 1
        for count of-type fixnum = 9 then (the fixnum (* count 10))
        for start of-type fixnum = 1 then (the fixnum (* start 10))
        for total of-type fixnum = (the fixnum (* digits count))
        do (if (<= m total)
               (multiple-value-bind (q r) (floor (the fixnum (- m 1)) digits)
                 (declare (type fixnum q r))
                 (let* ((number (the fixnum (+ start q)))
                        (s (write-to-string number)))
                   (return (the fixnum (- (char-code (char s r)) 48)))))
               (decf m total))))

(defun project-euler-040 ()
  "Product of d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000 of Champernowne's constant."
  (the fixnum (* (pe040--champernowne-digit 1)
                 (the fixnum (* (pe040--champernowne-digit 10)
                                (the fixnum (* (pe040--champernowne-digit 100)
                                               (the fixnum (* (pe040--champernowne-digit 1000)
                                                              (the fixnum (* (pe040--champernowne-digit 10000)
                                                                             (the fixnum (* (pe040--champernowne-digit 100000)
                                                                                            (pe040--champernowne-digit 1000000))))))))))))))

;;; end
