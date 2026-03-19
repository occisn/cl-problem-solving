(in-package :cl-problem-solving)

;;; Bottom-up DP: starting from bottom-right, each cell = self + min(right, below).

(defun project-euler-081 ()
  "Minimal path sum in 80x80 matrix from top-left to bottom-right, moving only right and down."
  (let* ((input-file (merge-pathnames "project-euler-input-files/p081_matrix.txt"
                                      (asdf:system-source-directory "cl-problem-solving")))
         (rows (with-open-file (stream input-file)
                 (loop for raw-line = (read-line stream nil)
                       while raw-line
                       for line of-type simple-string = raw-line
                       collect (mapcar #'parse-integer
                                       (loop for start = 0 then (the fixnum (+ 1 finish))
                                             for finish = (position #\, line :start start)
                                             collecting (subseq line start finish)
                                             until (null finish))))))
         (n (length rows))
         (grid (make-array (list n n) :element-type 'fixnum
                           :initial-contents rows)))
    (declare (type fixnum n)
             (type (simple-array fixnum (* *)) grid))
    ;; Fill last row right-to-left
    (loop for j of-type fixnum from (the fixnum (- n 2)) downto 0
          do (incf (aref grid (the fixnum (- n 1)) j) (aref grid (the fixnum (- n 1)) (the fixnum (+ j 1)))))
    ;; Fill last column bottom-to-top
    (loop for i of-type fixnum from (the fixnum (- n 2)) downto 0
          do (incf (aref grid i (the fixnum (- n 1))) (aref grid (the fixnum (+ i 1)) (the fixnum (- n 1)))))
    ;; Fill rest
    (loop for i of-type fixnum from (the fixnum (- n 2)) downto 0
          do (loop for j of-type fixnum from (the fixnum (- n 2)) downto 0
                   do (incf (aref grid i j)
                            (min (aref grid (the fixnum (+ i 1)) j)
                                 (aref grid i (the fixnum (+ j 1)))))))
    (aref grid 0 0)))

;;; end
