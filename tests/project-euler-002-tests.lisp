(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-002
  (parachute:is = 4613732 (project-euler-002--not-optimized))
  (parachute:is = 4613732 (project-euler-002)))

;; end
