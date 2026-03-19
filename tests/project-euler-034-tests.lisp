(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-034
  (parachute:is = 145 (project-euler-034 200))
  (parachute:is = 40730 (project-euler-034)))

;; end
