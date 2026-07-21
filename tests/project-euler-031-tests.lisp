;;;; Tests for Project Euler 31.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-031
  (parachute:is = 1 (project-euler-031 1))
  (parachute:is = 2 (project-euler-031 2))
  (parachute:is = 73682 (project-euler-031))
  ;; variant
  (parachute:is = 73682 (project-euler-031--nested-loops)))

;; end
