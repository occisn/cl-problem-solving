(asdf:defsystem "cl-problem-solving-tests"
  :depends-on ("cl-problem-solving" "parachute")
  :serial t
  :components ((:module "tests"
                :around-compile (lambda (next)
                                  (proclaim '(optimize (debug 0) 
                                              (safety 3)
                                              (speed 0)))
                                  (funcall next))
                :components ((:file "_package-tests")
                             ;;
                             (:file "project-euler-001-tests")
                             (:file "project-euler-003-tests")
                             (:file "project-euler-005-tests")
                             (:file "project-euler-006-tests")
                             (:file "project-euler-009-tests"))))
  :perform (asdf:test-op (op c) (uiop:symbol-call :parachute :test  :cl-problem-solving-tests)))
