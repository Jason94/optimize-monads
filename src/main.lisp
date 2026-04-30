(cl:defpackage #:optimize-monads
  (:use #:coalton #:coalton-prelude #:coalton/monad/identity)
  )

(cl:in-package #:optimize-monads)

(cl:declaim (cl:optimize (cl:speed 3) (cl:debug 0) (cl:safety 0)))

(named-readtables:in-readtable coalton:coalton)

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

;; (cl:disassemble 'test-run-identity)
