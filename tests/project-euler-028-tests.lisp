(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-028
  (parachute:is = 101 (project-euler-028 5))
  (parachute:is = 669171001 (project-euler-028)))

;; end
