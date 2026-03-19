(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-008
  (parachute:is = 5832 (project-euler-008 4))
  (parachute:is = 23514624000 (project-euler-008))
  ;; variants
  (parachute:is = 5832 (project-euler-008--list-of-digits 4))
  (parachute:is = 23514624000 (project-euler-008--list-of-digits))
  (parachute:is = 5832 (project-euler-008--integer-arithmetic 4))
  (parachute:is = 23514624000 (project-euler-008--integer-arithmetic)))

;; end
