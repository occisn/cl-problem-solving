(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-020
  (parachute:is = 27 (project-euler-020 10))
  (parachute:is = 648 (project-euler-020)))

;; end
