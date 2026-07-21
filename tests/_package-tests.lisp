;;;; Package definition for the test suite.
;;;;
;;;; This package does :USE CL-PROBLEM-SOLVING, which is the exception the
;;;; style guide allows: there is roughly one test per exported symbol, so the
;;;; suite really does need almost all of them, and an :IMPORT-FROM clause
;;;; would list the whole package.

(defpackage :cl-problem-solving-tests
  (:use :cl :cl-problem-solving)
  (:documentation "Test suite for cl-problem-solving."))
