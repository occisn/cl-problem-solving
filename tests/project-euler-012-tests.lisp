(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-012
  (parachute:is = 28 (project-euler-012 5))
  (parachute:is = 76576500 (project-euler-012))
  ;; variant
  (parachute:is = 28 (project-euler-012--naive 5))
  (parachute:is = 76576500 (values (project-euler-012--naive))))

;; end
