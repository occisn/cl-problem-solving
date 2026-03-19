(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-015
  (parachute:is = 6 (project-euler-015 2))
  (parachute:is = 137846528820 (project-euler-015))
  ;; variants
  (parachute:is = 6 (project-euler-015--brute-force 2))
  (parachute:is = 137846528820 (project-euler-015--memo-array)))

;; end
