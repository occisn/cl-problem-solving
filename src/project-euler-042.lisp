;;;; Project Euler 42.
;;;;
;;;; https://projecteuler.net/problem=42

(in-package :cl-problem-solving)

(defun pe042--word-value (word)
  "Sum of alphabetical positions of characters in WORD."
  (declare (type (simple-array character) word))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for c of-type character across word
          do (incf sum (the fixnum (- (char-code c) 64))))
    sum))

(defun pe042--triangular-p (n)
  "Check if n is a triangular number: n = k(k+1)/2 for some k."
  (declare (type fixnum n))
  (let* ((discriminant (the fixnum (+ 1 (the fixnum (* 8 n)))))
         (root (isqrt discriminant)))
    (declare (type fixnum discriminant root))
    (and (= discriminant (the fixnum (* root root)))
         (oddp root))))

(defun project-euler-042 ()
  "Count triangle words in the words file."
  (let* ((input-file (merge-pathnames "project-euler-input-files/p042_words.txt"
                                      (asdf:system-source-directory "cl-problem-solving")))
         (string1 (the simple-string (with-open-file (stream input-file)
                                      (read-line stream nil))))
         (string2 (the simple-string (delete #\" string1)))
         (words (loop for start = 0 then (the fixnum (+ 1 finish))
                      for finish = (position #\, string2 :start start)
                      collecting (subseq string2 start (the (or fixnum null) finish))
                      until (null finish))))
    (loop for word in words
          count (pe042--triangular-p (pe042--word-value word)))))

;;; end
