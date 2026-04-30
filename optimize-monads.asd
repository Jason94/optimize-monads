(asdf:defsystem "optimize-monads"
  :defsystem-depends-on ("coalton-asdf")
  :depends-on ("coalton")
  :pathname "src/"
  :serial t
  :components
  (
    (:file "main")
  )
)
