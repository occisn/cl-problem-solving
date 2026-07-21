;;;; Tests for Project Euler 25.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-025
  (parachute:is = 12 (project-euler-025 3))
  (parachute:is = 4782 (project-euler-025))
  ;; variant
  (parachute:is = 12 (project-euler-025--count-digits 3))
  (parachute:is = 4782 (project-euler-025--count-digits)))

;; end
