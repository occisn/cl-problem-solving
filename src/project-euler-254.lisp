(in-package :cl-problem-solving)

;;; sf(n) = sum of digits of f(n), where f(n) = sum of factorials of digits of n.
;;; g(i) = smallest n such that sf(n) = i.
;;; Answer = sum of digit sums of g(i) for i = 1..20.

(defun pe254--digit-factorial-sum (n)
  "f(n): sum of factorials of digits of n."
  (declare (type fixnum n))
  (let ((fact-table #(1 1 2 6 24 120 720 5040 40320 362880))
        (res 0))
    (declare (type fixnum res))
    (loop while (> n 0)
          do (incf res (the fixnum (aref fact-table (the fixnum (mod n 10)))))
             (setf n (the fixnum (floor n 10))))
    res))

(defun pe254--sum-of-digits (n)
  "Sum of digits of n."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop while (> n 0)
          do (incf sum (the fixnum (mod n 10)))
             (setf n (the fixnum (floor n 10))))
    sum))

(defun project-euler-254 (&optional (lim 20))
  "Sum of s(g(i)) for i from 1 to lim, where g(i) = min{n : sf(n) = i}."
  (declare (type fixnum lim))
  (let ((cache (make-hash-table :test #'eql))
        (result 0))
    (declare (type fixnum result))
    ;; Build cache: for each n, compute sf(n), store smallest n for each sf value
    (loop for n of-type fixnum from 1
          for sf of-type fixnum = (pe254--sum-of-digits (pe254--digit-factorial-sum n))
          until (= (hash-table-count cache) lim)
          do (when (and (<= 1 sf lim) (not (gethash sf cache)))
               (setf (gethash sf cache) n)))
    ;; Sum s(g(i)) for i = 1..lim
    (loop for i of-type fixnum from 1 to lim
          for g = (gethash i cache)
          when g do (incf result (pe254--sum-of-digits g)))
    result))

;;; end
