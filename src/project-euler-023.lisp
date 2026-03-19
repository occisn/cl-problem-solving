(in-package :cl-problem-solving)

(defun project-euler-023 ()
  "Sum of all positive integers that cannot be written as the sum of two abundant numbers."
  (let* ((limit 28123)
         (abundants (loop for n of-type fixnum from 1 to limit
                         when (> (the fixnum (pe021--sum-of-proper-divisors n)) n) collect n))
         (is-sum (make-array (the fixnum (+ 1 limit)) :element-type 'bit :initial-element 0)))
    (declare (type fixnum limit))
    (loop for remain of-type list on abundants
          for a of-type fixnum = (car remain)
          do (loop for b of-type fixnum in remain
                   for s of-type fixnum = (the fixnum (+ a b))
                   while (<= s limit)
                   do (setf (sbit is-sum s) 1)))
    (let ((sum 0))
      (declare (type fixnum sum))
      (loop for i of-type fixnum from 1 to limit
            when (zerop (sbit is-sum i))
              do (incf sum i))
      sum)))

;;; end
