// Grammar according to the GNU Assembler "as" manual: https://sourceware.org/binutils/docs/as/

grammar GasI386Amd64 ;

import AssemblerDirectives, Fragments, Mnemonics ;

@lexer::header {
	import java.util.Set;
	import java.util.HashSet;
}

@lexer::members {
	// Stores macro names so they can be identified when being invoked.
	public Set<String> macroIdentifiers = new HashSet<String>();
}

// Parser

program
 : statement+
 | EOF
 ;

statement
  : label* 
  ( instruction
  | assemblerDirective
  | assignment
  | macroInvocation
  )? STATEMENT_TERMINATOR
  ;

label
  : symbol ':'
  | LOCAL_LABEL
  ;

register
  : REGISTER_NAME
  | SECTION_OVERRIDE_PREFIX
  ;

symbol
  : '$'? SYMBOL_NAME
  | LOCAL_SYMBOL
  | LOCAL_LABEL_NAME
  | STRING
  | CHAR
  | mnemonic // In case a symbol is named like a mnemonic
  | '$'
  ;

macroInvocation
// We need to ignore anything before the STATEMENT_TERMINATOR as the macro
// invocation might have arguments.
  : MACRO_INVOCATION ~STATEMENT_TERMINATOR*
  ;

asmDirective
  : SECTION_DIR        # sectionDir
  | CONDITION_DIR      # conditionDir
  | MACRO_DIR          # macroDir
  | BUNDLE_DIR         # bundleDir
  | CFI_DIR            # cfiDir
  | SEQUENCE_DIR       # sequenceDir
  | GENERIC_DIR        # genericDir
  ;

assemblerDirective
  // We need to ignore anything between the assembler directive and the
  // STATEMENT_TERMINATOR as the assembler directive might have arguments.
  : asmDirective ~STATEMENT_TERMINATOR*
  ;

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

integer
  : ('-' | '~')? (BINARY_INT | OCT_INT | DEC_INT | HEX_INT)
  ;

number
  : '$'? (integer | FLOAT) ;

subExpr
  : '(' expr ')'
  | ('-' | '~') argument
  ;

argument
  : section? number
  | '$'? subExpr
  | LOCAL_LABEL_NAME
  | MEM_OP_PREFIX
  | symbol+ ('@' symbol)?
  ;

expr
  : ('-' | '~')? argument ((INFIX_OP | '+' | '-' | '*' | '==') ('-' | '~')? argument)*
  ;

immediate
  : expr 
  | symbol
  | LOCAL_LABEL_NAME
  ;

section
  : SECTION_OVERRIDE_PREFIX ':' '*'?
  | integer ':'
  ;

displacement
  : expr
  ;

base
  : register
  ;

index
  : register
  ;

scale
  : integer
  | expr
  ;

memReference
  // Using a wildcard within () would make the memory reference look like an
  // expression.
  : section? displacement? '(' base ','? index? ','? scale? ')' // AT&T syntax
  | section? displacement? '(' base? ','? index ','? scale? ')' // AT&T syntax
  | section? displacement? '(' base? ','? index? ','? scale ')' // AT&T syntax
  | MEM_OP_PREFIX* section* immediate? INTEL_SYNTAX_MEM_REF // Intel syntax
  | section (integer | symbol) // AT&T and Intel syntax
  ;

// These are the four categories we recognize for each instruction operand
operand
  : register EVEX*                       # registerOperand
  | memReference+ EVEX*                  # memReferenceOperand
  | MEM_OP_PREFIX? section? immediate    # immediateOperand
  | EVEX                                 # evexOperand
  ;

instruction
  : PREFIX_MNE* mnemonic '*'? operand? (',' operand)*
  | PREFIX_MNE+ mnemonic? '*'? operand? (',' operand)*
  ;

assignment
  : ASSIGNMENT
  | ASSIGN_DIR
  ;


// Lexer

MEM_OP_PREFIX :
  ( B Y T E
  | D W O R D
  | F W O R D
  | M M W O R D
  | O F F S E T
  | O W O R D
  | Q W O R D
  | T B Y T E
  | W O R D
  | X M M W O R D
  | Y M M W O R D
  | Z M M W O R D
  ) ([\t ]+ P T R)?
  ;

ASSIGNMENT
  : '$'? SYMBOL_NAME [\t ]* ('=' | '==') [\t ]* ~[\n\r;#]+
  ;

// To avoid having the "SYMBOL_NAME" rule applied before the imported assembler
// directive and mnemonic rules we have to redefine those imported rules before
// the "SYMBOL_NAME" rule.
ASSIGN_DIR
  : '.'
  ( E Q U
  | E Q U I V
  | E Q V
  | S E T
  ) [\t ]+ '$'? SYMBOL_NAME ~[\n\r;#]+
  ;

BUNDLE_DIR
  : BUNDLE_DIRECTIVE
  ;
CFI_DIR
  : CFI_DIRECTIVE
  ;
CONDITION_DIR_IF
  : CONDITION_DIRECTIVE_IF
  ;
CONDITION_DIR_ELSE
  : CONDITION_DIRECTIVE_ELSE
  ;
CONDITION_DIR_END
  : CONDITION_DIRECTIVE_END
  ;
CONDITION_DIR
  : CONDITION_DIR_IF .*? CONDITION_DIR .*? CONDITION_DIR_END
  | CONDITION_DIR_IF .*? CONDITION_DIR_END
  ;
GENERIC_DIR
  : GENERIC_DIRECTIVE
  ;
MACRO_DIR :
  '.'
  ( M A C R O WS '$'? SYMBOL_NAME .*? '.' (E X I T M | E N D M)
    {
      macroIdentifiers.add(getText().replace(",", " ").split("\\s+")[1]);
    }
  | A L T M A C R O
  | N O A L T M A C R O
  | P U R G E M WS '$'? SYMBOL_NAME
    {
      macroIdentifiers.remove(getText().split("\\s+")[1]);
    }
  )
  ;
SECTION_DIR
  : SECTION_DIRECTIVE
  ;
SEQUENCE_DIR_START
  : SEQUENCE_DIRECTIVE_START
  ;
SEQUENCE_DIR
  : SEQUENCE_DIR_START .*? SEQUENCE_DIR .*? SEQUENCE_DIR_END
  | SEQUENCE_DIR_START .*? SEQUENCE_DIR_END
  ;
SEQUENCE_DIR_END
  : SEQUENCE_DIRECTIVE_END
  ;

ARITHMETIC_MNE
  : ARITHMETIC_MNEMONIC
  ;
BIT_MNE
  : BIT_MNEMONIC
  ;
CALL_MNE
  : CALL_MNEMONIC
  ;
CMP_MNE
  : CMP_MNEMONIC
  ;
GENERIC_MNE
  : GENERIC_MNEMONIC
  ;
JMP_MNE
  : JMP_MNEMONIC
  ;
LOGIC_MNE
  : LOGIC_MNEMONIC
  ;
MOV_MNE
  : MOV_MNEMONIC
  ;
PREFIX_MNE
  : PREFIX_MNEMONIC
  ;
RET_MNE
  : RET_MNEMONIC
  ;
STACK_MNE
  : STACK_MNEMONIC
  ;
SYSCALL_MNE
  : SYSCALL_MNEMONIC
  ;
XCHG_MNE
  : XCHG_MNEMONIC
  ;

REGISTER_NAME
  : '%'?
  ( R A X | R B X | R C X | R D X | R D I | R S I | R B P | R S P // 64-bit registers
  | E A X | E B X | E C X | E D X | E D I | E S I | E B P | E S P // 32-bit registers
  | A X | B X | C X | D X | D I | S I | B P | S P                 // 16-bit low-end registers
  | A H | A L | B H | B L | C H | C L | D H | D L                 // 8-bit registers (high-bytes and low-bytes of the 16- bit registers)
  | A X L | B X L | C X L | D X L | D I L | S I L | S P L | B P L // 8-bit registers
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
  )
  ;

SECTION_OVERRIDE_PREFIX
  : '%'?
  ( C S
  | D S
  | E S
  | F S
  | G S
  | S S
  | F L A T
  )
  ;

INTEL_SYNTAX_MEM_REF
  : '[' ~[,\n\r;#]+
  ;

LOCAL_SYMBOL
  : '.L' (ALPHA | DIGIT | [_.$])+
  ;

LOCAL_LABEL
  : (DIGIT+ ':')
  ;

LOCAL_LABEL_NAME
  : (DIGIT+ ('f' | 'b'))
  ;

WS
  : [ \t]+ -> skip
  ;

BINARY_INT
  : '0' ('b' | 'B') [01]*
  ;

HEX_INT
  : '0' ('x' | 'X') (DIGIT | [a-fA-F])+
  ;

DEC_INT
  : [1-9] DIGIT*
  ;

OCT_INT
  : '0' [0-7]*
  ;

FLOAT
  : ('.' (F L O A T | S I N G L E | D O U B L E | T F L O A T) DEC_INT)? '0' ALPHA ('+' | '-')? DIGIT* ('.' DIGIT*)? (('e' | 'E') ('+' | '-')? DIGIT+)?
  ;

SYMBOL_NAME
  : (ALPHA | [_.])+ (ALPHA | DIGIT | [_.$])*
  {
    if (macroIdentifiers.contains(this.getText())) {
      this.setType(MACRO_INVOCATION);
    }
  }
  ;

MACRO_INVOCATION
  : SYMBOL_NAME
  ;

CHAR
  : '\'' (ALPHA | CHAR_ESC) '\''
  ;

STRING
  : '"' (ESC | .)*? '"'
  | '\'' (ESC | .)*? '\''
  ;

INFIX_OP
  : '/' | '%' | '<<' | '>>'
  | '|' | '&' | '<>' | '!='
  | '^' | '!' | '<=' | '>='
  | '<' | '>' | '&&' | '||'
  ;

EVEX
  : '{' .*? '}'
  ;

STATEMENT_TERMINATOR
  : '\n'
  | '\r'
  | '\n\r'
  | ';'
  ;

LINE_COMMENT
  : '#' ~'\n'* -> skip
  ;

BLOCK_COMMENT
  : '/*' .*? '*/' -> skip
  ;

MISC
  : ',' | '+' | '*' | '-' | '~' | '{' | '}' | '(' | ')' | '[' | ']' | '@' | '\\'
  ;
