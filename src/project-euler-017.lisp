;;;; Project Euler 17.
;;;;
;;;; https://projecteuler.net/problem=17

(in-package :cl-problem-solving)

;;; Uses CL's built-in ~R format directive for English words,
;;; with British "and" convention for hundreds.

(defun pe017--integer->english (n)
  "Convert integer to English text (British usage with 'and').
For instance: 342 --> \"three hundred and forty-two\"."
  (declare (type fixnum n))
  (cond ((< n 100) (format nil "~R" n))
        ((zerop (mod n 100)) (format nil "~R" n))
        (t (format nil "~R and ~R" (- n (mod n 100)) (mod n 100)))))

(defun pe017--count-letters (n)
  "Count letters (no spaces, no hyphens) in the English representation of n."
  (declare (type fixnum n))
  (let ((str (pe017--integer->english n)))
    (declare (type simple-string str))
    (the fixnum (- (length str)
                   (the fixnum (count #\space str))
                   (the fixnum (count #\- str))))))

(defun project-euler-017 (&optional (n 1000))
  "Total number of letters used when writing 1 to n in English words."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for i of-type fixnum from 1 to n
          do (incf sum (pe017--count-letters i)))
    sum))

;;; end
