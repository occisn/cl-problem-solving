(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-3
  (parachute:is = 29 (project-euler-3 13195))
  (parachute:is = 6857 (project-euler-3)))

;; end
