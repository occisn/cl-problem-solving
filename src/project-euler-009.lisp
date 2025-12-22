(in-package :cl-problem-solving)

(defun project-euler-009--not-optimized (&optional (n 1000))
  "Solve Project Euler 9."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop for c from n downto 3
	append
	(loop for b
              from (min (- c 1) (- n c 1)) 
              downto (max 2 (floor (- n c) 2))
		     ;; upper limit for b:
		     ;;   (i) b < c
		     ;;   (ii) b = 1000-c-a with a >= 1 thus b <= 1000-c-1
		     ;; lower limit for b:
		     ;;   (i) 1 <= a < b thus b > 1
		     ;;   (ii) 1000-c = a+b with a < b thus 1000-c < 2b  
	      for a = (- n c b)
	      when (= (* c c) (+ (* a a) (* b b)))
		collect (list (* a b c) :abc a b c ))))

(defun project-euler-009 (&optional (n 1000))
  "Solve Project Euler 9."
  (declare (type fixnum n))
  (loop for c of-type fixnum from n downto 3
	append
	(loop for b of-type fixnum
              from (min (- c 1) (the fixnum (- n c 1))) 
              downto (max 2 (floor (- n c) 2))
		     ;; upper limit for b:
		     ;;   (i) b < c
		     ;;   (ii) b = 1000-c-a with a >= 1 thus b <= 1000-c-1
		     ;; lower limit for b:
		     ;;   (i) 1 <= a < b thus b > 1
		     ;;   (ii) 1000-c = a+b with a < b thus 1000-c < 2b  
	      for a of-type fixnum = (- n c b)
	      when (= (the fixnum (* c c)) (+ (the fixnum (* a a))
                                              (the fixnum (* b b))))
		collect (list (the fixnum (* a (the fixnum (* b c)))) :abc a b c ))))

;;; end

