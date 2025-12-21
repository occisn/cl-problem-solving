(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-5
  (parachute:is = 2520 (project-euler-5 10))
  (parachute:is = 232792560 (project-euler-5)))

;; end
