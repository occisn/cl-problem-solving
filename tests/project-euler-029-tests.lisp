(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-029
  (parachute:is = 15 (project-euler-029 5))
  (parachute:is = 9183 (project-euler-029)))

;; end
