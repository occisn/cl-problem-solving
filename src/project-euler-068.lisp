;;;; Project Euler 68.
;;;;
;;;; https://projecteuler.net/problem=68

(in-package :cl-problem-solving)

;;; Manual mathematical solution:
;;; For max 16-digit string: 6,7,8,9,10 on outside; 1,2,3,4,5 on inside.
;;; Start from 6 (smallest outer). Line sum = 14.
;;; Solution: 6,5,3; 10,3,1; 9,1,4; 8,4,2; 7,2,5

(defun project-euler-068 ()
  "Maximum 16-digit string for a magic 5-gon ring."
  6531031914842725)

;;; end
