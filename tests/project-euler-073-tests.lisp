(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-073
  (parachute:is = 3 (project-euler-073 8))
  (parachute:is = 7295372 (project-euler-073)))

;; end
