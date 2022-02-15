// Grammar according to the GNU Assembler "as" manual: https://sourceware.org/binutils/docs/as/

grammar GasI386Amd64 ;

import AssemblerDirectives, Fragments, Mnemonics ;

// Parser

program              : (STATEMENT_TERMINATOR | statement STATEMENT_TERMINATOR)+ | EOF ;

//statementTerminator  : '\n' | ';' ;

statement            : setSymbol | (label* symbol?) ;

label                : '$'? NAME ':' | LOCAL_LABEL ;

symbol               : assemblerDirective | instruction /*| LOCAL_SYMBOL */ | '$'? NAME | STRING ;

asmDirective
  : SECTION_DIR       # sectionDir
  | CONDITION_DIR     # conditionDir
  | MACRO_DIR         # macroDir
  | BUNDLE_DIR        # bundleDir
  | CFI_DIR           # cfiDir
  | EQU_DIR           # equDir
  | GENERIC_DIR       # genericDir
  ;

assemblerDirective   : asmDirective ~STATEMENT_TERMINATOR* ;

mnemonic
  : MOV_MNE             # movMne
  | STACK_MNE           # stackMne
  | XCHG_MNE            # xchgMne
  | ARITHMETIC_MNE      # arithmeticMne
  | SYSCALL_MNE         # syscallMne
  | JMP_MNE             # jmpMne
  | CMP_MNE             # cmpMne
  | CALL_MNE            # callMne
  | RET_MNE             # retMne
  | LOGIC_MNE           # logicMne
  | BIT_MNE             # bitMne
  | GENERIC_MNE         # genericMne
  ;

/*pseudoPrefix
  : '{'
  ( D I S P ('8' | '16' | '32') // prefer 8/16/32-bit displacement
  | L O A D                     // prefer load-form instruction
  | S T O R E                   // prefer store-form instruction
  | V E X '3'?                  // encode with (3-byte)? VEX prefix
  | E V E X                     // encode with EVEX prefix
  | R E X                       // prefer REX prefix for integer and legacy vector instructions
  | N O O P T I M I Z E         // disable instruction size optimization
  ) '}' ;
*/             
instruction          : PSEUDO_PREFIX* mnemonic ('*'? operand | operand? (','? operand)*) ; // The ',' might be required.

operand
  : (REGISTER ':')? memReference EVEX?
  | REGISTER EVEX*
  | MEM_OP_PREFIX? (REGISTER ':')? immediate
  | EVEX
  ;
//| '$'? NAME ('@' NAME)? ;

memReference
  : (REGISTER ':')? immediate? '(' REGISTER? ','? REGISTER? ','? immediate? ')' // AT&T syntax
  | (REGISTER ':')? MEM_OP_PREFIX? (REGISTER ':')? '[' REGISTER? '+'? immediate? '*'? REGISTER? '*'? immediate? '+'? immediate? ']' // Intel syntax
  ;

//immediate            : '$'? (integer | '$'? NAME) ; // TODO: might be more like $number
immediate            : '$'? expr | label ; // could remove this and plug the "expr" right into the "operand"

integer              : ('-' | '~')? (BINARY_INT | OCT_INT | DEC_INT | HEX_INT) ;

//constant           : number | CHAR | STRING ;

number               : integer | FLOAT ;

argument             : symbol | (REGISTER ':')? number | subExpr | '$'? NAME ('@' NAME)? | currentAddress ;

//expr               : (addr | numeric_value)? ;

expr                 : intExpr ; // check this and clean it up

intExpr             : ('-' | '~')? argument ((INFIX_OP | '+' | '-' | '*') ('-' | '~')? argument)* ;

subExpr             : '(' intExpr ')' | ('-' | '~') argument ;

setSymbol           : symbol '=' expr ;

currentAddress      : '.' ;

//name                : (ALPHA | '_' | '.')+ (ALPHA | DIGIT | '_' | '.' | '$')* ;

// Lexer

LINE_COMMENT   : ('#' | '/') ~'\n'* -> skip ;

BLOCK_COMMENT  : '/*' .*? '*/' -> skip ;

// Registers according to https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=opcodes/i386-reg.tbl;h=faf8db4046b863e2981236fd275b63ba965318aa;hb=HEAD
REGISTER  : '%'?
          ( R A X | R B X | R C X | R D X | R D I | R S I | R B P | R S P // 64-bit registers
          | E A X | E B X | E C X | E D X | E D I | E S I | E B P | E S P // 32-bit registers
          | A X | B X | C X | D X | D I | S I | B P | S P                 // 16-bit low-end registers
          | A H | A L | B H | B L | C H | C L | D H | D L                 // 8-bit registers (high-bytes and low-bytes of the 16- bit registers)
          | A X L | B X L | C X L | D X L | D I L | S I L | S P L | B P L // 8-bit registers
          | C S | D S | S S | E S | F S | G S | F L A T                   // section/segment registers
          | C R ([0-9] | '1' [0-5])                                       // processor control registers
          | D B ([0-9] | '1' [0-5])                                       // debug registers
          | D R ([0-9] | '1' [0-5])                                       // debug registers
          | T R [0-7]                                                     // test registers
          | S T ('(' [0-7] ')')?                                          // floating point register stack
          | M M [0-7]                                                     // MMX registers (overload for floating point register stack)
          | R ([89] | '1' [0-5])                                          // extended registers
          | R ([89] | '1' [0-5]) D                                        // 32-bit low ends of the extended registers
          | R ([89] | '1' [0-5]) W                                        // 16-bit low ends of the extended registers
          | R ([89] | '1' [0-5]) B                                        // low ends of the extended registers
          | X M M ([0-9] | [12] [0-9] | '3' [01])                         // 128-bit SSE registers
          | Y M M ([0-9] | [12] [0-9] | '3' [01])                         // 256-bit SSE registers
          | Z M M ([0-9] | [12] [0-9] | '3' [01])                         // 512-bit registers
          | K [0-7]                                                       // vector mask registers k0–k7.
          | T M M [0-7]                                                   // TMM registers for AMX
          | B N D [0-3]                                                   // Bound registers for MPX
          | R I P | E I P
          | R I Z | E I Z
          | S T '('[1-7]')'                                               // fp registers.
          | E F L A G S | R F L A G S | F S '.' B A S E                   // Pseudo-register names
          | G S '.' B A S E | T R | L D T R                               // Pseudo-register names
          | S T [0-7] | F C W | F S W | M X C S R
          ) ;

PSEUDO_PREFIX
  : '{'
  ( D I S P ('8' | '16' | '32') // prefer 8/16/32-bit displacement
  | L O A D                     // prefer load-form instruction
  | S T O R E                   // prefer store-form instruction
  | V E X '3'?                  // encode with (3-byte)? VEX prefix
  | E V E X                     // encode with EVEX prefix
  | R E X                       // prefer REX prefix for integer and legacy vector instructions
  | N O O P T I M I Z E         // disable instruction size optimization
  ) '}' ;

//EVEX_MASK_REG   : '{' REGISTER '}' ('{' Z '}')? ;
//EVEX_BROADCAST  : 
//EVEX_ROUNDING   :
EVEX           : '{' .*? '}' ; // EVEX: instruction encoding support for AVX-512 instructions

STATEMENT_TERMINATOR : '\n' | '\r' | '\n\r' | ';' ;

SECTION_DIR    : SECTION_DIRECTIVE ;
CONDITION_DIR  : CONDITION_DIRECTIVE ;
MACRO_DIR      : MACRO_DIRECTIVE ;
BUNDLE_DIR     : BUNDLE_DIRECTIVE ;
CFI_DIR        : CFI_DIRECTIVE ;
EQU_DIR        : EQU_DIRECTIVE ;
GENERIC_DIR    : GENERIC_DIRECTIVE ; //TODO: should it be implemented like this: `~[\n;]*`? Would catch some lexer errors.


MEM_OP_PREFIX :
  ( B Y T E
  | D W O R D
  | F W O R D
  | Q W O R D
  | O W O R D
  | T B Y T E
  | W O R D
  | X M M W O R D
  | Y M M W O R D
  | Z M M W O R D
  ) [\t ]+ P T R ;

MOV_MNE            : MOV_MNEMONIC ;
STACK_MNE          : STACK_MNEMONIC ;
XCHG_MNE           : XCHG_MNEMONIC ;
ARITHMETIC_MNE     : ARITHMETIC_MNEMONIC ;
LOGIC_MNE          : LOGIC_MNEMONIC ;
SYSCALL_MNE        : SYSCALL_MNEMONIC ;
JMP_MNE            : JMP_MNEMONIC ;
CMP_MNE            : CMP_MNEMONIC ;
CALL_MNE           : CALL_MNEMONIC ;
RET_MNE            : RET_MNEMONIC ;
BIT_MNE            : BIT_MNEMONIC ;
GENERIC_MNE        : GENERIC_MNEMONIC ;

//LOCAL_SYMBOL : '.'? L (ALPHA | DIGIT | [_.$])+ ;

//LABEL          : '$'? NAME ':';
LOCAL_LABEL    : (DIGIT+ ':') | (DIGIT+ ('f' | 'b')) ;

WS             : [ \t]+ -> skip ;

BINARY_INT     : '0' ('b' | 'B') [01]* ;

HEX_INT        : '0' ('x' | 'X') (DIGIT | [a-fA-F])+ ;

DEC_INT        : [1-9] DIGIT* ;

OCT_INT        : '0' [0-7]* ;

FLOAT          : ('.' (F L O A T | S I N G L E | D O U B L E | T F L O A T) DEC_INT)? '0' ALPHA ('+' | '-')? DIGIT* ('.' DIGIT*)? (('e' | 'E') ('+' | '-')? DIGIT+)? ;

//NAME           : [a-zA-Z_.]+ [a-zA-Z0-9_.$]* ;
NAME           : (ALPHA | [_.])+ (ALPHA | DIGIT | [_.$])* ;

CHAR           : '\'' (ALPHA | CHAR_ESC) '\'' ;

STRING         : '"' (ESC | .)*? '"' | '\'' (ESC | .)*? '\'' ;

INFIX_OP       : '/' | '%' | '<<' | '>>'
               | '|' | '&' | '==' | '!='
               | '^' | '!' | '<=' | '>='
               | '<' | '>' | '&&' | '||'
               | '<>'
               ;
