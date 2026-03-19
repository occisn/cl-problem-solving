(in-package :cl-problem-solving-tests)

(parachute:define-test test-project-euler-064
  (parachute:is = 4 (project-euler-064 13))
  (parachute:is = 1322 (project-euler-064)))

;; end
