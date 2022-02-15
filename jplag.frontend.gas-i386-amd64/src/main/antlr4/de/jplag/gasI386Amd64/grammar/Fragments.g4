lexer grammar Fragments ;

ALPHA : [a-zA-Z] ;

DIGIT : [0-9] ;

fragment ESC   : '\\b' | '\\f' | '\\n' | '\\r' | '\\t' | '\\"' | '\\\\' ;

fragment CHAR_ESC : ESC | '\\\'' ;

fragment STR_ESC : ESC | '\\' DIGIT DIGIT DIGIT | ('x' | 'X') (DIGIT | [a-fA-F])+ ;

A     : [aA] ;
B     : ('b' | 'B') ;
C     : ('c' | 'C') ;
D     : ('d' | 'D') ;
E     : ('e' | 'E') ;
F     : ('f' | 'F') ;
G     : ('g' | 'G') ;
H     : ('h' | 'H') ;
I     : ('i' | 'I') ;
J     : ('j' | 'J') ;
K     : ('k' | 'K') ;
L     : ('l' | 'L') ;
M     : ('m' | 'M') ;
N     : ('n' | 'N') ;
O     : ('o' | 'O') ;
P     : ('p' | 'P') ;
Q     : ('q' | 'Q') ;
R     : ('r' | 'R') ;
S     : ('s' | 'S') ;
T     : ('t' | 'T') ;
U     : ('u' | 'U') ;
V     : ('v' | 'V') ;
W     : ('w' | 'W') ;
X     : ('x' | 'X') ;
Y     : ('y' | 'Y') ;
Z     : ('z' | 'Z') ;

DUMMY_TOKEN : 'ThIs iS a DuMmY tOkEn. It can be removed when the code gets generated' +
    'with antlr4 version 4.7.1 or higher. See https://github.com/antlr/antlr4/pull/2007 for details' ;
    // Could also be mitigated by putting the whole grammar into just one file.

