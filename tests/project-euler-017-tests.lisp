;;;; Tests for Project Euler 17.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-017
  (parachute:is = 23 (pe017--count-letters 342))
  (parachute:is = 20 (pe017--count-letters 115))
  (parachute:is = 19 (project-euler-017 5))
  (parachute:is = 21124 (project-euler-017)))

;; end
