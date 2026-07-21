;;;; Tests for Project Euler 72.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-072
  (parachute:is = 21 (project-euler-072 8))
  (parachute:is = 303963552391 (project-euler-072)))

;; end
