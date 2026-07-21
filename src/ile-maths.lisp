;;;; French number-to-words conversion, and Ile Maths puzzles.

(in-package :cl-problem-solving)

;;; French number-to-words (pre-1990 rules), for numbers 0 to 999,999,999.

(defun ile--en-toutes-lettres (n)
  "Convert integer N to French words."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((unites #("zero" "un" "deux" "trois" "quatre" "cinq" "six" "sept" "huit" "neuf"
                  "dix" "onze" "douze" "treize" "quatorze" "quinze" "seize"
                  "dix-sept" "dix-huit" "dix-neuf"))
        (dizaines #("void" "dix" "vingt" "trente" "quarante" "cinquante" "soixante"
                    "soixante-dix" "quatre-vingt" "quatre-vingt-dix")))
    (labels ((sub (n &optional a-la-fin)
               (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
               (cond
                 ((>= n 1000000)
                  (let* ((mm (floor n 1000000))
                         (reste (mod n 1000000)))
                    (concatenate 'string (sub mm t) " million"
                                 (when (> mm 1) "s")
                                 (when (>= reste 1) " ")
                                 (when (>= reste 1) (sub reste a-la-fin)))))
                 ((>= n 1000)
                  (let* ((m (floor n 1000))
                         (reste (mod n 1000)))
                    (concatenate 'string
                                 (when (>= m 2) (sub m nil))
                                 (when (>= m 2) " ")
                                 "mille"
                                 (when (>= reste 1) " ")
                                 (when (>= reste 1) (sub reste a-la-fin)))))
                 ((<= n 19) (aref unites n))
                 ((<= n 69) (let ((d (floor n 10)) (u (mod n 10)))
                              (cond ((= u 0) (aref dizaines d))
                                    ((= u 1) (concatenate 'string (aref dizaines d) " et un"))
                                    (t (concatenate 'string (aref dizaines d) "-" (aref unites u))))))
                 ((= n 70) "soixante-dix")
                 ((= n 71) "soixante et onze")
                 ((<= n 79) (concatenate 'string "soixante-" (aref unites (- n 60))))
                 ((= n 80) (if a-la-fin "quatre-vingts" "quatre-vingt"))
                 ((<= n 99) (concatenate 'string "quatre-vingt-" (aref unites (- n 80))))
                 ((= n 100) "cent")
                 ((<= n 999) (let ((c (floor n 100)) (du (mod n 100)))
                               (concatenate 'string
                                            (when (<= n 199) "cent")
                                            (when (> n 199) (sub c nil))
                                            (when (> n 199) " cent")
                                            (when (and a-la-fin (= du 0)) "s")
                                            (when (> du 0) " ")
                                            (when (> du 0) (sub du a-la-fin))))))))
      (sub n t))))

;;; Ilemaths 553033: count letter frequencies in French words for 0-99,
;;; assign values 1/2/3 by frequency rank, compute total.

(defun ilemaths-553033 ()
  "Letter frequency scoring puzzle from ilemaths.net/553033."
  (let ((ht (make-hash-table)))
    (loop for n of-type fixnum from 0 below 100
          for text = (ile--en-toutes-lettres n)
          do (loop for c across (the simple-string text)
                   when (and (char>= c #\a) (char<= c #\z))
                     do (incf (the fixnum (gethash c ht 0)))))
    (let ((alist nil))
      (declare (type list alist))
      (maphash (lambda (k v) (push (cons k v) alist)) ht)
      (setf alist (the list (sort alist #'>= :key (lambda (x) (the fixnum (cdr x))))))
      (the fixnum
           (+ (the fixnum (reduce #'+ (mapcar (lambda (x) (the fixnum (cdr x))) (the list (subseq alist 0 8)))))
              (the fixnum (* 2 (the fixnum (reduce #'+ (mapcar (lambda (x) (the fixnum (cdr x))) (the list (subseq alist 8 16)))))))
              (the fixnum (* 3 (the fixnum (reduce #'+ (mapcar (lambda (x) (the fixnum (cdr x))) (the list (subseq alist 16))))))))))))

;;; Ilemaths 664857: find smallest n with >= m occurrences of 's' in French words.

(defun ilemaths-664857 (&optional (m 10))
  "Find smallest n whose French name contains >= m occurrences of letter 's'."
  (declare (type fixnum m))
  (loop for n of-type fixnum from 0
        until (>= (count #\s (ile--en-toutes-lettres n)) m)
        finally (return n)))

;;; end
