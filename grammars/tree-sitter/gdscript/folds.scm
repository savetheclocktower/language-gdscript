;


; (if_statement (body (_) @fold.start))

(if_statement (body) @fold (#set! fold.endAt endPosition))
((elif_clause) @fold (#set! fold.endAt endPosition))
((else_clause) @fold (#set! fold.endAt endPosition))


([
  (function_definition)
  (for_statement)
  (while_statement)
  (match_statement)
  (class_definition)
  (constructor_definition)
  (get_body)
  (set_body)
  (setget)
] @fold
  (#set! fold.endAt endPosition))

[
  (enumerator_list)
  (array)
  (dictionary)
] @fold
