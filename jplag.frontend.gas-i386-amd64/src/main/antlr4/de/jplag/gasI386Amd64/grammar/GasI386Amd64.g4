// Grammar according to the GNU Assembler "as" manual: https://sourceware.org/binutils/docs/as/

grammar GasI386Amd64 ;

import AssemblerDirectives, Fragments, Mnemonics ;

@lexer::header {
	import java.util.Set;
	import java.util.HashSet;
}

@lexer::members {
	Set<String> macroIdentifiers = new HashSet<String>();
}


// Parser

program
  : STATEMENT_TERMINATOR* EOF
  | (STATEMENT_TERMINATOR* statement STATEMENT_TERMINATOR)+ EOF
  ;

statement
  : label* 
  ( assemblerDirective
  | instruction
  | assignment
  | macroInvocation
  )?
  ;

label
  : symbol ':'
  | LOCAL_LABEL
  ;

symbol
  : '$'? SYMBOL_NAME
  | LOCAL_SYMBOL
  | LOCAL_LABEL_NAME
  | STRING
  ;

macroInvocation
  : MACRO_INVOCATION ~STATEMENT_TERMINATOR*
  ;

asmDirective
  : SECTION_DIR        # sectionDir
  | conditionDirective # conditionDir
  | MACRO_DIR          # macroDir
  | BUNDLE_DIR         # bundleDir
  | CFI_DIR            # cfiDir
  | ASSIGN_DIR         # assignDir
  | sequenceDirective  # sequenceDir
  | GENERIC_DIR        # genericDir
  ;

conditionDirective
  : CONDITION_DIR_IF .*? conditionDirective .*? CONDITION_DIR_END
  | CONDITION_DIR_IF .*? CONDITION_DIR_END
  ;

sequenceDirective
  : SEQUENCE_DIR_START .*? sequenceDirective .*? SEQUENCE_DIR_END
  | SEQUENCE_DIR_START .*? SEQUENCE_DIR_END
  ;

assemblerDirective
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

instruction
  : PREFIX_MNE* mnemonic ~STATEMENT_TERMINATOR*
  | PREFIX_MNE+ mnemonic? ~STATEMENT_TERMINATOR*
  ;

assignment
  : '$'? symbol '=' '='? ~STATEMENT_TERMINATOR+
  ;


// Lexer

// To avoid having the "symbol" rule applied before the imported assembler
// directive and mnemonic rules we have to redefine those imported rules before
// the "symbol" rule.
ASSIGN_DIR
  : ASSIGN_DIRECTIVE
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
SEQUENCE_DIR_END
  : SEQUENCE_DIRECTIVE_END
  ;

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
  ) [\t ]+ P T R
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

LOCAL_SYMBOL
  : '.'? 'L' (ALPHA | DIGIT | [_.$])+
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

STATEMENT_TERMINATOR
  : '\n'
  | '\r'
  | '\n\r'
  | ';'
  ;

// The '/' character introduces a comment as long as the --divide command line option has not been specified.
// Although this might collide with the '/' infix operator it does not lead to problems as we are usually not interested
// in the part that follows the division symbol.
LINE_COMMENT
  : ('#' | '/') ~'\n'* -> skip
  ;

BLOCK_COMMENT
  : '/*' .*? '*/' -> skip
  ;

MISC
  : ',' | ':' | '+' | '*' | '-' | '~' | '{' | '}' | '(' | ')' | '[' | ']' | '@' | '\\'
  ;
