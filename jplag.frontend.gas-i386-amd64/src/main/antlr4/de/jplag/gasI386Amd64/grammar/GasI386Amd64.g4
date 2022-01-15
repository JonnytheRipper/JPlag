// Grammar according to the GNU Assembler "as" manual: https://sourceware.org/binutils/docs/as/

grammar GasI386Amd64 ;

import AssemblerDirectives, Fragments, Mnemonics ;

// Parser

program              : (statement_terminator | statement statement_terminator)+ | EOF ;

statement_terminator : '\n' | ';' ;

statement            : label* symbol? ;

label                : LABEL | LOCAL_LABEL ;

symbol               : assembler_directive | instruction | /*LOCAL_SYMBOL |*/ NAME | STRING ;

//assembler_directive  : ASSEMBLER_DIRECTIVE+ (NAME | STRING | integer | expr)* (',' (NAME | STRING | integer | expr))* ;

assembler_directive  : ASM_DIRECTIVE .*? ; //ASM_DIRECTIVE+ (NAME | STRING | integer | ',')* ;

instruction          : MNEMONIC (','? operand)* ;

operand              : mem_reference | REGISTER | immediate | NAME ;

mem_reference        : (REGISTER ':')? immediate? '(' REGISTER? ','? REGISTER? ','? integer? ')' ;

immediate            : '$'? (integer | NAME) ; // TODO: might be more like $number

integer              : PREFIX_OP? (BINARY_INT | OCT_INT | DEC_INT | HEX_INT) ;

//constant           : number | CHAR | STRING ;

number               : integer | FLOAT ;

argument             : symbol | number | '(' int_expr ')' ;

//expr               : (addr | numeric_value)? ;

expr                 : int_expr ; // check this and clean it up

int_expr             : PREFIX_OP? argument (INFIX_OP (PREFIX_OP)? argument)* ;

assignment           : symbol '=' expr ;

current_address      : '.' ;

// Lexer

REGISTER  : '%' 
          ( E A X | E B X | E C X | E D X | E D I | E S I | E B P | E S P // 32-bit registers
          | A X | B X | C X | D X | D I | S I | B P | S P                 // 16-bit low-end registers
          | A H | A L | B H | B L | C H | C L | D H | D L                 // 8-bit registers (high-bytes and low-bytes of the 16- bit registers)
          | C S | D S | S S | E S | F S | G S                             // section registers
          | C R [02348]                                                   // | C R '2' | C R '3' | C R '4' | C R '8' // processor control registers
          | D B [012367]                                                  // debug registers
          | T R [67]                                                      // test registers
          | S T ('(' [0-7] ')')?                                          // floating point register stack
          | M M [0-7]                                                     // MMX registers (overload for floating point register stack)
          | X M M [0-7]                                                   // 128-bit SSE registers
          | R A X | R B X | R C X | R D X | R D I | R S I | R B P | R S P // 64-bit registers
          | R ([89] | '1' [0-5])                                          // extended registers
          | R ([89] | '1' [0-5]) D                                        // 32-bit low ends of the extended registers
          | R ([89] | '1' [0-5]) W                                        // 16-bit low ends of the extended registers
          | R ([89] | '1' [0-5]) B                                        // low ends of the extended registers
          | S I L | D I L | B P L | S P L                                 // 8-bit registers
          | D B ([89] | '1' [0-5])                                        // debug registers
          | X M M ([89] | '1' [0-5])                                      // 128-bit SSE registers
          | Y M M ([89] | '1' [0-5])                                      // 256-bit SSE registers
          | Z M M ([0-9] | [12] [0-9] | '3' [01])                         // 512-bit registers
          | K [0-7]                                                       // mask registers k0–k7.
          ) ;

ASM_DIRECTIVE : ASSEMBLER_DIRECTIVE ;

LABEL               : NAME ':';

// For details on mnemonic suffixes see https://sourceware.org/binutils/docs/as/i386_002dVariations.html and https://sourceware.org/binutils/docs/as/i386_002dMnemonics.html#Instruction-Naming
MNEMONIC      : MNEMONICS (B | W | L | Q | X | Y | Z)? ;

//LOCAL_SYMBOL : '.'? L (ALPHA | DIGIT | [_.$])+ ;

LOCAL_LABEL   : (DIGIT+ ':') | (DIGIT+ ('f' | 'b')) ;

NAME          : [a-zA-Z_.$]+ [a-zA-Z0-9_.$]* ;

COMMENT       : (LINE_COMMENT | BLOCK_COMMENT) -> skip ;

fragment LINE_COMMENT  : '#'  ~'\n'* ;

fragment BLOCK_COMMENT : '/*' .*? '*/' ;

WS            : [ \t]+ -> skip ;

BINARY_INT    : '0' ('b' | 'B') [01]* ;

HEX_INT       : '0' ('x' | 'X') (DIGIT | [a-fA-F])+ ;

DEC_INT       : [1-9] DIGIT* ;

OCT_INT       : '0' [0-7]* ;

FLOAT         : '0' ALPHA ('+' | '-')? DIGIT* ('.' DIGIT*)? (('e' | 'E') ('+' | '-')? DIGIT+)? ;

CHAR          : '\'' (ALPHA | CHAR_ESC) '\'' ;

STRING        : '"' (ESC | .)*? '"' ;

PREFIX_OP : '-' | '~' ;

INFIX_OP  : '*' | '/' | '%' | '<<' | '>>'
          | '|' | '&' | '^' | '!'
          | '+' | '-' | '==' | '<>' | '!='
          | '<' | '>' | '>=' | '<='
          | '&&' | '||'
          ;
