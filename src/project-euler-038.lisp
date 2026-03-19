(in-package :cl-problem-solving)

(declaim (inline pe038--pandigital-9-p))
(defun pe038--pandigital-9-p (n)
  "Check if fixnum n is 1-9 pandigital (9 digits, each 1-9 exactly once)."
  (declare (type fixnum n))
  (let ((mask 0) (count 0))
    (declare (type fixnum mask count))
    (loop while (> n 0)
          do (let ((d (the fixnum (mod n 10))))
               (declare (type fixnum d))
               (when (or (zerop d) (logbitp d mask))
                 (return-from pe038--pandigital-9-p nil))
               (setf mask (the fixnum (logior mask (the fixnum (ash 1 d)))))
               (incf count)
               (setf n (the fixnum (floor n 10)))))
    (= count 9)))

(declaim (inline pe038--concatenate-numbers))
(defun pe038--concatenate-numbers (a b)
  "Concatenate integers a and b: e.g. 192, 384 -> 192384."
  (declare (type fixnum a b))
  (let ((mult 1))
    (declare (type fixnum mult))
    (loop for m of-type fixnum = b then (the fixnum (floor m 10))
          while (> m 0) do (setf mult (the fixnum (* mult 10))))
    (the fixnum (+ (the fixnum (* a mult)) b))))

(defun project-euler-038 ()
  "Largest 1-9 pandigital formed as concatenated product of integer with (1,2,...,n), n>1."
  (let ((best 0))
    (declare (type fixnum best))
    (loop for n of-type fixnum from 2 to 9
          do (loop for p of-type fixnum from 1
                   for res of-type fixnum = (let ((r 0))
                                              (declare (type fixnum r))
                                              (loop for i of-type fixnum from 1 to n
                                                    do (setf r (pe038--concatenate-numbers r (the fixnum (* p i)))))
                                              r)
                   while (<= res 999999999)
                   when (and (pe038--pandigital-9-p res) (> res best))
                     do (setf best res)))
    best))

;;; end
