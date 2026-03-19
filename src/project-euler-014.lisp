(in-package :cl-problem-solving)

;;; Array-cached Collatz sequence length computation.
;;; Cache stores lengths for all numbers < nmax; larger intermediates are computed on the fly.

(declaim (inline pe014--next-collatz))
(defun pe014--next-collatz (n)
  "Next value in the Collatz sequence."
  (declare (type fixnum n))
  (if (evenp n) (ash n -1) (the fixnum (+ (the fixnum (* 3 n)) 1))))

(defun project-euler-014 (&optional (nmax 1000000))
  "Find the starting number under nmax that produces the longest Collatz chain."
  (declare (type fixnum nmax))
  (let ((cache (make-array nmax :element-type 'fixnum :initial-element 0))
        (best-start 1)
        (best-len 1))
    (declare (type fixnum best-start best-len))
    (setf (aref cache 1) 1)
    (labels ((collatz-len (n)
               (declare (type fixnum n))
               (if (and (< n nmax) (> (aref cache n) 0))
                   (aref cache n)
                   (let* ((next (pe014--next-collatz n))
                          (len (the fixnum (+ 1 (the fixnum (collatz-len next))))))
                     (declare (type fixnum next len))
                     (when (< n nmax)
                       (setf (aref cache n) len))
                     len))))
      (loop for i of-type fixnum from 2 below nmax
            for len of-type fixnum = (collatz-len i)
            when (> len best-len)
              do (setf best-start i best-len len))
      (values best-start best-len))))

;;; end
