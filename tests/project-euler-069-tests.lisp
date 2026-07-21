;;;; Tests for Project Euler 69.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-069
  (parachute:is = 6 (project-euler-069 9))
  (parachute:is = 510510 (project-euler-069)))

;; end
