(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-001
  (parachute:is = 23 (project-euler-001--not-optimized 10))
  (parachute:is = 233168 (project-euler-001--not-optimized))
  (parachute:is = 23 (project-euler-001 10))
  (parachute:is = 233168 (project-euler-001)))

;; end
