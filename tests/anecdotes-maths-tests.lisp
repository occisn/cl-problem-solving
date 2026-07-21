;;;; Tests for: Mathematical anecdotes and curiosities from @AnecdotesMaths.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-anecdotes-maths
  (parachute:true (anecdotes-maths-2357))
  (parachute:is = 65536 (anecdotes-maths-65536-v1))
  (parachute:true (anecdotes-maths-2-127-1-is-prime))
  (parachute:true (anecdotes-maths-12345678910987654321-prime))
  (parachute:true (equal '(13 53 53 3853 96179) (anecdotes-maths-13532385396179))))

;; end
