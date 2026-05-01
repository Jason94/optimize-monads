(cl:defpackage #:optimize-monads
  (:use #:coalton #:coalton-prelude #:coalton/monad/identity)
  )

(cl:in-package #:optimize-monads)

(cl:declaim (cl:optimize (cl:speed 3) (cl:debug 0) (cl:safety 0)))

(named-readtables:in-readtable coalton:coalton)

;;;
;;; IO Type Definitions
;;;

(coalton-toplevel
  (repr :transparent)
  (define-type (IO :a)
    (IO (Void -> :a)))

  (inline)
  (declare run! (IO :a -> :a))
  (define (run! (IO funit->a))
    (funit->a))

  (define-instance (Functor IO)
    (inline)
    (define (map fb->c (IO funit->b))
      (IO
        (fn ()
          (fb->c (funit->b))))))

  (define-instance (Applicative IO)
    (inline)
    (define (pure a)
      (IO (fn () a)))
    (inline)
    (define (liftA2 fa->b->c (IO f->a) (IO f->b))
      (IO
        (fn ()
          (fa->b->c (f->a) (f->b))))))

  (define-instance (Monad IO)
    (inline)
    (define (>>= (IO f->a) fa->io-b)
      (IO
        (fn ()
          (run! (fa->io-b (f->a))))))))

(coalton-toplevel
  (repr :transparent)
  (define-type (IoT :m :a)
    (IoT (Void -> :m :a)))

  (inline)
  (declare runT! (IoT :m :a -> :m :a))
  (define (runT! (IoT funit->ma))
    (funit->ma))

  (define-instance (Functor :m => Functor (IoT :m))
    (inline)
    (define (map f io)
      (IoT
       (fn ()
         (map f (runT! io))))))

  (define-instance (Applicative :m => Applicative (IoT :m))
    (inline)
    (define (pure a)
      (IoT
       (fn ()
         (pure a))))
    (inline)
    (define (lifta2 a-b->c io-ma io-mb)
      (IoT
       (fn ()
         (lifta2 a-b->c (runT! io-ma) (runT! io-mb))))))

  (define-instance (Monad :m => Monad (IoT :m))
    (inline)
    (define (>>= io-ma a->io-mb)
      (IoT
       (fn ()
         (>>= (runT! io-ma)
              (map runT! a->io-mb))))))
  )

;;;
;;; Test Simple Running
;;;

(coalton-toplevel
  ;; Compilation output: <none>
  (declare test-direct (Void -> String))
  (define (test-direct)
    "test")
  )

(coalton-toplevel
  ;; Compilation output: <none>
  (declare test-call-internal-lambda (Void -> String))
  (define (test-call-internal-lambda)
    (let f = (fn () "test"))
    (f))
  )

(coalton-toplevel
  ;; Compilation output:
  ;; Inlining global function RUN!
  ;; Optimizing again, attempt #2
  (declare test-run-io (Void -> String))
  (define (test-run-io)
    (run! (IO (fn () "test"))))
  )

(coalton-toplevel
  ;; Compilation output:
  ;; Inlining global function RUNT!
  ;; Inlining global function RUN-IDENTITY
  ;; Optimizing again, attempt #2
  (declare test-run-ioT-identity (Void -> String))
  (define (test-run-ioT-identity)
    (run-identity
     (runT! (IoT (fn ()
                   (Identity "test"))))))
  )

(coalton-toplevel
  ;; Compilation output:
  ;; Inlining global function RUNT!
  ;; Inlining global function RUN!
  ;; Optimizing again, attempt #2
  (declare test-run-ioT-io (Void -> String))
  (define (test-run-ioT-io)
    (run!
     (runT! (IoT (fn ()
                   (IO (fn ()
                         "test")))))))
  )

(coalton-toplevel
  ;; Compilation output:
  ;; Inlining global function RUN-IDENTITY
  ;; Optimizing again, attempt #2
  (declare test-run-identity (Void -> String))
  (define (test-run-identity)
    (run-identity (Identity "test")))
 )

(pprint-coalton-codegen
  (declare test-direct (Void -> String))
  (define (test-direct)
    "test")

  (declare test-call-internal-lambda (Void -> String))
  (define (test-call-internal-lambda)
    (let f = (fn () "test"))
    (f))

  (declare test-run-io (Void -> String))
  (define (test-run-io)
    (run! (IO (fn () "test"))))

  (declare test-run-ioT-identity (Void -> String))
  (define (test-run-ioT-identity)
    (run-identity
     (runT! (IoT (fn ()
                   (Identity "test"))))))

  (declare test-run-ioT-io (Void -> String))
  (define (test-run-ioT-io)
    (run!
     (runT! (IoT (fn ()
                   (IO (fn ()
                         "test")))))))

  (declare test-run-identity (Void -> String))
  (define (test-run-identity)
    (run-identity (Identity "test")))
 )

;;;
;;; Test Map
;;;

(coalton-toplevel

  ;; Inlining method to application INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>
  ;; Optimizing again, attempt #2
  (declare test-direct-concat (Void -> String))
  (define (test-direct-concat)
    (<> "test" "concat"))
  )

(coalton-toplevel
  ;; Inlining method to application INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>
  ;; Optimizing again, attempt #2
  (declare test-lambda-concat (Void -> String))
  (define (test-lambda-concat)
    (let g = (fn ()
               (let f = (fn ()
                          "test"))
               (let do-concat = (fn (s)
                                  (<> s "concat")))
               (do-concat (f))))
    (g))
  )

(coalton-toplevel
  ;; Inlining method to application INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>
  ;; Optimizing again, attempt #2
  (declare test-pass-lambda-concat (Void -> String))
  (define (test-pass-lambda-concat)
    (let do-concat = (fn (s)
                       (<> s "concat")))
    (let apply-to-test = (fn (f)
                           (f "test")))
    (apply-to-test do-concat))
  )

(cl:defun test-cl-pass-lambda-concat ()
  (cl:let* ((do-concat (cl:lambda (s)
                         (cl:concatenate 'cl:string s "concat")))
            (apply-to-test (cl:lambda (f)
                             (cl:funcall f "test"))))
    (cl:funcall apply-to-test do-concat)))

(coalton-toplevel
  ;; Inlining method to application INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>
  ;; Inlining method to application INSTANCE/FUNCTOR IO-COALTON/CLASSES:MAP
  ;; Inlining global function INSTANCE/FUNCTOR IO-COALTON/CLASSES:MAP
  ;; Inlining global function RUN!
  ;; Optimizing again, attempt #2
  (declare test-map-io (Void -> String))
  (define (test-map-io)
    (let f = (fn (s)
               (<> s "concat")))
    (run! (map f (IO (fn () "test")))))
  )

(coalton-toplevel
  ;; Inlining method to application INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>
  ;; Inlining method to application INSTANCE/FUNCTOR (IOT :M)-COALTON/CLASSES:MAP
  ;; Inlining global function INSTANCE/FUNCTOR (IOT :M)-COALTON/CLASSES:MAP
  ;; Inlining global function RUNT!
  ;; Inlining global function RUN!
  ;; Optimizing again, attempt #2
  ;; Inlining direct method to application INSTANCE/FUNCTOR IO-COALTON/CLASSES:MAP
  ;; Inlining global function INSTANCE/FUNCTOR IO-COALTON/CLASSES:MAP
  ;; Optimizing again, attempt #3
  (declare test-map-iot-io (Void -> String))
  (define (test-map-iot-io)
    (let f = (fn (s)
               (<> s "concat")))
    (run!
     (runT! (map f
                 (IoT (fn ()
                        (IO (fn ()
                              "test"))))))))
    )

(pprint-coalton-codegen

  (declare test-direct-concat (Void -> String))
  (define (test-direct-concat)
    (<> "test" "concat"))

  (declare test-lambda-concat (Void -> String))
  (define (test-lambda-concat)
    (let g = (fn ()
               (let f = (fn ()
                          "test"))
               (let do-concat = (fn (s)
                                  (<> s "concat")))
               (do-concat (f))))
    (g))

  (declare test-pass-lambda-concat (Void -> String))
  (define (test-pass-lambda-concat)
    (let do-concat = (fn (s)
                       (<> s "concat")))
    (let apply-to-test = (fn (f)
                           (f "test")))
    (apply-to-test do-concat))

  (declare test-map-io (Void -> String))
  (define (test-map-io)
    (let f = (fn (s)
               (<> s "concat")))
    (run! (map f (IO (fn () "test")))))

  (declare test-map-iot-io (Void -> String))
  (define (test-map-iot-io)
    (let f = (fn (s)
               (<> s "concat")))
    (run!
     (runT! (map f
                 (IoT (fn ()
                        (IO (fn ()
                              "test"))))))))
    )

;;;
;;; Bind
;;;

(coalton-toplevel
  (declare test-bind-io (Void -> String))
  (define (test-bind-io)
    (run! (>>= (pure "test")
               (fn (s)
                 (pure (<> s "concat")))))))

(pprint-coalton-codegen
  (declare test-bind-io (Void -> String))
  (define (test-bind-io)
    (run! (>>= (pure "test")
               (fn (s)
                 (pure (<> s "concat")))))))

;;;
;;; Disassemble
;;;

(cl:defun disassemble-all-1 ()
  (cl:disassemble 'test-direct)
  (cl:disassemble 'test-call-internal-lambda)
  (cl:disassemble 'test-run-io)
  (cl:disassemble 'test-run-ioT-identity)
  (cl:disassemble 'test-run-ioT-io)
  (cl:disassemble 'test-run-identity))

(cl:defun disassemble-all-2 ()
  (cl:disassemble 'test-direct-concat)
  (cl:disassemble 'test-lambda-concat)
  (cl:disassemble 'test-pass-lambda-concat)
  (cl:disassemble 'test-cl-pass-lambda-concat)
  (cl:disassemble 'test-map-io)
  (cl:disassemble 'test-map-iot-io))

(cl:defun disassemble-all-3 ()
  (cl:disassemble 'test-bind-io))

;; (disassemble-all-3)
