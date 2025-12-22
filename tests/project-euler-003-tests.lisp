(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-003
  (parachute:is = 29 (project-euler-003 13195))
  (parachute:is = 6857 (project-euler-003)))

;; end
