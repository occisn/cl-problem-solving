(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-042
  (parachute:is = 55 (pe042--word-value "SKY"))
  (parachute:is = 162 (project-euler-042)))

;; end
