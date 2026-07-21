;;;; Tests for Project Euler 16.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-016
  (parachute:is = 26 (project-euler-016 15))
  (parachute:is = 1366 (project-euler-016)))

;; end
