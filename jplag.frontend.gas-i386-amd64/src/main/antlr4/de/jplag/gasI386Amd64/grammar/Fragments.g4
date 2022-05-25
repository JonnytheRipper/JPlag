lexer grammar Fragments ;

fragment ALPHA
  : [a-zA-Z] ;

fragment DIGIT
  : [0-9] ;

fragment ESC
  : '\\b' | '\\f' | '\\n' | '\\r' | '\\t' | '\\"' | '\\\\' ;

fragment CHAR_ESC
  : ESC | '\\\'' ;

fragment STR_ESC
  : ESC | '\\' DIGIT DIGIT DIGIT | ('x' | 'X') (DIGIT | [a-fA-F])+ ;

fragment A
  : ('a' | 'A') ;

fragment B
  : ('b' | 'B') ;

fragment C
  : ('c' | 'C') ;

fragment D
  : ('d' | 'D') ;

fragment E
  : ('e' | 'E') ;

fragment F
  : ('f' | 'F') ;

fragment G
  : ('g' | 'G') ;

fragment H
  : ('h' | 'H') ;

fragment I
  : ('i' | 'I') ;

fragment J
  : ('j' | 'J') ;

fragment K
  : ('k' | 'K') ;

fragment L
  : ('l' | 'L') ;

fragment M
  : ('m' | 'M') ;

fragment N
  : ('n' | 'N') ;

fragment O
  : ('o' | 'O') ;

fragment P
  : ('p' | 'P') ;

fragment Q
  : ('q' | 'Q') ;

fragment R
  : ('r' | 'R') ;

fragment S
  : ('s' | 'S') ;

fragment T
  : ('t' | 'T') ;

fragment U
  : ('u' | 'U') ;

fragment V
  : ('v' | 'V') ;

fragment W
  : ('w' | 'W') ;

fragment X
  : ('x' | 'X') ;

fragment Y
  : ('y' | 'Y') ;

fragment Z
  : ('z' | 'Z') ;
  