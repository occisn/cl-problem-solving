;;;; Project Euler 32.
;;;;
;;;; https://projecteuler.net/problem=32

(in-package :cl-problem-solving)

(declaim (inline pe032--digits-mask))
(defun pe032--digits-mask (n)
  "Return a bitmask of digits in n, or -1 if any digit is 0 or repeated."
  (declare (type fixnum n))
  (let ((mask 0))
    (declare (type fixnum mask))
    (loop while (> n 0)
          do (let ((d (the fixnum (mod n 10))))
               (declare (type fixnum d))
               (when (or (zerop d) (logbitp d mask))
                 (return-from pe032--digits-mask -1))
               (setf mask (the fixnum (logior mask (the fixnum (ash 1 d)))))
               (setf n (the fixnum (floor n 10)))))
    mask))

(defun project-euler-032 ()
  "Sum of all products whose multiplicand/multiplier/product is 1-9 pandigital."
  (let ((products (make-hash-table :test #'eql))
        (target #b1111111110))
    (declare (type fixnum target))
    ;; 1-digit * 4-digit = 4-digit (1+4+4=9)
    (loop for a of-type fixnum from 1 to 9
          for ma of-type fixnum = (pe032--digits-mask a)
          do (loop for b of-type fixnum from 1234 to 9876
                   for p of-type fixnum = (the fixnum (* a b))
                   when (<= 1000 p 9999)
                     do (let ((mb (pe032--digits-mask b)))
                          (declare (type fixnum mb))
                          (when (and (>= mb 0)
                                     (zerop (the fixnum (logand ma mb))))
                            (let ((mp (pe032--digits-mask p)))
                              (declare (type fixnum mp))
                              (when (= target (the fixnum (logior ma (the fixnum (logior mb mp)))))
                                (setf (gethash p products) t)))))))
    ;; 2-digit * 3-digit = 4-digit (2+3+4=9)
    (loop for a of-type fixnum from 12 to 98
          for ma of-type fixnum = (pe032--digits-mask a)
          when (>= ma 0)
            do (loop for b of-type fixnum from 123 to 987
                     for p of-type fixnum = (the fixnum (* a b))
                     when (<= 1000 p 9999)
                       do (let ((mb (pe032--digits-mask b)))
                            (declare (type fixnum mb))
                            (when (and (>= mb 0)
                                       (zerop (the fixnum (logand ma mb))))
                              (let ((mp (pe032--digits-mask p)))
                                (declare (type fixnum mp))
                                (when (= target (the fixnum (logior ma (the fixnum (logior mb mp)))))
                                  (setf (gethash p products) t)))))))
    (let ((sum 0))
      (declare (type fixnum sum))
      (maphash (lambda (k v) (declare (type fixnum k) (ignore v)) (incf sum k)) products)
      sum)))

;;; end
