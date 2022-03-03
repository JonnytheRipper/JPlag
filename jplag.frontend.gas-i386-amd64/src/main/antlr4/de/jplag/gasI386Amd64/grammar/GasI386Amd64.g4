// Grammar according to the GNU Assembler "as" manual: https://sourceware.org/binutils/docs/as/

grammar GasI386Amd64 ;

import AssemblerDirectives, Fragments, Mnemonics ;

// Parser

program              : (statement STATEMENT_TERMINATOR)+
                     | STATEMENT_TERMINATOR+
                     | EOF
                     ;

statement            : label* symbol?
                     | assignment
                     | equality
                     ;

label                : '$'? SYMBOL_NAME ':'
                     | '$'? symbolMnemonic ':'
                     | '$'? REGISTER ':'
                     | '$'? MEM_OP_PREFIX ':'
                     | LOCAL_LABEL
                     ;

symbol               : assemblerDirective // Might make a lot of sense to move assemblerDirective and instruction directly into statement
                     | instruction
                     | '$'? SYMBOL_NAME
                   /*| LOCAL_SYMBOL */
                     | LOCAL_LABEL_NAME
                     | STRING
                     ;

asmDirective
  : SECTION_DIR       # sectionDir
  | CONDITION_DIR     # conditionDir
  | MACRO_DIR         # macroDir
  | BUNDLE_DIR        # bundleDir
  | CFI_DIR           # cfiDir
  | EQU_DIR           # equDir
  | ASSIGN_DIR        # assignDir
  | GENERIC_DIR       # genericDir
  ;

assemblerDirective   : asmDirective ~STATEMENT_TERMINATOR* ;

//assemblerDirective : (sectionDir | conditionDir | macroDir | bundleDir | cfiDir | equDir | assignDir | genericDir) .*? STATEMENT_TERMINATOR ;

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
  | PREFIX_MNE          # prefixMne
  | GENERIC_MNE         # genericMne
  ;

symbolMnemonic // Circumvents the listener
  : MOV_MNE
  | STACK_MNE
  | XCHG_MNE
  | ARITHMETIC_MNE
  | SYSCALL_MNE
  | JMP_MNE
  | CMP_MNE
  | CALL_MNE
  | RET_MNE
  | LOGIC_MNE
  | BIT_MNE
  | PREFIX_MNE
  | GENERIC_MNE
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

/*instr_prefix
  : OP_ADDR_PREFIX
  | PSEUDO_PREFIX
  | REPEAT_PREFIX
  | REX_PREFIX
  | BUS_LOCK_PREFIX
  | CO_PROCESSOR_PREFIX
  ;*/

instruction
  : mnemonic+ ('*'? operand | operand? (','? operand)*) ; // The ',' might be required.

operand
  : (REGISTER ':')? memReference ('{' .*? '}')? //EVEX?
  | REGISTER ('{' .*? '}')* //EVEX*
  | MEM_OP_PREFIX? (REGISTER ':')? immediate
  | '{' .*? '}' // EVEX
  //| '$'? SYMBOL_NAME // Basically a label without ':' or the result of an assignment.
  //| LOCAL_LABEL_NAME
  ;
//| '$'? SYMBOL_NAME ('@' '$'? SYMBOL_NAME)? ;

memReference
  : (REGISTER ':')? immediate? '(' REGISTER? ','? REGISTER? ','? immediate? ')' // AT&T syntax
  | (REGISTER ':')? MEM_OP_PREFIX? (REGISTER ':')? '[' REGISTER? '+'? immediate? '*'? REGISTER? '*'? immediate? '+'? immediate? ']' // Intel syntax
  ;

immediate            : expr
                     | '$'? LOL
                     | LOCAL_LABEL_NAME
                     | '$'? symbolMnemonic // In case a symbol has the same name as a mnemonic.
                     ;

integer              : ('-' | '~')? (BINARY_INT | OCT_INT | DEC_INT | HEX_INT) ;

//constant           : number | CHAR | STRING ; // Not sure if this is even needed somewhere.

number               : '$'? (integer | FLOAT) ;

argument             : '$'? SYMBOL_NAME ('@' '$'? SYMBOL_NAME)?
                     | (REGISTER ':')? number
                     | '$'? subExpr
                     | LOCAL_LABEL_NAME
                     | currentAddress
                     | symbolMnemonic
                     | REGISTER
                     | MEM_OP_PREFIX
                     ;

expr                 : intExpr ; // or empty

intExpr             : ('-' | '~')? argument ((INFIX_OP | '+' | '-' | '*' | '==') ('-' | '~')? argument)* ;

subExpr             : '(' intExpr ')'
                    | ('-' | '~') argument
                    ;

assignment          : '$'? SYMBOL_NAME '=' expr ;

equality            : '$'? SYMBOL_NAME '==' expr ;

currentAddress      : '.' ;

//symbolName        : SYMBOL_NAME | assemblerDirective ; //(ALPHA | '_')+ (ALPHA | DIGIT | '_' | '.' | '$')* ;


// Lexer

// The '/' character introduces a comment as long as the --divide command line option has not been specified.
// Although this might collide with the '/' infix operator it does not lead to problems as we are usually not interested
// in the part that follows the division symbol. 
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

/*PSEUDO_PREFIX
  : '{'
  ( D I S P ('8' | '16' | '32') // prefer 8/16/32-bit displacement
  | L O A D                     // prefer load-form instruction
  | S T O R E                   // prefer store-form instruction
  | V E X '3'?                  // encode with (3-byte)? VEX prefix
  | E V E X                     // encode with EVEX prefix
  | R E X                       // prefer REX prefix for integer and legacy vector instructions
  | N O O P T I M I Z E         // disable instruction size optimization
  ) '}'
  ;

OP_ADDR_PREFIX
  : A D D R ('16' | '32')
  | D A T A ('16' | '32')
  ;

REPEAT_PREFIX
  : R E P
  | R E P E
  | R E P Z
  | R E P N E
  | R E P N Z
  ;

REX_PREFIX
  : R E X
  | R E X Z
  | R E X Y
  | R E X Y Z
  | R E X X
  | R E X X Z
  | R E X X Y
  | R E X X Y Z
  | R E X '6' '4'
  | R E X '6' '4' Z
  | R E X '6' '4' Y
  | R E X '6' '4' Y Z
  | R E X '6' '4' X
  | R E X '6' '4' X Z
  | R E X '6' '4' X Y
  | R E X '6' '4' X Y Z
  | R E X '.' B
  | R E X '.' X
  | R E X '.' X B
  | R E X '.' R
  | R E X '.' R B
  | R E X '.' R X
  | R E X '.' R X B
  | R E X '.' W
  | R E X '.' W B
  | R E X '.' W X
  | R E X '.' W X B
  | R E X '.' W R
  | R E X '.' W R B
  | R E X '.' W R X
  | R E X '.' W R X B
  ;

BUS_LOCK_PREFIX : L O C K ; // Bus lock prefix
CO_PROCESSOR_PREFIX : W A I T ;// Coprocessor prefix
*/

//EVEX_MASK_REG   : '{' REGISTER '}' ('{' Z '}')? ;
//EVEX_BROADCAST  : 
//EVEX_ROUNDING   :
//TODO: EVEX could be removed as it gets handled with the mnemonics. Additionally, its application in the parser seems questionable.
//EVEX           : '{' .*? '}' ; // EVEX: instruction encoding support for AVX-512 instructions

STATEMENT_TERMINATOR : '\n' | '\r' | '\n\r' | ';' ;

SECTION_DIR    : SECTION_DIRECTIVE ;
CONDITION_DIR  : CONDITION_DIRECTIVE ;
MACRO_DIR      : MACRO_DIRECTIVE ;
BUNDLE_DIR     : BUNDLE_DIRECTIVE ;
CFI_DIR        : CFI_DIRECTIVE ;
EQU_DIR        : EQU_DIRECTIVE ;
ASSIGN_DIR     : ASSIGN_DIRECTIVE ;
GENERIC_DIR    : GENERIC_DIRECTIVE ;

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
PREFIX_MNE         : PREFIX_MNEMONIC ;
GENERIC_MNE        : GENERIC_MNEMONIC ;

//LOCAL_SYMBOL : '.'? L (ALPHA | DIGIT | [_.$])+ ;

LOCAL_LABEL        : (DIGIT+ ':') ;

LOCAL_LABEL_NAME     : (DIGIT+ ('f' | 'b')) ;

WS                 : [ \t]+ -> skip ;

BINARY_INT         : '0' ('b' | 'B') [01]* ;

HEX_INT            : '0' ('x' | 'X') (DIGIT | [a-fA-F])+ ;

DEC_INT            : [1-9] DIGIT* ;

OCT_INT            : '0' [0-7]* ;

FLOAT              : ('.' (F L O A T | S I N G L E | D O U B L E | T F L O A T) DEC_INT)? '0' ALPHA ('+' | '-')? DIGIT* ('.' DIGIT*)? (('e' | 'E') ('+' | '-')? DIGIT+)? ;

//SYMBOL_NAME             : [a-zA-Z_.]+ [a-zA-Z0-9_.$]* ;
SYMBOL_NAME        : (ALPHA | [_.])+ (ALPHA | DIGIT | [_.$])* ;

LOL : SYMBOL_NAME ;

CHAR               : '\'' (ALPHA | CHAR_ESC) '\'' ;

STRING             : '"' (ESC | .)*? '"'
                   | '\'' (ESC | .)*? '\'' ;

INFIX_OP           : '/' | '%' | '<<' | '>>'
                   | '|' | '&' | '<>' | '!='
                   | '^' | '!' | '<=' | '>='
                   | '<' | '>' | '&&' | '||'
                   ;
