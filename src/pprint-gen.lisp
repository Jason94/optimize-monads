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
    (FLET ((F-54 ()
             (DECLARE (IGNORABLE))
             "test"))
      (F-54)))
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
      (LET ((#:MATCH32 #:G926))
        (DECLARE (IGNORABLE #:MATCH32))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((FUNIT->A-27 #:MATCH32))
           (DECLARE (IGNORABLE FUNIT->A-27))
           (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL FUNIT->A-27))))))
  (SETF TEST-RUN-IO
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IO))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IOT-IDENTITY
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IOT-IDENTITY ()
    (DECLARE (IGNORABLE))
    (LET ((#:G9028
           (LET ((#:G927
                  (IOT
                   (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY
                    :ARITY 0 :FUNCTION
                    (LAMBDA ()
                      (DECLARE (IGNORABLE))
                      (COALTON/MONAD/IDENTITY:IDENTITY "test"))))))
             (DECLARE (IGNORABLE #:G927))
             (LET ((#:MATCH34 #:G927))
               (DECLARE (IGNORABLE #:MATCH34))
               (LOCALLY
                (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
                (LET ((FUNIT->MA-38 #:MATCH34))
                  (DECLARE (IGNORABLE FUNIT->MA-38))
                  (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL
                   FUNIT->MA-38)))))))
      (DECLARE (IGNORABLE #:G9028))
      (LET ((#:MATCH33 #:G9028))
        (DECLARE (IGNORABLE #:MATCH33))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((COALTON/MONAD/IDENTITY::A-2 #:MATCH33))
           (DECLARE (IGNORABLE COALTON/MONAD/IDENTITY::A-2))
           COALTON/MONAD/IDENTITY::A-2)))))
  (SETF TEST-RUN-IOT-IDENTITY
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IOT-IDENTITY))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IOT-IO
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IOT-IO ()
    (DECLARE (IGNORABLE))
    (LET ((#:G930
           (LET ((#:G929
                  (IOT
                   (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY
                    :ARITY 0 :FUNCTION
                    (LAMBDA ()
                      (DECLARE (IGNORABLE))
                      (IO
                       (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY
                        :ARITY 0 :FUNCTION
                        (LAMBDA () (DECLARE (IGNORABLE)) "test"))))))))
             (DECLARE (IGNORABLE #:G929))
             (LET ((#:MATCH36 #:G929))
               (DECLARE (IGNORABLE #:MATCH36))
               (LOCALLY
                (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
                (LET ((FUNIT->MA-38 #:MATCH36))
                  (DECLARE (IGNORABLE FUNIT->MA-38))
                  (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL
                   FUNIT->MA-38)))))))
      (DECLARE (IGNORABLE #:G930))
      (LET ((#:MATCH35 #:G930))
        (DECLARE (IGNORABLE #:MATCH35))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((FUNIT->A-27 #:MATCH35))
           (DECLARE (IGNORABLE FUNIT->A-27))
           (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:EXACT-CALL FUNIT->A-27))))))
  (SETF TEST-RUN-IOT-IO
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IOT-IO))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-RUN-IDENTITY
                                                     COALTON-IMPL/RUNTIME/FUNCTION-ENTRY:FUNCTION-ENTRY)
  (DEFUN TEST-RUN-IDENTITY ()
    (DECLARE (IGNORABLE))
    (LET ((#:G9031 (COALTON/MONAD/IDENTITY:IDENTITY "test")))
      (DECLARE (IGNORABLE #:G9031))
      (LET ((#:MATCH37 #:G9031))
        (DECLARE (IGNORABLE #:MATCH37))
        (LOCALLY
         (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
         (LET ((COALTON/MONAD/IDENTITY::A-2 #:MATCH37))
           (DECLARE (IGNORABLE COALTON/MONAD/IDENTITY::A-2))
           COALTON/MONAD/IDENTITY::A-2)))))
  (SETF TEST-RUN-IDENTITY
          (COALTON-IMPL/RUNTIME/FUNCTION-ENTRY::MAKE-FUNCTION-ENTRY :ARITY 0
                                                                    :FUNCTION
                                                                    #'TEST-RUN-IDENTITY)))
 (VALUES))
