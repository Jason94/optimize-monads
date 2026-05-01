(PROGN
 (LOCALLY
  (DECLARE (OPTIMIZE (SB-C::TYPE-CHECK 0)))
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-DIRECT-CONCAT
                                                     FUNCTION)
  (DEFUN TEST-DIRECT-CONCAT ()
    (DECLARE (IGNORABLE))
    (COALTON/STRING::|INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>| "test"
                                                                    "concat"))
  (SETF TEST-DIRECT-CONCAT #'TEST-DIRECT-CONCAT)
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-LAMBDA-CONCAT
                                                     FUNCTION)
  (DEFUN TEST-LAMBDA-CONCAT ()
    (DECLARE (IGNORABLE))
    (FLET ((G-5370 ()
             (DECLARE (IGNORABLE))
             (FLET ((F-5371 ()
                      (DECLARE (IGNORABLE))
                      "test"))
               (FLET ((DO-CONCAT-5372 (S-5373)
                        (DECLARE (IGNORABLE S-5373))
                        (COALTON/STRING::|INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>|
                         S-5373 "concat")))
                 (DO-CONCAT-5372 (F-5371))))))
      (G-5370)))
  (SETF TEST-LAMBDA-CONCAT #'TEST-LAMBDA-CONCAT)
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-PASS-LAMBDA-CONCAT
                                                     FUNCTION)
  (DEFUN TEST-PASS-LAMBDA-CONCAT ()
    (DECLARE (IGNORABLE))
    (LET ((DO-CONCAT-5374))
      (DECLARE (IGNORABLE DO-CONCAT-5374))
      (FLET ((DO-CONCAT-5374 (S-5375)
               (DECLARE (IGNORABLE S-5375))
               (COALTON/STRING::|INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>|
                S-5375 "concat")))
        (SETF DO-CONCAT-5374 #'DO-CONCAT-5374)
        (FLET ((APPLY-TO-TEST-5376 (F-5377)
                 (DECLARE (IGNORABLE F-5377))
                 (FUNCALL F-5377 "test")))
          (APPLY-TO-TEST-5376 DO-CONCAT-5374)))))
  (SETF TEST-PASS-LAMBDA-CONCAT #'TEST-PASS-LAMBDA-CONCAT)
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-MAP-IO FUNCTION)
  (DEFUN TEST-MAP-IO ()
    (DECLARE (IGNORABLE))
    (LET ((F-5378))
      (DECLARE (IGNORABLE F-5378))
      (FLET ((F-5378 (S-5379)
               (DECLARE (IGNORABLE S-5379))
               (COALTON/STRING::|INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>|
                S-5379 "concat")))
        (SETF F-5378 #'F-5378)
        (LET ((#:G932
               (LET ((#:G1231 (IO (LAMBDA () (DECLARE (IGNORABLE)) "test"))))
                 (DECLARE (IGNORABLE #:G1231))
                 (LET ((#:FB->C-531830 F-5378))
                   (DECLARE (IGNORABLE #:FB->C-531830))
                   (LET ((#:MATCH42 #:G1231))
                     (DECLARE (IGNORABLE #:MATCH42))
                     (LOCALLY
                      (DECLARE
                       (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
                      (LET ((FUNIT->B-5319 #:MATCH42))
                        (DECLARE (IGNORABLE FUNIT->B-5319))
                        (IO
                         (LAMBDA ()
                           (DECLARE (IGNORABLE))
                           (FUNCALL #:FB->C-531830
                                    (FUNCALL FUNIT->B-5319)))))))))))
          (DECLARE (IGNORABLE #:G932))
          (LET ((#:MATCH41 #:G932))
            (DECLARE (IGNORABLE #:MATCH41))
            (LOCALLY
             (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
             (LET ((FUNIT->A-5317 #:MATCH41))
               (DECLARE (IGNORABLE FUNIT->A-5317))
               (FUNCALL FUNIT->A-5317))))))))
  (SETF TEST-MAP-IO #'TEST-MAP-IO)
  (COALTON-IMPL/GLOBAL-LEXICAL:DEFINE-GLOBAL-LEXICAL TEST-MAP-IOT-IO FUNCTION)
  (DEFUN TEST-MAP-IOT-IO ()
    (DECLARE (IGNORABLE))
    (LET ((F-5380))
      (DECLARE (IGNORABLE F-5380))
      (FLET ((F-5380 (S-5381)
               (DECLARE (IGNORABLE S-5381))
               (COALTON/STRING::|INSTANCE/SEMIGROUP STRING-COALTON/CLASSES:<>|
                S-5381 "concat")))
        (SETF F-5380 #'F-5380)
        (LET ((#:G938
               (LET ((#:G937
                      (LET ((#:F-532934 F-5380))
                        (DECLARE (IGNORABLE #:F-532934))
                        (LET ((#:IO-533035
                               (IOT
                                (LAMBDA ()
                                  (DECLARE (IGNORABLE))
                                  (IO
                                   (LAMBDA () (DECLARE (IGNORABLE)) "test"))))))
                          (DECLARE (IGNORABLE #:IO-533035))
                          (IOT
                           (LAMBDA ()
                             (DECLARE (IGNORABLE))
                             (LET ((#:G1240
                                    (LET ((#:G93536 #:IO-533035))
                                      (DECLARE (IGNORABLE #:G93536))
                                      (LET ((#:MATCH46 #:G93536))
                                        (DECLARE (IGNORABLE #:MATCH46))
                                        (LOCALLY
                                         (DECLARE
                                          (SB-EXT:MUFFLE-CONDITIONS
                                           SB-EXT:CODE-DELETION-NOTE))
                                         (LET ((FUNIT->MA-5328 #:MATCH46))
                                           (DECLARE (IGNORABLE FUNIT->MA-5328))
                                           (FUNCALL FUNIT->MA-5328)))))))
                               (DECLARE (IGNORABLE #:G1240))
                               (LET ((#:FB->C-531839 #:F-532934))
                                 (DECLARE (IGNORABLE #:FB->C-531839))
                                 (LET ((#:MATCH45 #:G1240))
                                   (DECLARE (IGNORABLE #:MATCH45))
                                   (LOCALLY
                                    (DECLARE
                                     (SB-EXT:MUFFLE-CONDITIONS
                                      SB-EXT:CODE-DELETION-NOTE))
                                    (LET ((FUNIT->B-5319 #:MATCH45))
                                      (DECLARE (IGNORABLE FUNIT->B-5319))
                                      (IO
                                       (LAMBDA ()
                                         (DECLARE (IGNORABLE))
                                         (FUNCALL #:FB->C-531839
                                                  (FUNCALL
                                                   FUNIT->B-5319)))))))))))))))
                 (DECLARE (IGNORABLE #:G937))
                 (LET ((#:MATCH44 #:G937))
                   (DECLARE (IGNORABLE #:MATCH44))
                   (LOCALLY
                    (DECLARE
                     (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
                    (LET ((FUNIT->MA-5328 #:MATCH44))
                      (DECLARE (IGNORABLE FUNIT->MA-5328))
                      (FUNCALL FUNIT->MA-5328)))))))
          (DECLARE (IGNORABLE #:G938))
          (LET ((#:MATCH43 #:G938))
            (DECLARE (IGNORABLE #:MATCH43))
            (LOCALLY
             (DECLARE (SB-EXT:MUFFLE-CONDITIONS SB-EXT:CODE-DELETION-NOTE))
             (LET ((FUNIT->A-5317 #:MATCH43))
               (DECLARE (IGNORABLE FUNIT->A-5317))
               (FUNCALL FUNIT->A-5317))))))))
  (SETF TEST-MAP-IOT-IO #'TEST-MAP-IOT-IO))
 (VALUES))
