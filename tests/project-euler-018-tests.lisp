(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-018
  (let ((small '((3) (7 4) (2 4 6) (8 5 9 3))))
    (parachute:is = 23 (project-euler-018 small))
    (parachute:is = 1074 (project-euler-018))
    ;; variants
    (parachute:is = 23 (project-euler-018--brute-force small))
    (parachute:is = 1074 (project-euler-018--brute-force))
    (parachute:is = 23 (project-euler-018--memo-array small))
    (parachute:is = 1074 (project-euler-018--memo-array))))

;; end
