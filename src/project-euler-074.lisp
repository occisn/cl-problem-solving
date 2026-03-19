(in-package :cl-problem-solving)

(defun pe074--digit-factorial-sum (n)
  "Sum of factorials of digits of n."
  (declare (type fixnum n))
  (let ((fact-table #(1 1 2 6 24 120 720 5040 40320 362880))
        (res 0))
    (declare (type fixnum res))
    (loop while (> n 0)
          do (incf res (the fixnum (aref fact-table (the fixnum (mod n 10)))))
             (setf n (the fixnum (floor n 10))))
    res))

(defun pe074--chain-length (n)
  "Length of the non-repeating digit factorial chain starting at n."
  (declare (type fixnum n))
  (let ((seen (make-hash-table :test #'eql)))
    (loop for m of-type fixnum = n then (pe074--digit-factorial-sum m)
          for i of-type fixnum from 0
          until (gethash m seen)
          do (setf (gethash m seen) t)
          finally (return i))))

(defun project-euler-074 ()
  "Count chains with starting number below one million that contain exactly 60 non-repeating terms."
  (loop for n of-type fixnum from 1 below 1000000
        count (= 60 (pe074--chain-length n))))

;;; end
