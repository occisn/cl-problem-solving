;;;; Project Euler 54.
;;;;
;;;; https://projecteuler.net/problem=54

(in-package :cl-problem-solving)

;;; Poker hand evaluator. Returns a list where the car is the hand rank (0-9)
;;; and the rest are tiebreakers in descending priority.

(defun pe054--decrypt-card (s)
  "Parse card string like 'TS' -> (10 :S)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (list (case (char s 0) (#\T 10) (#\J 11) (#\Q 12) (#\K 13) (#\A 14) (t (- (char-code (char s 0)) 48)))
        (case (char s 1) (#\S :S) (#\C :C) (#\D :D) (#\H :H))))

(defun pe054--hand-rank (hand)
  "Evaluate a poker hand (list of (value suit) pairs). Returns rank list for comparison."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let* ((values (sort (mapcar #'car hand) #'>))
         (suits (mapcar #'cadr hand))
         (flush-p (= 1 (length (remove-duplicates suits))))
         (straight-p (and (= 5 (length (remove-duplicates values)))
                          (= 4 (- (first values) (fifth values)))))
         (counts (make-array 15 :element-type 'fixnum :initial-element 0)))
    (dolist (v values) (incf (aref counts v)))
    (let ((max-count (loop for i from 2 to 14 maximize (aref counts i)))
          (num-distinct (length (remove-duplicates values))))
      (cond
        ;; Royal/Straight flush
        ((and flush-p straight-p) (list 8 (first values)))
        ;; Four of a kind
        ((= max-count 4)
         (let ((v4 (loop for i from 2 to 14 when (= 4 (aref counts i)) return i))
               (v1 (loop for i from 14 downto 2 when (= 1 (aref counts i)) return i)))
           (list 7 v4 v1)))
        ;; Full house
        ((and (= max-count 3) (= num-distinct 2))
         (let ((v3 (loop for i from 2 to 14 when (= 3 (aref counts i)) return i))
               (v2 (loop for i from 2 to 14 when (= 2 (aref counts i)) return i)))
           (list 6 v3 v2)))
        ;; Flush
        (flush-p (cons 5 values))
        ;; Straight
        (straight-p (list 4 (first values)))
        ;; Three of a kind
        ((= max-count 3) (list 3 (loop for i from 2 to 14 when (= 3 (aref counts i)) return i)))
        ;; Two pairs
        ((= num-distinct 3)
         (let* ((pairs (loop for i from 14 downto 2 when (= 2 (aref counts i)) collect i))
                (kicker (loop for i from 14 downto 2 when (= 1 (aref counts i)) return i)))
           (list* 2 (first pairs) (second pairs) (list kicker))))
        ;; One pair
        ((= num-distinct 4)
         (let ((pair-val (loop for i from 2 to 14 when (= 2 (aref counts i)) return i)))
           (cons 1 (cons pair-val (remove pair-val values :count 2)))))
        ;; High card
        (t (cons 0 values))))))

(defun pe054--compare-ranks (r1 r2)
  "Return T if rank r1 beats rank r2."
  (cond ((null r1) nil)
        ((> (the fixnum (car r1)) (the fixnum (car r2))) t)
        ((< (the fixnum (car r1)) (the fixnum (car r2))) nil)
        (t (pe054--compare-ranks (cdr r1) (cdr r2)))))

(defun pe054--string-split (str delimiter)
  "Split STR on DELIMITER and return the pieces as a list of strings."
  (declare (type (simple-array character) str))
  (loop for start = 0 then (the fixnum (+ 1 finish))
        for finish = (position delimiter str :start start)
        collecting (subseq str start finish)
        until (null finish)))

(defun pe054--player1-wins-p (line)
  "Return T if player 1 wins this hand (line = 10 space-separated cards)."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let* ((cards (mapcar #'pe054--decrypt-card (pe054--string-split line #\Space)))
         (hand1 (subseq cards 0 5))
         (hand2 (subseq cards 5))
         (rank1 (pe054--hand-rank hand1))
         (rank2 (pe054--hand-rank hand2)))
    (pe054--compare-ranks rank1 rank2)))

(defun project-euler-054 ()
  "Count how many of the 1000 poker hands Player 1 wins."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (let ((input-file (merge-pathnames "project-euler-input-files/p054_poker.txt"
                                     (asdf:system-source-directory "cl-problem-solving"))))
    (with-open-file (stream input-file)
      (loop for line = (read-line stream nil)
            while line
            count (pe054--player1-wins-p line)))))

;;; end
