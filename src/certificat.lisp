(in-package :cl-problem-solving)

;;; Josephus problem: 41 students in a circle, every 3rd is eliminated.

(defun certificat-p33-4 ()
  "Which student number survives when every 3rd is eliminated from a circle of 41?"
  (let* ((students (loop for i from 1 to 41 collect i))
         (circle (nconc students students))) ; make circular
    (declare (type cons circle))
    (loop for prev = circle then (cdr prev)
          ;; prev points to the element before the one to remove
          ;; skip 1 (prev is already 1 ahead), remove 3rd = skip 2 more
          do (setf prev (cdr prev)) ; advance to element before victim
             (setf (cdr prev) (cddr prev)) ; remove victim
          until (eq prev (cdr prev)) ; only one left
          finally (return (car prev)))))

;;; end
