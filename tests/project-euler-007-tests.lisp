;;;; Tests for Project Euler 7.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-007
  (parachute:is = 13 (project-euler-007 6))
  (parachute:is = 104743 (project-euler-007)))
