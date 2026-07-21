;;;; Tests for Project Euler 50.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-050
  (parachute:is = 41 (project-euler-050 100))
  (parachute:is = 953 (project-euler-050 1000))
  (parachute:is = 997651 (project-euler-050)))

;; end
