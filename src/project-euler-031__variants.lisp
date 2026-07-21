;;;; Project Euler 31: alternative implementations.
;;;;
;;;; https://projecteuler.net/problem=31

(in-package :cl-problem-solving)

;;; Variant: brute-force nested loops (original approach)

(defun project-euler-031--nested-loops (&optional (n 200))
  "Number of ways to make n pence, by exhaustive nested loops."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for n200 of-type fixnum from 0 to (floor n 200)
          for r200 of-type fixnum = (the fixnum (- n (the fixnum (* 200 n200))))
          do (loop for n100 of-type fixnum from 0 to (floor r200 100)
                   for r100 of-type fixnum = (the fixnum (- r200 (the fixnum (* 100 n100))))
                   do (loop for n50 of-type fixnum from 0 to (floor r100 50)
                            for r50 of-type fixnum = (the fixnum (- r100 (the fixnum (* 50 n50))))
                            do (loop for n20 of-type fixnum from 0 to (floor r50 20)
                                     for r20 of-type fixnum = (the fixnum (- r50 (the fixnum (* 20 n20))))
                                     do (loop for n10 of-type fixnum from 0 to (floor r20 10)
                                              for r10 of-type fixnum = (the fixnum (- r20 (the fixnum (* 10 n10))))
                                              do (loop for n5 of-type fixnum from 0 to (floor r10 5)
                                                       for r5 of-type fixnum = (the fixnum (- r10 (the fixnum (* 5 n5))))
                                                       do (incf sum (the fixnum (+ 1 (the fixnum (floor r5 2)))))))))))
    sum))

;;; end
