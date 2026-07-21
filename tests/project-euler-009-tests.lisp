;;;; Tests for Project Euler 9.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-009
  (parachute:is = 31875000 (caar (project-euler-009--not-optimized)))
  (parachute:is = 31875000 (caar (project-euler-009))))

;; end
