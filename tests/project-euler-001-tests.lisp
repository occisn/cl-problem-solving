(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-1
  (parachute:is = 23 (project-euler-1 10))
  (parachute:is = 233168 (project-euler-1)))

;; end
