(cl:defpackage #:optimize-monads/io-native
  (:use #:coalton #:coalton-prelude #:coalton/monad/identity)
  )

(cl:in-package #:optimize-monads/io-native)

(cl:declaim (cl:optimize (cl:speed 3) (cl:debug 0) (cl:safety 0)))

(named-readtables:in-readtable coalton:coalton)

(coalton-toplevel
  (repr :native (cl:function () cl:*))
  (define-type (IO :a))
  )

(defmacro IO% (cl:&body body)
  `(lisp (-> IO :a) ()
     (cl:lambda ()
       ,@body)))

(coalton-toplevel

  (inline)
  (declare run! (IO :a -> :a))
  (define (run! io)
    (lisp (-> :a) (io)
      (cl:declare (cl:type (cl:function () cl:*) io))
      (cl:funcall io)))
  )

(coalton-toplevel
  (declare test-run-io (Void -> String))
  (define (test-run-io)
    (run! (lisp (-> io :a) ()
            (common-lisp:lambda () "test"))))
  )

(cl:disassemble 'run!)
