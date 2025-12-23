(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-004
  (parachute:is = 9009 (project-euler-004--not-optimized 2))
  (parachute:is = 906609 (project-euler-004--not-optimized))
  (parachute:is = 9009 (project-euler-004 2))
  (parachute:is = 906609 (project-euler-004)))

;; end
