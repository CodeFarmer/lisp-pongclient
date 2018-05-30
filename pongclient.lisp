(ql:quickload "usocket")
(ql:quickload "cl-json")

(defparameter hostname (or (second *posix-argv*)
			   "localhost"))

(defparameter sock (usocket:socket-connect hostname 6000))
(defparameter s (usocket:socket-stream sock))

(read-line s)
(write-line "Common Lisp" s)
(finish-output s)

(loop
   (let* ((msg    (cl-json:decode-json s))
	  (side   (intern (string-upcase (cdr (assoc :SIDE msg))) "KEYWORD"))
	  (bat-y  (cdr (assoc side msg)))
	  (ball-y (second (cdr (assoc :BALL msg)))))
     
     ;; ((:HEIGHT . 600) (:WIDTH . 800) (:SIDE . "left") (:BALL 670.0216 270.89)
     ;;  (:LEFT . 300) (:RIGHT . 300) (:T . 2252))

     (write-line
      (if (< ball-y bat-y)
	  "u"
	  "d") s)
     (finish-output s)))
