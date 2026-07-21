;;;; Project Euler 60.
;;;;
;;;; https://projecteuler.net/problem=60

(in-package :cl-problem-solving)

;;; Build a hash table of prime pairs (p1,p2) where concatenating in both
;;; orders gives primes. Then search for cliques of size 5.

(declaim (inline pe060--concat-numbers))
(defun pe060--concat-numbers (a b)
  "Concatenate integers a and b: 7, 109 -> 7109."
  (declare (type fixnum a b))
  (let ((mult 1))
    (declare (type fixnum mult))
    (loop for m of-type fixnum = b then (the fixnum (floor m 10))
          while (> m 0) do (setf mult (the fixnum (* mult 10))))
    (the fixnum (+ (the fixnum (* a mult)) b))))

(defun project-euler-060 (&optional (lim 10000))
  "Lowest sum for a set of five primes where any two concatenate to another prime."
  (declare (type fixnum lim))
  (let* ((sieve (make-array lim :element-type 'bit :initial-element 0))
         (ht (make-hash-table :test #'eql)))
    ;; Build sieve
    (loop for i of-type fixnum from 2 below lim
          when (zerop (sbit sieve i))
            do (loop for j of-type fixnum from (the fixnum (* i i)) below lim by i
                     do (setf (sbit sieve j) 1)))
    (let ((primes (loop for i of-type fixnum from 2 below lim
                        when (zerop (sbit sieve i)) collect i)))
      ;; Build pair table
      (loop for tail on primes
            for p1 of-type fixnum = (car tail)
            do (loop for p2 of-type fixnum in (cdr tail)
                     when (and (pe037--primep (pe060--concat-numbers p1 p2))
                               (pe037--primep (pe060--concat-numbers p2 p1)))
                       do (push p2 (gethash p1 ht))))
      ;; Reverse stored lists for ordered iteration
      (loop for key being the hash-keys of ht
            do (setf (gethash key ht) (nreverse (gethash key ht))))
      ;; Search for 5-cliques
      (let ((best most-positive-fixnum))
        (declare (type fixnum best))
        (loop for c1 of-type fixnum being the hash-keys of ht
              for peers1 = (gethash c1 ht)
              when (>= (length (the list peers1)) 4)
                do (dolist (c2 peers1)
                     (declare (type fixnum c2))
                     (let ((peers2 (gethash c2 ht)))
                       (dolist (c3 peers1)
                         (declare (type fixnum c3))
                         (when (and (> c3 c2) (member c3 peers2))
                           (let ((peers3 (gethash c3 ht)))
                             (dolist (c4 peers1)
                               (declare (type fixnum c4))
                               (when (and (> c4 c3)
                                          (member c4 peers2)
                                          (member c4 peers3))
                                 (let ((peers4 (gethash c4 ht)))
                                   (dolist (c5 peers1)
                                     (declare (type fixnum c5))
                                     (when (and (> c5 c4)
                                                (member c5 peers2)
                                                (member c5 peers3)
                                                (member c5 peers4))
                                       (let ((s (the fixnum (+ c1 (the fixnum (+ c2 (the fixnum (+ c3 (the fixnum (+ c4 c5))))))))))
                                         (when (< s best) (setf best s))))))))))))))
        (if (< best most-positive-fixnum) best nil)))))

;;; end
