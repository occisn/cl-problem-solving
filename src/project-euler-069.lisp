(in-package :cl-problem-solving)

;;; Math insight: n/phi(n) is maximized when n has the most small prime factors.
;;; So multiply consecutive primes 2*3*5*7*... until exceeding the limit.

(defun project-euler-069 (&optional (n-stop 1000000))
  "Value of n <= n-stop for which n/phi(n) is maximum."
  (declare (type fixnum n-stop))
  (let ((product 1))
    (declare (type fixnum product))
    (loop for p of-type fixnum = 2 then (let ((next (if (= p 2) 3
                                                        (loop for c of-type fixnum from (the fixnum (+ p 2)) by 2
                                                              when (pe037--primep c) do (return c)))))
                                          next)
          while (<= (the fixnum (* product p)) n-stop)
          do (setf product (the fixnum (* product p))))
    product))

;;; end
