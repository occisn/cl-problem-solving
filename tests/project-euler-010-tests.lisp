;;;; Tests for Project Euler 10.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-010
  (parachute:is = 17 (project-euler-010 10))
  (parachute:is = 142913828922 (project-euler-010))
  ;; variant
  (parachute:is = 17 (project-euler-010--next-prime-loop 10))
  (parachute:is = 142913828922 (project-euler-010--next-prime-loop)))

;; end
