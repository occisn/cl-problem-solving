(in-package :cl-problem-solving)

(defun project-euler-061 ()
  "Sum of the cyclic set of six 4-digit figurate numbers (triangle through octagonal)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((by-type (make-array 6 :initial-element nil)))
    ;; Build lookup: by-type[t] is hash: hi-digits -> list of (value . lo-digits)
    (loop for type of-type fixnum from 0 below 6
          for gen in (list (lambda (n) (the fixnum (ash (the fixnum (* n (the fixnum (+ n 1)))) -1)))
                          (lambda (n) (the fixnum (* n n)))
                          (lambda (n) (the fixnum (ash (the fixnum (* n (the fixnum (- (the fixnum (* 3 n)) 1)))) -1)))
                          (lambda (n) (the fixnum (* n (the fixnum (- (the fixnum (* 2 n)) 1)))))
                          (lambda (n) (the fixnum (ash (the fixnum (* n (the fixnum (- (the fixnum (* 5 n)) 3)))) -1)))
                          (lambda (n) (the fixnum (* n (the fixnum (- (the fixnum (* 3 n)) 2))))))
          do (let ((ht (make-hash-table)))
               (setf (aref by-type type) ht)
               (loop for n of-type fixnum from 1
                     for v of-type fixnum = (funcall gen n)
                     while (<= v 9999)
                     when (>= v 1000)
                       do (let ((hi (the fixnum (floor v 100)))
                                (lo (the fixnum (mod v 100))))
                            (declare (type fixnum hi lo))
                            (when (>= lo 10)
                              (push (cons v lo) (gethash hi ht)))))))
    ;; DFS: find cycle of 6 numbers using all 6 types
    (labels ((pe061--search (depth used-types chain first-hi current-lo)
               (declare (type fixnum depth used-types first-hi current-lo))
               (if (= depth 6)
                   (when (= current-lo first-hi)
                     (return-from project-euler-061
                       (let ((sum 0))
                         (declare (type fixnum sum))
                         (dolist (v chain sum)
                           (incf sum (the fixnum v))))))
                   (loop for type of-type fixnum from 0 below 6
                         unless (logbitp type used-types)
                           do (dolist (pair (gethash current-lo
                                                     (the hash-table (aref by-type type))))
                                (pe061--search (the fixnum (+ depth 1))
                                        (the fixnum (logior used-types (the fixnum (ash 1 type))))
                                        (cons (car pair) chain)
                                        first-hi
                                        (the fixnum (cdr pair))))))))
      (loop for type of-type fixnum from 0 below 6
            do (maphash (lambda (hi pairs)
                          (declare (type fixnum hi))
                          (dolist (pair pairs)
                            (pe061--search 1
                                    (the fixnum (ash 1 type))
                                    (list (the fixnum (car pair)))
                                    hi
                                    (the fixnum (cdr pair)))))
                        (the hash-table (aref by-type type)))))))

;;; end
