(in-package :cl-problem-solving)

(defun project-euler-034 (&optional (lim 1000000))
  "Sum of all numbers equal to the sum of the factorial of their digits."
  (declare (type fixnum lim))
  (let ((fact-table #(1 1 2 6 24 120 720 5040 40320 362880))
        (sum 0))
    (declare (type fixnum sum))
    (loop for n of-type fixnum from 3 to lim
          for s of-type fixnum = (let ((res 0) (m n))
                                   (declare (type fixnum res m))
                                   (loop while (> m 0)
                                         do (incf res (the fixnum (aref fact-table (the fixnum (mod m 10)))))
                                            (setf m (the fixnum (floor m 10))))
                                   res)
          when (= n s) do (incf sum n))
    sum))

;;; end
