(in-package :cl-problem-solving)

(defun project-euler-059 ()
  "Decrypt XOR-encrypted text with a 3-char lowercase key using frequency analysis."
  (let* ((input-file (merge-pathnames "project-euler-input-files/p059_cipher.txt"
                                      (asdf:system-source-directory "cl-problem-solving")))
         (string1 (the simple-string (with-open-file (stream input-file) (read-line stream nil))))
         (numbers (mapcar #'parse-integer
                          (loop for start = 0 then (the fixnum (+ 1 finish))
                                for finish = (position #\, string1 :start start)
                                collecting (subseq string1 start finish)
                                until (null finish))))
         (len (length numbers)))
    (declare (type fixnum len))
    (loop for a of-type fixnum from 97 to 122
          do (loop for b of-type fixnum from 97 to 122
                   do (loop for c of-type fixnum from 97 to 122
                            for key = (list a b c)
                            for keys = (vector a b c)
                            for decrypted = (loop for num in numbers
                                                  for i of-type fixnum from 0
                                                  collect (the fixnum (logxor (the fixnum num)
                                                                              (the fixnum (aref keys (mod i 3))))))
                            for e-count of-type fixnum = (count 101 decrypted)
                            when (> (the fixnum (* e-count 100)) (the fixnum (* 11 len)))
                              do (return-from project-euler-059
                                   (the fixnum (reduce #'+ decrypted))))))))

;;; end
