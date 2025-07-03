
; Excluding these types of colons…
(pair ":" @_IGNORE_ (#set! capture.final))
(variable_statement ":" @_IGNORE_ (#set! capture.final))

; …all colons are a signal to indent.
; TODO: Python had more exceptions than these; see if that's true for GDScript
; as well.
":" @indent

; `elif` and `else` should only signal a dedent if they're not parsed as
; keywords – since, if they were parsed as keywords, that would signal that
; they're already correctly indented.
((identifier) @dedent
  (#match? @dedent "^(elif|else)$"))

(dictionary "{" @indent)
(dictionary "}" @dedent)

(array "[" @indent)
(array "]" @dedent)
