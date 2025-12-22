(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-006
  (parachute:is = 2640 (project-euler-006--not-optimized 10))
  (parachute:is = 25164150 (project-euler-006--not-optimized))
  (parachute:is = 2640 (project-euler-006 10))
  (parachute:is = 25164150 (project-euler-006)))

;; end
