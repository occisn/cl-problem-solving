(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-062
  (parachute:is = 41063625 (project-euler-062 3))
  (parachute:is = 127035954683 (project-euler-062)))

;; end
