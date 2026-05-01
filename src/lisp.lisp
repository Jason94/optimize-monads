(in-package :cl-user)

(cl:declaim (cl:optimize (cl:speed 3) (cl:debug 0) (cl:safety 0)))

(cl:defun test-cl-pass-lambda-concat ()
  (cl:let* ((do-concat (cl:lambda (s)
                         (cl:concatenate 'cl:string s "concat")))
            (apply-to-test (cl:lambda (f)
                             (cl:funcall f "test"))))
    (cl:funcall apply-to-test do-concat)))

(defun test-cl-pass-lambda-concat-bind ()
  (flet ((bind (func a->func)
           (lambda ()
             (funcall (funcall a->func (funcall func))))))
    (let* ((pure-test (lambda ()
                        "test"))
           (apply-to-test (lambda (s)
                            (lambda ()
                              (concatenate 'string s "concat")))))
      (funcall (bind pure-test apply-to-test)))))


(disassemble 'test-bind-io)
