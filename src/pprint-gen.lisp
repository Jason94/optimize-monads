(PROGN
 (LOCALLY
  (DECLARE (OPTIMIZE (SB-C::TYPE-CHECK 0)))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-DIRECT
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-DIRECT () (DECLARE (IGNORABLE)) "test")
  (SETF TEST-DIRECT
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-DIRECT))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-CALL-INTERNAL-LAMBDA
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-CALL-INTERNAL-LAMBDA ()
    (DECLARE (IGNORABLE))
    (FLET ((F-398 ()
             (DECLARE (IGNORABLE))
             "test"))
      (F-398)))
  (SETF TEST-CALL-INTERNAL-LAMBDA
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-CALL-INTERNAL-LAMBDA))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IO
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IO ()
    (DECLARE (IGNORABLE))
    (LET ((#:G926
           (IO
            (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                      :FUNCTION
                                                                      (LAMBDA
                                                                          ()
                                                                        (DECLARE
                                                                         (IGNORABLE))
                                                                        "test")))))
      (DECLARE (IGNORABLE #:G926))
      (LET ((#:MATCH30 #:G926))
        (DECLARE (IGNORABLE #:MATCH30))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((FUNIT->A-373 #:MATCH30))
           (DECLARE (IGNORABLE FUNIT->A-373))
           (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL FUNIT->A-373))))))
  (SETF TEST-RUN-IO
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IO))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IOT-IDENTITY
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IOT-IDENTITY ()
    (DECLARE (IGNORABLE))
    (LET ((#:G427
           (RUNT!
            (IOT
             (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                       :FUNCTION
                                                                       (LAMBDA
                                                                           ()
                                                                         (DECLARE
                                                                          (IGNORABLE))
                                                                         (COALTON/MONAD/IDENTITY:IDENTITY
                                                                          "test")))))))
      (DECLARE (IGNORABLE #:G427))
      (LET ((#:MATCH31 #:G427))
        (DECLARE (IGNORABLE #:MATCH31))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((COALTON/MONAD/IDENTITY::A-13 #:MATCH31))
           (DECLARE (IGNORABLE COALTON/MONAD/IDENTITY::A-13))
           COALTON/MONAD/IDENTITY::A-13)))))
  (SETF TEST-RUN-IOT-IDENTITY
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IOT-IDENTITY))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IOT-IO
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IOT-IO ()
    (DECLARE (IGNORABLE))
    (LET ((#:G928
           (RUNT!
            (IOT
             (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                       :FUNCTION
                                                                       (LAMBDA
                                                                           ()
                                                                         (DECLARE
                                                                          (IGNORABLE))
                                                                         (IO
                                                                          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY
                                                                           :ARITY
                                                                           0
                                                                           :FUNCTION
                                                                           (LAMBDA
                                                                               ()
                                                                             (DECLARE
                                                                              (IGNORABLE))
                                                                             "test")))))))))
      (DECLARE (IGNORABLE #:G928))
      (LET ((#:MATCH32 #:G928))
        (DECLARE (IGNORABLE #:MATCH32))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((FUNIT->A-373 #:MATCH32))
           (DECLARE (IGNORABLE FUNIT->A-373))
           (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL FUNIT->A-373))))))
  (SETF TEST-RUN-IOT-IO
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IOT-IO))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IDENTITY
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IDENTITY ()
    (DECLARE (IGNORABLE))
    (LET ((#:G429 (COALTON/MONAD/IDENTITY:IDENTITY "test")))
      (DECLARE (IGNORABLE #:G429))
      (LET ((#:MATCH33 #:G429))
        (DECLARE (IGNORABLE #:MATCH33))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((COALTON/MONAD/IDENTITY::A-13 #:MATCH33))
           (DECLARE (IGNORABLE COALTON/MONAD/IDENTITY::A-13))
           COALTON/MONAD/IDENTITY::A-13)))))
  (SETF TEST-RUN-IDENTITY
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IDENTITY)))
 (VALUES))
