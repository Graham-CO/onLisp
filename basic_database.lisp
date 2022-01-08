(defun make-dbms (db)
  (list
    #'(lambda (key)
        (cdr (assoc key db)))
    #'(lambda (key val)
        (push (cons key val) db)
        key)
    #'(lambda (key)
        (setf db (delete key db :key #'car))
        key)))

;;; (setq cities (make-dbms '((boston . us) (paris . france))))

; (funcall (car cities) 'boston)
; >>> US
; (funcall (second cities) 'london 'england)
; >>> LONDON
; (funcall (car cities) 'london)
; >>> ENGLAND

;;;; UGGGGLY

;;;; PRETTY

(defun lookup (key db) 
  (funcall (car db) key)) 



