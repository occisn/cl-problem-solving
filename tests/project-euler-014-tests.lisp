;;;; Tests for Project Euler 14.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-014
  (parachute:is = 837799 (project-euler-014))
  (parachute:is = 837799 (project-euler-014--no-cache)))

;; end
