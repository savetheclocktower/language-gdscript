;

(comment) @comment.line.gdscript

(null) @constant.language.null.gdscript
[(true) (false)] @constant.language.boolean.__TYPE__.gdscript

(annotation
  ["@" (identifier)] @keyword.other.annotation.gdscript)

; NUMBERS
; =======

[(integer) (float)] @constant.language.numeric.__TYPE__.gdscript


; STRINGS
; =======

; BUG: All string delimiters are aliased to "\"" (though it helps us out in this instance)
((string "\""
   @punctuation.definition.string.begin.gdscript)
  (#is? test.first))

((string "\""
   @punctuation.definition.string.end.gdscript)
  (#is? test.last))


((string) @string.quoted.triple.double.gdscript
  (#match? @string.quoted.triple.double.gdscript "^\"\"\"")
  (#set! capture.final))

((string) @string.quoted.triple.single.gdscript
  (#match? @string.quoted.triple.single.gdscript "^'''")
  (#set! capture.final))

((string) @string.quoted.raw.double.gdscript
  (#match? @string.quoted.raw.double.gdscript "^r\"")
  (#set! capture.final))

((string) @string.quoted.raw.single.gdscript
  (#match? @string.quoted.raw.single.gdscript "^r'")
  (#set! capture.final))


((string) @string.quoted.double.gdscript
  (#match? @string.quoted.double.gdscript "^\""))

((string) @string.quoted.single.gdscript
  (#match? @string.quoted.single.gdscript "^'"))

((string) @string.quoted.single.gdscript
  (#match? @string.quoted.single.gdscript "^'"))

(get_node) @string.unquoted.node.gdscript

(escape_sequence) @constant.character.escape.gdscript

; Let's treat `StringName`s like Ruby `Symbol`s.

(string_name) @constant.other.string-name.gdscript

(
  "\"" @punctuation.definition.string.begin.gdscript
  (#is? test.first)
  (#is? test.descendantOfType "string_name")
)

(
  "\"" @punctuation.definition.string.end.gdscript
  (#is? test.last)
  (#is? test.descendantOfType "string_name")
)

(node_path) @string.quoted.other.node-path.gdscript

((node_path) @keyword.operator.other.node-path.gdscript
  (#set! adjust.endAfterFirstMatchOf "^@|\\^"))


; KEYWORDS
; ========

[
  "if"
  "else"
  "elif"
  "while"
  "for"
  "return"
  "break"
  "continue"
  "pass"
  "match"
  "await"
] @keyword.control._TEXT_.gdscript

(breakpoint_statement) @keyword.control.breakpoint.gdscript

; OPERATORS
; =========

[
  "+" "-" "*" "/" "%" "**"
] @keyword.operator.arithmetic.gdscript

[
  ">"
  "<"
  ">="
  "<="
  "=="
  "!="
] @keyword.operator.comparison.gdscript

["=" "-=" "+=" "*=" "/=" "%=" ":=" "**="] @keyword.operator.assignment.gdscript

["&" "|" "^" "~" ">>" "<<"] @keyword.operator.bitwise.gdscript

[
  "and"
  "or"
  "not"
  "in"
  "is"
  "as"
  "&&"
  "||"
] @keyword.operator.logical.gdscript

"." @keyword.operator.accessor.gdscript

"!" @keyword.operator.unary.gdscript

; FUNCTIONS
; =========

(function_definition (name) @entity.name.function.gdscript)

(constructor_definition
  "_init" @entity.name.function.constructor.gdscript)

(call (identifier) @support.other.function.gdscript)

; STORAGE
; =======

[
  "var"
  "const"
  "func"
  "class"
  "enum"
  "signal"
] @storage.type._TEXT_.gdscript

[
  "remote"
  "master"
  "puppet"
  "remotesync"
  "mastersync"
  "puppetsync"
] @storage.modifier._TEXT_.gdscript

(static_keyword) @storage.modifier.static.gdscript

"class_name" @storage.type.class-name.gdscript

[
  "extends"
  "onready"
  "export"
] @storage.modifier._TEXT_.gdscript

(tool_statement) @storage.modifier.tool.gdscript



(type (identifier) @support.storage.other.type.gdscript)

((identifier) @support.storage.other.type.gdscript
  (#is? test.descendantOfType "type"))

; ENTITIES
; ========

(class_definition (name) @entity.name.type.class.gdscript)

(class_name_statement
  (name) @entity.name.type.class.name.gdscript)

(enum_definition name: (name) @entity.name.type.enum.gdscript)

(pair key: (identifier) @entity.other.attribute-name.gdscript)

((identifier) @constant.other.gdscript
  (#match? @constant.other.gdscript "^([A-Z_][A-Z0-9_]*)$"))

(set_body "set" @entity.name.function.setter.gdscript)
(get_body "get" @entity.name.function.getter.gdscript)

(setget ["get" "set"] @storage.type.other._TEXT_.gdscript)
(setget (setter) @entity.name.function.setter.gdscript)
(setget (getter) @entity.name.function.getter.gdscript)

(signal_statement
  (name) @entity.name.type.signal.gdscript)

; VARIABLES
; =========

(parameters
  (identifier) @variable.parameter.gdscript)

(default_parameter
  (identifier) @variable.parameter.default.gdscript)

(typed_parameter
  (identifier) @variable.parameter.typed.gdscript)

(typed_default_parameter
  (identifier) @variable.parameter.typed.default.gdscript)

(assignment
  left: (attribute (identifier) @variable.other.assignment.property.gdscript)
)

(variable_statement
  name: (name) @variable.other.assignment.gdscript)

(export_variable_statement
  name: (name) @variable.other.assignment.export.gdscript)

(assignment
  left: (identifier)
  @variable.other.assignment.gdscript)

(const_statement
  name: (name) @variable.other.constant.assignment.gdscript)

((identifier) @variable.language.super.gdscript
  (#eq? @variable.language.super.gdscript "super"))

(for_statement
  left: (identifier) @variable.other.assignment.loop.gdscript)

(enumerator
  left: (identifier) @variable.other.assignment.enum.gdscript)

; SUPPORT
; =======

((call (identifier) @support.type.class.gdscript)
  (#match? @support.type.class.gdscript "^(int|print|range|Vector2|Vector3)$"))

((base_call (identifier) @support.other.function.gdscript))

(attribute_call (identifier) @support.other.function.method.gdscript)

; PUNCTUATION
; ===========

":" @punctuation.separator.colon.gdscript
"," @punctuation.separator.comma.gdscript

"{" @punctuation.definition.block.begin.bracket.curly.gdscript
"}" @punctuation.definition.block.end.bracket.curly.gdscript
"(" @punctuation.definition.begin.bracket.round.gdscript
")" @punctuation.definition.end.bracket.round.gdscript
"[" @punctuation.definition.begin.bracket.square.gdscript
"]" @punctuation.definition.end.bracket.square.gdscript

"->" @punctuation.function.return-type.gdscript
