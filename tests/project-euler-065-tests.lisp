(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-065
  (parachute:is = 17 (project-euler-065 10))
  (parachute:is = 272 (project-euler-065)))

;; end
