(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-6
  (parachute:is = 2640 (project-euler-6 10))
  (parachute:is = 25164150 (project-euler-6)))

;; end
