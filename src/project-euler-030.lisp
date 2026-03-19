(in-package :cl-problem-solving)

(defun project-euler-030 (&optional (lim 1000000))
  "Sum of all numbers that can be written as the sum of fifth powers of their digits."
  (declare (type fixnum lim))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for n of-type fixnum from 2 to lim
          for s of-type fixnum = (let ((res 0) (m n))
                                   (declare (type fixnum res m))
                                   (loop while (> m 0)
                                         do (let ((d (the fixnum (mod m 10))))
                                              (declare (type fixnum d))
                                              (incf res (the fixnum (* d (the fixnum (* d (the fixnum (* d (the fixnum (* d d)))))))))
                                              (setf m (the fixnum (floor m 10)))))
                                   res)
          when (= n s) do (incf sum n))
    sum))

;;; end
