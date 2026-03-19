(in-package :cl-problem-solving-tests)

(parachute:define-test test-fermat-library
  (parachute:is = 33 (fermat-library-33-as-sum-of-cubes))
  (parachute:is = 42 (fermat-library-42-as-sum-of-cubes))
  (parachute:true (fermat-library-19-31))
  (parachute:true (fermat-library-116))
  (parachute:is = 369693100 (fermat-library-9-9-9)))

;; end
