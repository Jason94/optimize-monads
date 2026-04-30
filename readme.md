# Optimizing Coalton Monads

Exploratory results for optimizing Coalton monads. See src/main.lisp for simple functions defined using:
* Direct function return
* Creating an internal, non-escaped lambda and calling it
* Running the IO monad
* Running the IO monad transformer over the identity monad
* Running the IO monad transformer over the IO monad
* Running the identity monad.

To see the coalton-generated Common Lisp code, see pprint-gen.lisp.

To see the ultimately compiled SBCL bytecode, see disassemble.txt.

Compiled with the following Coalton options:
```
(let ((config '((:compiler-mode          "release")
                (:print-unicode          t)
                (:perform-specialization t)
                (:perform-inlining       t)
                (:emit-type-annotations  nil)
                (:print-types            nil)
                (:print-rewrites         t))))
  (setf (symbol-plist ':coalton-config) nil)
  (loop :for (key value) :in config
        :do (setf (get ':coalton-config key) value)))
```

