lexer grammar Fragments ;

fragment ALPHA : [a-zA-Z] ;

fragment DIGIT : [0-9] ;

fragment ESC   : '\\b' | '\\f' | '\\n' | '\\r' | '\\t' | '\\"' | '\\\\' ;

fragment CHAR_ESC : ESC | '\\\'' ;

fragment STR_ESC : ESC | '\\' DIGIT DIGIT DIGIT | ('x' | 'X') (DIGIT | [a-fA-F])+ ;

fragment A     : [aA] ;
fragment B     : ('b' | 'B') ;
fragment C     : ('c' | 'C') ;
fragment D     : ('d' | 'D') ;
fragment E     : ('e' | 'E') ;
fragment F     : ('f' | 'F') ;
fragment G     : ('g' | 'G') ;
fragment H     : ('h' | 'H') ;
fragment I     : ('i' | 'I') ;
fragment J     : ('j' | 'J') ;
fragment K     : ('k' | 'K') ;
fragment L     : ('l' | 'L') ;
fragment M     : ('m' | 'M') ;
fragment N     : ('n' | 'N') ;
fragment O     : ('o' | 'O') ;
fragment P     : ('p' | 'P') ;
fragment Q     : ('q' | 'Q') ;
fragment R     : ('r' | 'R') ;
fragment S     : ('s' | 'S') ;
fragment T     : ('t' | 'T') ;
fragment U     : ('u' | 'U') ;
fragment V     : ('v' | 'V') ;
fragment W     : ('w' | 'W') ;
fragment X     : ('x' | 'X') ;
fragment Y     : ('y' | 'Y') ;
fragment Z     : ('z' | 'Z') ;

DUMMY_TOKEN : 'ThIs iS a DuMmY tOkEn. It can be removed when the code gets generated' +
    'with antlr4 version 4.7.1 or higher. See https://github.com/antlr/antlr4/pull/2007 for details' ;
    // Could also be mitigated by putting the whole grammar into just one file.

