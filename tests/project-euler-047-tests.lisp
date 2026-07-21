;;;; Tests for Project Euler 47.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-047
  (parachute:is = 14 (project-euler-047 2))
  (parachute:is = 644 (project-euler-047 3))
  (parachute:is = 134043 (project-euler-047)))

;; end
