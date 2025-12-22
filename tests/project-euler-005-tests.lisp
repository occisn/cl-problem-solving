(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-005
  (parachute:is = 2520 (project-euler-005--not-optimized 10))
  (parachute:is = 232792560 (project-euler-005--not-optimized))
  (parachute:is = 2520 (project-euler-005 10))
  (parachute:is = 232792560 (project-euler-005)))

;; end
