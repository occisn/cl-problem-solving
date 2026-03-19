(in-package :cl-problem-solving)

(defun project-euler-029 (&optional (n 100))
  "Count distinct terms in the sequence a^b for 2 <= a <= n and 2 <= b <= n."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum n))
  (let ((seen (make-hash-table :test #'eql)))
    (loop for a of-type fixnum from 2 to n
          do (loop for b of-type fixnum from 2 to n
                   do (setf (gethash (expt a b) seen) t)))
    (hash-table-count seen)))

;;; end
