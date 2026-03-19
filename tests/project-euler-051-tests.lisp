(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-051
  (parachute:is = 13 (project-euler-051 6))
  (parachute:is = 56003 (project-euler-051 7))
  (parachute:is = 121313 (project-euler-051)))

;; end
