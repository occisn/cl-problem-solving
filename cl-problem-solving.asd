(asdf:defsystem "cl-problem-solving"
  :name "cl-problem-solving"
  ;; :version "1"
  :author "Nicolas Occis"
  :licence "MIT"
  :description "Problem solving in Common Lisp"
  ;; :long-description "A long description"
  :depends-on (;; :parachute ; for tests
               )
  :serial t ; load files in order
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 0) 
                                (safety 3)
                                (speed 0)))
                    (funcall next))
  :components ((:file "package")
               (:module "src"
                :components
                ((:file "project-euler-001")
                 (:file "project-euler-003")
                 (:file "project-euler-005")
                 (:file "project-euler-006")
                 (:file "project-euler-009"))
                ))
  :perform (load-op :after (op c)
                    (format t "~%Welcome in cl-problem-solving!~%"))
  :in-order-to ((asdf:test-op (asdf:test-op :cl-problem-solving-tests))))

