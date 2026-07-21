;;;; Tests for: French number-to-words conversion, and Ile Maths puzzles.

(in-package :cl-problem-solving-tests)

(parachute:define-test test-ilemaths
  (parachute:is = 1412 (ilemaths-553033))
  (parachute:is = 363363 (ilemaths-664857 6)))

;; end
