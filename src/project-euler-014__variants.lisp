(in-package :cl-problem-solving)

;;; Variant: no cache, direct computation (slower)

(defun project-euler-014--no-cache (&optional (nmax 1000000))
  "Find the starting number under nmax that produces the longest Collatz chain (no cache)."
  (declare (type fixnum nmax))
  (loop with best-start of-type fixnum = 0
        with best-len of-type fixnum = 0
        for start of-type fixnum from 1 below nmax
        for len of-type fixnum = (let ((count 1))
                                   (declare (type fixnum count))
                                   (loop for n of-type fixnum = start then (pe014--next-collatz n)
                                         until (= n 1)
                                         do (incf count))
                                   count)
        when (> len best-len)
          do (setf best-start start best-len len)
        finally (return (values best-start best-len))))

;;; end
