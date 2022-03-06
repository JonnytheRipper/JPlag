// Taken from GNU binutils auto generated opcodes table https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=opcodes/i386-tbl.h;hb=HEAD
// For details on mnemonic suffixes see https://sourceware.org/binutils/docs/as/i386_002dVariations.html and https://sourceware.org/binutils/docs/as/i386_002dMnemonics.html#Instruction-Naming

lexer grammar Mnemonics ;
import Fragments ;

fragment
MOV_MNEMONIC :
  ( M O V
  | M O V A B S
  | M O V Q
  | M O V B E
  | M O V S B L
  | M O V S B W
  | M O V S W L
  | M O V S B Q
  | M O V S W Q
  | M O V S L Q
  | M O V S X
  | M O V S X D
  | M O V Z B
  | M O V Z W
  | M O V Z X
  | M O V S
  | M O V S D
  | S M O V
  | C M O V O
  | C M O V N O
  | C M O V B
  | C M O V C
  | C M O V N A E
  | C M O V N B
  | C M O V N C
  | C M O V A E
  | C M O V E
  | C M O V Z
  | C M O V N E
  | C M O V N Z
  | C M O V B E
  | C M O V N A
  | C M O V N B E
  | C M O V A
  | C M O V S
  | C M O V N S
  | C M O V P
  | C M O V P E
  | C M O V N P
  | C M O V P O
  | C M O V L
  | C M O V N G E
  | C M O V N L
  | C M O V G E
  | C M O V L E
  | C M O V N G
  | C M O V N L E
  | C M O V G
  | F C M O V B
  | F C M O V N A E
  | F C M O V E
  | F C M O V B E
  | F C M O V N A
  | F C M O V U
  | F C M O V A E
  | F C M O V N B
  | F C M O V N E
  | F C M O V A
  | F C M O V N B E
  | F C M O V N U
  | M O V N T I
  | M O V D
  | M A S K M O V Q
  | M O V A P S
  | M O V H L P S
  | M O V H P S
  | M O V L H P S
  | M O V L P S
  | M O V M S K P S
  | M O V N T P S
  | M O V N T Q
  | M O V N T D Q
  | M O V S S
  | M O V U P S
  | P M O V M S K B
  | M O V A P D
  | M O V H P D
  | M O V L P D
  | M O V M S K P D
  | M O V N T P D
  | M O V U P D
  | M A S K M O V D Q U
  | M O V D Q A
  | M O V D Q U
  | M O V D Q '2' Q
  | M O V Q '2' D Q
  | M O V D D U P
  | M O V S H D U P
  | M O V S L D U P
  | M O V N T D Q A
  | P M O V S X B W
  | P M O V S X B D
  | P M O V S X B Q
  | P M O V S X W D
  | P M O V S X W Q
  | P M O V S X D Q
  | P M O V Z X B W
  | P M O V Z X B D
  | P M O V Z X B Q
  | P M O V Z X W D
  | P M O V Z X W Q
  | P M O V Z X D Q
  | V M A S K M O V D Q U
  | V M A S K M O V P D
  | V M A S K M O V P S
  | V M O V A P D
  | V M O V A P S
  | V M O V D
  | V M O V D D U P
  | V M O V D Q A
  | V M O V D Q U
  | V M O V H L P S
  | V M O V H P D
  | V M O V H P S
  | V M O V L H P S
  | V M O V L P D
  | V M O V L P S
  | V M O V M S K P D
  | V M O V M S K P S
  | V M O V N T D Q
  | V M O V N T D Q A
  | V M O V N T P D
  | V M O V N T P S
  | V M O V Q
  | V M O V S D
  | V M O V S H D U P
  | V M O V S L D U P
  | V M O V S S
  | V M O V U P D
  | V M O V U P S
  | V P M O V M S K B
  | V P M O V S X B D
  | V P M O V S X B Q
  | V P M O V S X B W
  | V P M O V S X D Q
  | V P M O V S X W D
  | V P M O V S X W Q
  | V P M O V Z X B D
  | V P M O V Z X B Q
  | V P M O V Z X B W
  | V P M O V Z X D Q
  | V P M O V Z X W D
  | V P M O V Z X W Q
  | V M O V D Q A '6' '4'
  | V M O V D Q A '3' '2'
  | V M O V D Q U '3' '2'
  | V M O V D Q U '6' '4'
  | V P M O V D B
  | V P M O V S D B
  | V P M O V U S D B
  | V P M O V D W
  | V P M O V S D W
  | V P M O V U S D W
  | V P M O V Q B
  | V P M O V S Q B
  | V P M O V U S Q B
  | V P M O V Q D
  | V P M O V S Q D
  | V P M O V U S Q D
  | V P M O V Q W
  | V P M O V S Q W
  | V P M O V U S Q W
  | K M O V D
  | K M O V Q
  | V M O V D Q U '8'
  | V M O V D Q U '1' '6'
  | V P M O V B '2' M
  | V P M O V W '2' M
  | V P M O V M '2' B
  | V P M O V M '2' W
  | V P M O V S W B
  | V P M O V U S W B
  | V P M O V W B
  | K M O V B
  | V P M O V D '2' M
  | V P M O V Q '2' M
  | V P M O V M '2' D
  | V P M O V M '2' Q
  | M O V D I R I
  | M O V D I R '6' '4' B
  | V P M A S K M O V D
  | V P M A S K M O V Q
  | B N D M O V
  | K M O V W
  | M O V N T S D
  | M O V N T S S
  | V P C M O V
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

STACK_MNEMONIC : // Maybe divide it into push and pop? 
  ( P U S H
  |	P U S H A
  | P U S H F
  | P O P
  | P O P A
  | P O P F
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

XCHG_MNEMONIC :
  ( X C H G
  | C M P X C H G
  | C M P X C H G '8' B
  | C M P X C H G '1' '6' B
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

ARITHMETIC_MNEMONIC :
  ( A D D
  | A D C
  | F A D D
  | F I A D D
  | F A D D P
  | X A D D // Might also fit into XCHG_MNEMONIC
  | V F M A D D P D
  | V F M A D D P S
  | V F M A D D S D
  | V F M A D D S S
  | V F N M A D D P D
  | V F N M A D D P S
  | V F N M A D D S D
  | V F N M A D D S S
  | V F M A D D S U B P D
  | V F M A D D S U B P S
  | I N C
  | S U B
  | F S U B
  | F I S U B
  | F S U B P
  | F S U B R
  | F I S U B R
  | F S U B R P
  | P S U B B
  | P S U B W
  | P S U B D
  | P S U B Q
  | P S U B S B
  | P S U B S W
  | P S U B U S B
  | P S U B U S W
  | V F M S U B A D D P D
  | V F M S U B A D D P S
  | V F M S U B P D
  | V F M S U B P S
  | V F M S U B S D
  | V F M S U B S S
  | V F N M S U B P D
  | V F N M S U B P S
  | V F N M S U B S D
  | V F N M S U B S S
  | D E C
  | M U L
  | I M U L
  | F M U L
  | F I M U L
  | F M U L P
  | D I V
  | I D I V
  | F D I V
  | F I D I V
  | F D I V P
  | F D I V R
  | F I D I V R
  | F D I V R P
  | A D D P D
  | A D D S D
  | D I V P D
  | D I V S D
  | M A X P D
  | M A X S D
  | M I N P D
  | M I N S D
  | M U L P D
  | M U L S D
  | S Q R T P D
  | S Q R T S D
  | S U B P D
  | S U B S D
  | P A D D B
  | P A D D W
  | P A D D D
  | P A D D Q
  | P A D D S B
  | P A D D S W
  | P A D D U S B
  | P A D D U S W
  | P M A D D W D
  | P M U L H W
  | P M U L L W
  | A D D P S
  | A D D S S
  | D I V P S
  | D I V S S
  | M A X P S
  | M A X S S
  | M I N P S
  | M I N S S
  | M U L P S
  | M U L S S
  | P M A X S W
  | P M A X U B
  | P M I N S W
  | P M I N U B
  | M U L X
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

SYSCALL_MNEMONIC :
  ( S Y S C A L L
  | S Y S E N T E R
  | S Y S E X I T
  | S Y S R E T
  ) ;

JMP_MNEMONIC :
  ( J M P
  | L J M P
  | J O
  | J N O
  | J B
  | J C
  | J N A E
  | J N B
  | J N C
  | J A E
  | J E
  | J Z
  | J N E
  | J N Z
  | J B E
  | J N A
  | J N B E
  | J A
  | J S
  | J N S
  | J P
  | J P E
  | J N P
  | J P O
  | J L
  | J N G E
  | J N L
  | J G E
  | J L E
  | J N G
  | J N L E
  | J G
  | J C X Z
  | J E C X Z
  | J R C X Z
  ) (B | W | L | Q | X | Y | Z)? ('.' D DIGIT+)? ;

CMP_MNEMONIC :
  ( C M P
  | C M P S
  | C M P S D
  | C M P E Q P S
  | C M P L T P S
  | C M P L E P S
  | C M P U N O R D P S
  | C M P N E Q P S
  | C M P N L T P S
  | C M P N L E P S
  | C M P O R D P S
  | C M P E Q S S
  | C M P L T S S
  | C M P L E S S
  | C M P U N O R D S S
  | C M P N E Q S S
  | C M P N L T S S
  | C M P N L E S S
  | C M P O R D S S
  | C M P P S
  | C M P S S
  | P C M P E Q B
  | P C M P E Q W
  | P C M P E Q D
  | P C M P G T B
  | P C M P G T W
  | P C M P G T D
  | C M P E Q P D
  | C M P L T P D
  | C M P L E P D
  | C M P U N O R D P D
  | C M P N E Q P D
  | C M P N L T P D
  | C M P N L E P D
  | C M P O R D P D
  | C M P E Q S D
  | C M P L T S D
  | C M P L E S D
  | C M P U N O R D S D
  | C M P N E Q S D
  | C M P N L T S D
  | C M P N L E S D
  | C M P O R D S D
  | C M P P D
  | P C M P E Q Q
  | P C M P G T Q
  | P C M P E S T R I
  | P C M P E S T R M
  | P C M P I S T R I
  | P C M P I S T R M
  | V C M P E Q P D
  | V C M P E Q '_' O Q P D
  | V C M P L T P D
  | V C M P L T '_' O S P D
  | V C M P L E P D
  | V C M P L E '_' O S P D
  | V C M P U N O R D P D
  | V C M P U N O R D '_' Q P D
  | V C M P N E Q P D
  | V C M P N E Q '_' U Q P D
  | V C M P N L T P D
  | V C M P N L T '_' U S P D
  | V C M P N L E P D
  | V C M P N L E '_' U S P D
  | V C M P O R D P D
  | V C M P O R D '_' Q P D
  | V C M P E Q '_' U Q P D
  | V C M P N G E P D
  | V C M P N G E '_' U S P D
  | V C M P N G T P D
  | V C M P N G T '_' U S P D
  | V C M P F A L S E P D
  | V C M P F A L S E '_' O Q P D
  | V C M P N E Q '_' O Q P D
  | V C M P G E P D
  | V C M P G E '_' O S P D
  | V C M P G T P D
  | V C M P G T '_' O S P D
  | V C M P T R U E P D
  | V C M P T R U E '_' U Q P D
  | V C M P E Q '_' O S P D
  | V C M P L T '_' O Q P D
  | V C M P L E '_' O Q P D
  | V C M P U N O R D '_' S P D
  | V C M P N E Q '_' U S P D
  | V C M P N L T '_' U Q P D
  | V C M P N L E '_' U Q P D
  | V C M P O R D '_' S P D
  | V C M P E Q '_' U S P D
  | V C M P N G E '_' U Q P D
  | V C M P N G T '_' U Q P D
  | V C M P F A L S E '_' O S P D
  | V C M P N E Q '_' O S P D
  | V C M P G E '_' O Q P D
  | V C M P G T '_' O Q P D
  | V C M P T R U E '_' U S P D
  | V C M P E Q P S
  | V C M P E Q '_' O Q P S
  | V C M P L T P S
  | V C M P L T '_' O S P S
  | V C M P L E P S
  | V C M P L E '_' O S P S
  | V C M P U N O R D P S
  | V C M P U N O R D '_' Q P S
  | V C M P N E Q P S
  | V C M P N E Q '_' U Q P S
  | V C M P N L T P S
  | V C M P N L T '_' U S P S
  | V C M P N L E P S
  | V C M P N L E '_' U S P S
  | V C M P O R D P S
  | V C M P O R D '_' Q P S
  | V C M P E Q '_' U Q P S
  | V C M P N G E P S
  | V C M P N G E '_' U S P S
  | V C M P N G T P S
  | V C M P N G T '_' U S P S
  | V C M P F A L S E P S
  | V C M P F A L S E '_' O Q P S
  | V C M P N E Q '_' O Q P S
  | V C M P G E P S
  | V C M P G E '_' O S P S
  | V C M P G T P S
  | V C M P G T '_' O S P S
  | V C M P T R U E P S
  | V C M P T R U E '_' U Q P S
  | V C M P E Q '_' O S P S
  | V C M P L T '_' O Q P S
  | V C M P L E '_' O Q P S
  | V C M P U N O R D '_' S P S
  | V C M P N E Q '_' U S P S
  | V C M P N L T '_' U Q P S
  | V C M P N L E '_' U Q P S
  | V C M P O R D '_' S P S
  | V C M P E Q '_' U S P S
  | V C M P N G E '_' U Q P S
  | V C M P N G T '_' U Q P S
  | V C M P F A L S E '_' O S P S
  | V C M P N E Q '_' O S P S
  | V C M P G E '_' O Q P S
  | V C M P G T '_' O Q P S
  | V C M P T R U E '_' U S P S
  | V C M P E Q S D
  | V C M P E Q '_' O Q S D
  | V C M P L T S D
  | V C M P L T '_' O S S D
  | V C M P L E S D
  | V C M P L E '_' O S S D
  | V C M P U N O R D S D
  | V C M P U N O R D '_' Q S D
  | V C M P N E Q S D
  | V C M P N E Q '_' U Q S D
  | V C M P N L T S D
  | V C M P N L T '_' U S S D
  | V C M P N L E S D
  | V C M P N L E '_' U S S D
  | V C M P O R D S D
  | V C M P O R D '_' Q S D
  | V C M P E Q '_' U Q S D
  | V C M P N G E S D
  | V C M P N G E '_' U S S D
  | V C M P N G T S D
  | V C M P N G T '_' U S S D
  | V C M P F A L S E S D
  | V C M P F A L S E '_' O Q S D
  | V C M P N E Q '_' O Q S D
  | V C M P G E S D
  | V C M P G E '_' O S S D
  | V C M P G T S D
  | V C M P G T '_' O S S D
  | V C M P T R U E S D
  | V C M P T R U E '_' U Q S D
  | V C M P E Q '_' O S S D
  | V C M P L T '_' O Q S D
  | V C M P L E '_' O Q S D
  | V C M P U N O R D '_' S S D
  | V C M P N E Q '_' U S S D
  | V C M P N L T '_' U Q S D
  | V C M P N L E '_' U Q S D
  | V C M P O R D '_' S S D
  | V C M P E Q '_' U S S D
  | V C M P N G E '_' U Q S D
  | V C M P N G T '_' U Q S D
  | V C M P F A L S E '_' O S S D
  | V C M P N E Q '_' O S S D
  | V C M P G E '_' O Q S D
  | V C M P G T '_' O Q S D
  | V C M P T R U E '_' U S S D
  | V C M P E Q S S
  | V C M P E Q '_' O Q S S
  | V C M P L T S S
  | V C M P L T '_' O S S S
  | V C M P L E S S
  | V C M P L E '_' O S S S
  | V C M P U N O R D S S
  | V C M P U N O R D '_' Q S S
  | V C M P N E Q S S
  | V C M P N E Q '_' U Q S S
  | V C M P N L T S S
  | V C M P N L T '_' U S S S
  | V C M P N L E S S
  | V C M P N L E '_' U S S S
  | V C M P O R D S S
  | V C M P O R D '_' Q S S
  | V C M P E Q '_' U Q S S
  | V C M P N G E S S
  | V C M P N G E '_' U S S S
  | V C M P N G T S S
  | V C M P N G T '_' U S S S
  | V C M P F A L S E S S
  | V C M P F A L S E '_' O Q S S
  | V C M P N E Q '_' O Q S S
  | V C M P G E S S
  | V C M P G E '_' O S S S
  | V C M P G T S S
  | V C M P G T '_' O S S S
  | V C M P T R U E S S
  | V C M P T R U E '_' U Q S S
  | V C M P E Q '_' O S S S
  | V C M P L T '_' O Q S S
  | V C M P L E '_' O Q S S
  | V C M P U N O R D '_' S S S
  | V C M P N E Q '_' U S S S
  | V C M P N L T '_' U Q S S
  | V C M P N L E '_' U Q S S
  | V C M P O R D '_' S S S
  | V C M P E Q '_' U S S S
  | V C M P N G E '_' U Q S S
  | V C M P N G T '_' U Q S S
  | V C M P F A L S E '_' O S S S
  | V C M P N E Q '_' O S S S
  | V C M P G E '_' O Q S S
  | V C M P G T '_' O Q S S
  | V C M P T R U E '_' U S S S
  | V C M P P D
  | V C M P P S
  | V C M P S D
  | V C M P S S
  | V P C M P E Q B
  | V P C M P E Q D
  | V P C M P E Q Q
  | V P C M P E Q W
  | V P C M P E S T R I
  | V P C M P E S T R M
  | V P C M P G T B
  | V P C M P G T D
  | V P C M P G T Q
  | V P C M P G T W
  | V P C M P I S T R I
  | V P C M P I S T R M
  | V P C M P D
  | V P C M P L T D
  | V P C M P L E D
  | V P C M P N E Q D
  | V P C M P N L T D
  | V P C M P N L E D
  | V P C M P U D
  | V P C M P E Q U D
  | V P C M P L T U D
  | V P C M P L E U D
  | V P C M P N E Q U D
  | V P C M P N L T U D
  | V P C M P N L E U D
  | V P C M P Q
  | V P C M P L T Q
  | V P C M P L E Q
  | V P C M P N E Q Q
  | V P C M P N L T Q
  | V P C M P N L E Q
  | V P C M P U Q
  | V P C M P E Q U Q
  | V P C M P L T U Q
  | V P C M P L E U Q
  | V P C M P N E Q U Q
  | V P C M P N L T U Q
  | V P C M P N L E U Q
  | V P C M P B
  | V P C M P L T B
  | V P C M P L E B
  | V P C M P N E Q B
  | V P C M P N L T B
  | V P C M P N L E B
  | V P C M P U B
  | V P C M P E Q U B
  | V P C M P L T U B
  | V P C M P L E U B
  | V P C M P N E Q U B
  | V P C M P N L T U B
  | V P C M P N L E U B
  | V P C M P W
  | V P C M P L T W
  | V P C M P L E W
  | V P C M P N E Q W
  | V P C M P N L T W
  | V P C M P N L E W
  | V P C M P U W
  | V P C M P E Q U W
  | V P C M P L T U W
  | V P C M P L E U W
  | V P C M P N E Q U W
  | V P C M P N L T U W
  | V P C M P N L E U W
  ) (B | W | L | Q | X | Y | Z)? ('.' S)? ('.' D DIGIT+)? ;

CALL_MNEMONIC :
  ( C A L L
  | L C A L L
  ) (B | W | L | Q | X | Y | Z)? ;

RET_MNEMONIC :
  ( R E T
  | L R E T
  | L E A V E
  | R E T F
  | I R E T
  | U I R E T
  ) (B | W | L | Q | X | Y | Z)? ;

LOGIC_MNEMONIC :
  ( A N D
  | O R
  | X O R
  | P O R
  | N O T
  | N E G
  | P X O R
  | P A N D
  | P A N D N
  | A N D N P S
  | A N D P S
  | X O R P S
  | A N D N P D
  | A N D P D
  | V A N D N P D
  | V A N D N P S
  | V A N D P D
  | V A N D P S
  | V P A N D
  | V P A N D N
  | V O R P D
  | V O R P S
  | A N D N
  | O R P S
  | O R P D
  | X O R P D
  | V P A N D D
  | V P A N D N D
  | K O R W
  | K X N O R W
  | K X O R W
  | K N O T W
  | K O R T E S T W
  | V X O R P D
  | V X O R P S
  | V P X O R
  | V P O R
  | V P O R D
  | V P X O R D
  | V P A N D N Q
  | V P A N D Q
  | V P O R Q
  | V P X O R Q
  | V P T E S T M D
  | V P T E S T N M D
  | V P T E S T M Q
  | V P T E S T N M Q
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

BIT_MNEMONIC :
  ( T E S T
  | R O L
  | R O R
  | R C L
  | R C R
  | S A L
  | S H L
  | S H R
  | S A R
  | S H L D
  | S H R D
  | R O R X
  | S A R X
  | S H L X
  | S H R X
  | V P R O L D
  | V P R O R D
  | V P R O L Q
  | V P R O R Q
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;

PREFIX_MNEMONIC :
  ( A D D R '1' '6'
  | A D D R '3' '2'
  | B N D
  | D A T A '1' '6'
  | D A T A '3' '2'
  | L O C K
  | N O T R A C K
  | W A I T
  | R E P
  | R E P E
  | R E P Z
  | R E P N E
  | R E P N Z
  | R E X
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
  | '{' D I S P '8' '}'
  | '{' D I S P '1' '6' '}'
  | '{' D I S P '3' '2' '}'
  | '{' L O A D '}'
  | '{' S T O R E '}'
  | '{' V E X '}'
  | '{' V E X '2' '}'
  | '{' V E X '3' '}'
  | '{' E V E X '}'
  | '{' R E X '}'
  | '{' N O O P T I M I Z E '}'
  | C S
  | D S
  | E S
  | F S
  | G S
  | S S
  | X A C Q U I R E
  | X R E L E A S E
  ) ;

//TODO: LOAD_MNEMONIC :
// e.g. LODS

GENERIC_MNEMONIC :
  ( I N
  | O U T
  | L E A
  | L D S
  | L E S
  | L F S
  | L G S
  | L S S
  | C L C
  | C L D
  | C L I
  | C L T S
  | C M C
  | L A H F
  | S A H F
  | S T C
  | S T D
  | S T I
  | S B B
  | C L R
  | A A A
  | A A S
  | D A A
  | D A S
  | A A D
  | A A M
  | C B W
  | C D Q E
  | C W D E
  | C W D
  | C D Q
  | C Q O
  | C B T W
  | C L T Q
  | C W T L
  | C W T D
  | C L T D
  | C Q T O
  | E N T E R
  | L O O P
  | L O O P Z
  | L O O P E
  | L O O P N Z
  | L O O P N E
  | S E T O
  | S E T N O
  | S E T B
  | S E T C
  | S E T N A E
  | S E T N B
  | S E T N C
  | S E T A E
  | S E T E
  | S E T Z
  | S E T N E
  | S E T N Z
  | S E T B E
  | S E T N A
  | S E T N B E
  | S E T A
  | S E T S
  | S E T N S
  | S E T P
  | S E T P E
  | S E T N P
  | S E T P O
  | S E T L
  | S E T N G E
  | S E T N L
  | S E T G E
  | S E T L E
  | S E T N G
  | S E T N L E
  | S E T G
  | S C M P
  | I N S
  | O U T S
  | L O D S
  | S L O D
  | S C A S
  | S S C A
  | S T O S
  | S S T O
  | X L A T
  | B S F
  | B S R
  | B T
  | B T C
  | B T R
  | B T S
  | I N T '1'
  | I N T '3'
  | I N T ([01]?[0-9][0-9]? | '2'[0-4][0-9] | '2''5'[0-5])
  | I N T O
  | R S M
  | B O U N D
  | H L T
  | N O P
  | A R P L
  | L A R
  | L G D T
  | L I D T
  | L L D T
  | L M S W
  | L S L
  | L T R
  | S G D T
  | S I D T
  | S L D T
  | S M S W
  | S T R
  | V E R R
  | V E R W
  | F L D
  | F I L D
  | F I L D L L
  | F L D T
  | F B L D
  | F S T
  | F I S T
  | F S T P
  | F I S T P
  | F I S T P L L
  | F S T P T
  | F B S T P
  | F X C H
  | F C O M
  | F I C O M
  | F C O M P
  | F I C O M P
  | F C O M P P
  | F U C O M
  | F U C O M P
  | F U C O M P P
  | F T S T
  | F X A M
  | F L D '1'
  | F L D L '2' T
  | F L D L '2' E
  | F L D P I
  | F L D L G '2'
  | F L D L N '2'
  | F L D Z
  | F '2' X M '1'
  | F Y L '2' X
  | F P T A N
  | F P A T A N
  | F X T R A C T
  | F P R E M '1'
  | F D E C S T P
  | F I N C S T P
  | F P R E M
  | F Y L '2' X P '1'
  | F S Q R T
  | F S I N C O S
  | F R N D I N T
  | F S C A L E
  | F S I N
  | F C O S
  | F C H S
  | F A B S
  | F N I N I T
  | F I N I T
  | F L D C W
  | F N S T C W
  | F S T C W
  | F N S T S W
  | F S T S W
  | F N C L E X
  | F C L E X
  | F N S T E N V
  | F S T E N V
  | F L D E N V
  | F N S A V E
  | F S A V E
  | F R S T O R
  | F N E N I
  | F E N I
  | F N D I S I
  | F D I S I
  | F N S E T P M
  | F S E T P M
  | F R S T P M
  | F F R E E
  | F F R E E P
  | F N O P
  | F W A I T
  | A W O R D
  | A D W O R D
  | W O R D
  | D W O R D
  | H T
  | H N T
  | B S W A P
  | I N V D
  | W B I N V D
  | I N V L P G
  | C P U I D
  | W R M S R
  | R D T S C
  | R D M S R
  | F X S A V E
  | F X S A V E '6' '4'
  | F X R S T O R
  | F X R S T O R '6' '4'
  | R D P M C
  | U D '2'
  | U D '2' A
  | U D '1'
  | U D '2' B
  | U D '0'
  | F C O M I
  | F U C O M I
  | F C O M I P
  | F C O M P I
  | F U C O M I P
  | F U C O M P I
  | C L F L U S H
  | L F E N C E
  | M F E N C E
  | P A U S E
  | E M M S
  | P A C K S S D W
  | P A C K S S W B
  | P A C K U S W B
  | P S L L W
  | P S L L D
  | P S L L Q
  | P S R A W
  | P S R A D
  | P S R L W
  | P S R L D
  | P S R L Q
  | P U N P C K H B W
  | P U N P C K H W D
  | P U N P C K H D Q
  | P U N P C K L B W
  | P U N P C K L W D
  | P U N P C K L D Q
  | C O M I S S
  | C V T P I '2' P S
  | C V T P S '2' P I
  | C V T S I '2' S S
  | C V T S S '2' S I
  | C V T T P S '2' P I
  | C V T T S S '2' S I
  | L D M X C S R
  | P A V G B
  | P A V G W
  | P E X T R W
  | P I N S R W
  | P M U L H U W
  | P R E F E T C H N T A
  | P R E F E T C H T '0'
  | P R E F E T C H T '1'
  | P R E F E T C H T '2'
  | P S A D B W
  | P S H U F W
  | R C P P S
  | R C P S S
  | R S Q R T P S
  | R S Q R T S S
  | S F E N C E
  | S H U F P S
  | S Q R T P S
  | S Q R T S S
  | S T M X C S R
  | S U B P S
  | S U B S S
  | U C O M I S S
  | U N P C K H P S
  | U N P C K L P S
  | C O M I S D
  | C V T P I '2' P D
  | C V T S I '2' S D
  | S H U F P D
  | U C O M I S D
  | U N P C K H P D
  | U N P C K L P D
  | C V T D Q '2' P D
  | C V T P D '2' D Q
  | C V T D Q '2' P S
  | C V T P D '2' P I
  | C V T P D '2' P S
  | C V T P S '2' P D
  | C V T P S '2' D Q
  | C V T S D '2' S I
  | C V T S D '2' S S
  | C V T S S '2' S D
  | C V T T P D '2' P I
  | C V T T S D '2' S I
  | C V T T P D '2' D Q
  | C V T T P S '2' D Q
  | P M U L U D Q
  | P S H U F D
  | P S H U F H W
  | P S H U F L W
  | P S L L D Q
  | P S R L D Q
  | P U N P C K H Q D Q
  | P U N P C K L Q D Q
  | A D D S U B P D
  | A D D S U B P S
  | H A D D P D
  | H A D D P S
  | H S U B P D
  | H S U B P S
  | L D D Q U
  | F I S T T P
  | F I S T T P L L
  | M O N I T O R
  | M W A I T
  | V M C A L L
  | V M C L E A R
  | V M L A U N C H
  | V M R E S U M E
  | V M P T R L D
  | V M P T R S T
  | V M R E A D
  | V M W R I T E
  | V M X O F F
  | V M X O N
  | V M F U N C
  | G E T S E C
  | I N V E P T
  | I N V V P I D
  | I N V P C I D
  | P H A D D W
  | P H A D D D
  | P H A D D S W
  | P H S U B W
  | P H S U B D
  | P H S U B S W
  | P M A D D U B S W
  | P M U L H R S W
  | P S H U F B
  | P S I G N B
  | P S I G N W
  | P S I G N D
  | P A L I G N R
  | P A B S B
  | P A B S W
  | P A B S D
  | B L E N D P D
  | B L E N D P S
  | B L E N D V P D
  | B L E N D V P S
  | D P P D
  | D P P S
  | E X T R A C T P S
  | I N S E R T P S
  | M P S A D B W
  | P A C K U S D W
  | P B L E N D V B
  | P B L E N D W
  | P E X T R B
  | P E X T R D
  | P E X T R Q
  | P H M I N P O S U W
  | P I N S R B
  | P I N S R D
  | P I N S R Q
  | P M A X S B
  | P M A X S D
  | P M A X U D
  | P M A X U W
  | P M I N S B
  | P M I N S D
  | P M I N U D
  | P M I N U W
  | P M U L D Q
  | P M U L L D
  | P T E S T
  | R O U N D P D
  | R O U N D P S
  | R O U N D S D
  | R O U N D S S
  | C R C '3' '2'
  | X S A V E
  | X S A V E '6' '4'
  | X R S T O R
  | X R S T O R '6' '4'
  | X G E T B V
  | X S E T B V
  | X S A V E O P T
  | X S A V E O P T '6' '4'
  | A E S D E C
  | A E S D E C L A S T
  | A E S E N C
  | A E S E N C L A S T
  | A E S I M C
  | A E S K E Y G E N A S S I S T
  | V A E S D E C
  | V A E S D E C L A S T
  | V A E S E N C
  | V A E S E N C L A S T
  | P C L M U L Q D Q
  | P C L M U L L Q L Q D Q
  | P C L M U L H Q L Q D Q
  | P C L M U L L Q H Q D Q
  | P C L M U L H Q H Q D Q
  | G F '2' P '8' A F F I N E Q B
  | G F '2' P '8' A F F I N E I N V Q B
  | G F '2' P '8' M U L B
  | V A D D P D
  | V A D D P S
  | V A D D S D
  | V A D D S S
  | V A D D S U B P D
  | V A D D S U B P S
  | V B L E N D P D
  | V B L E N D P S
  | V B L E N D V P D
  | V B L E N D V P S
  | V B R O A D C A S T F '1' '2' '8'
  | V B R O A D C A S T S D
  | V B R O A D C A S T S S
  | V C O M I S D
  | V C O M I S S
  | V C V T D Q '2' P D
  | V C V T D Q '2' P S
  | V C V T P D '2' D Q
  | V C V T P D '2' D Q X
  | V C V T P D '2' D Q Y
  | V C V T P D '2' P S
  | V C V T P D '2' P S X
  | V C V T P D '2' P S Y
  | V C V T P S '2' D Q
  | V C V T P S '2' P D
  | V C V T S D '2' S I
  | V C V T S D '2' S S
  | V C V T S I '2' S D
  | V C V T S I '2' S S
  | V C V T S S '2' S D
  | V C V T S S '2' S I
  | V C V T T P D '2' D Q
  | V C V T T P D '2' D Q X
  | V C V T T P D '2' D Q Y
  | V C V T T P S '2' D Q
  | V C V T T S D '2' S I
  | V C V T T S S '2' S I
  | V D I V P D
  | V D I V P S
  | V D I V S D
  | V D I V S S
  | V D P P D
  | V D P P S
  | V E X T R A C T F '1' '2' '8'
  | V E X T R A C T P S
  | V H A D D P D
  | V H A D D P S
  | V H S U B P D
  | V H S U B P S
  | V I N S E R T F '1' '2' '8'
  | V I N S E R T P S
  | V L D D Q U
  | V L D M X C S R
  | V M A X P D
  | V M A X P S
  | V M A X S D
  | V M A X S S
  | V M I N P D
  | V M I N P S
  | V M I N S D
  | V M I N S S
  | V M P S A D B W
  | V M U L P D
  | V M U L P S
  | V M U L S D
  | V M U L S S
  | V P A B S B
  | V P A B S D
  | V P A B S W
  | V P A C K S S D W
  | V P A C K S S W B
  | V P A C K U S D W
  | V P A C K U S W B
  | V P A D D S B
  | V P A D D S W
  | V P A D D B
  | V P A D D D
  | V P A D D Q
  | V P A D D W
  | V P A D D U S B
  | V P A D D U S W
  | V P A L I G N R
  | V P A V G B
  | V P A V G W
  | V P B L E N D V B
  | V P B L E N D W
  | V P E R M '2' F '1' '2' '8'
  | V P E R M I L P D
  | V P E R M I L P S
  | V P E X T R B
  | V P E X T R D
  | V P E X T R Q
  | V P E X T R W
  | V P H A D D D
  | V P H A D D S W
  | V P H A D D W
  | V P H M I N P O S U W
  | V P H S U B D
  | V P H S U B S W
  | V P H S U B W
  | V P I N S R B
  | V P I N S R D
  | V P I N S R Q
  | V P I N S R W
  | V P M A D D U B S W
  | V P M A D D W D
  | V P M A X S B
  | V P M A X S D
  | V P M A X S W
  | V P M A X U B
  | V P M A X U D
  | V P M A X U W
  | V P M I N S B
  | V P M I N S D
  | V P M I N S W
  | V P M I N U B
  | V P M I N U D
  | V P M I N U W
  | V P M U L D Q
  | V P M U L H R S W
  | V P M U L H U W
  | V P M U L H W
  | V P M U L L D
  | V P M U L L W
  | V P M U L U D Q
  | V P S A D B W
  | V P S H U F B
  | V P S H U F D
  | V P S H U F H W
  | V P S H U F L W
  | V P S I G N B
  | V P S I G N D
  | V P S I G N W
  | V P S L L D
  | V P S L L D Q
  | V P S L L Q
  | V P S L L W
  | V P S R A D
  | V P S R A W
  | V P S R L D
  | V P S R L D Q
  | V P S R L Q
  | V P S R L W
  | V P S U B B
  | V P S U B D
  | V P S U B Q
  | V P S U B S B
  | V P S U B S W
  | V P S U B U S B
  | V P S U B U S W
  | V P S U B W
  | V P T E S T
  | V P U N P C K H B W
  | V P U N P C K H D Q
  | V P U N P C K H Q D Q
  | V P U N P C K H W D
  | V P U N P C K L B W
  | V P U N P C K L D Q
  | V P U N P C K L Q D Q
  | V P U N P C K L W D
  | V R C P P S
  | V R C P S S
  | V R O U N D P D
  | V R O U N D P S
  | V R O U N D S D
  | V R O U N D S S
  | V R S Q R T P S
  | V R S Q R T S S
  | V S H U F P D
  | V S H U F P S
  | V S Q R T P D
  | V S Q R T P S
  | V S Q R T S D
  | V S Q R T S S
  | V S T M X C S R
  | V S U B P D
  | V S U B P S
  | V S U B S D
  | V S U B S S
  | V T E S T P D
  | V T E S T P S
  | V U C O M I S D
  | V U C O M I S S
  | V U N P C K H P D
  | V U N P C K H P S
  | V U N P C K L P D
  | V U N P C K L P S
  | V Z E R O A L L
  | V Z E R O U P P E R
  | V B R O A D C A S T I '1' '2' '8'
  | V P B L E N D D
  | V P B R O A D C A S T B
  | V P B R O A D C A S T D
  | V P B R O A D C A S T Q
  | V P B R O A D C A S T W
  | V P E R M '2' I '1' '2' '8'
  | V P E R M D
  | V P E R M P D
  | V P E R M P S
  | V P E R M Q
  | V E X T R A C T I '1' '2' '8'
  | V I N S E R T I '1' '2' '8'
  | V P S L L V D
  | V P S L L V Q
  | V P S R A V D
  | V P S R L V D
  | V P S R L V Q
  | V G A T H E R D P D
  | V G A T H E R D P S
  | V G A T H E R Q P D
  | V G A T H E R Q P S
  | V P G A T H E R D D
  | V P G A T H E R D Q
  | V P G A T H E R Q D
  | V P G A T H E R Q Q
  | V A E S I M C
  | V A E S K E Y G E N A S S I S T
  | V P C L M U L Q D Q
  | V P C L M U L L Q L Q D Q
  | V P C L M U L H Q L Q D Q
  | V P C L M U L L Q H Q D Q
  | V P C L M U L H Q H Q D Q
  | V G F '2' P '8' A F F I N E I N V Q B
  | V G F '2' P '8' A F F I N E Q B
  | V G F '2' P '8' M U L B
  | R D F S B A S E
  | R D G S B A S E
  | R D R A N D
  | W R F S B A S E
  | W R G S B A S E
  | V C V T P H '2' P S
  | V C V T P S '2' P H
  | V F M A D D '1' '3' '2' P D
  | V F M A D D '1' '3' '2' P S
  | V F M A D D '2' '1' '3' P D
  | V F M A D D '2' '1' '3' P S
  | V F M A D D '2' '3' '1' P D
  | V F M A D D '2' '3' '1' P S
  | V F M A D D '1' '3' '2' S D
  | V F M A D D '1' '3' '2' S S
  | V F M A D D '2' '1' '3' S D
  | V F M A D D '2' '1' '3' S S
  | V F M A D D '2' '3' '1' S D
  | V F M A D D '2' '3' '1' S S
  | V F M A D D S U B '1' '3' '2' P D
  | V F M A D D S U B '1' '3' '2' P S
  | V F M A D D S U B '2' '1' '3' P D
  | V F M A D D S U B '2' '1' '3' P S
  | V F M A D D S U B '2' '3' '1' P D
  | V F M A D D S U B '2' '3' '1' P S
  | V F M S U B A D D '1' '3' '2' P D
  | V F M S U B A D D '1' '3' '2' P S
  | V F M S U B A D D '2' '1' '3' P D
  | V F M S U B A D D '2' '1' '3' P S
  | V F M S U B A D D '2' '3' '1' P D
  | V F M S U B A D D '2' '3' '1' P S
  | V F M S U B '1' '3' '2' P D
  | V F M S U B '1' '3' '2' P S
  | V F M S U B '2' '1' '3' P D
  | V F M S U B '2' '1' '3' P S
  | V F M S U B '2' '3' '1' P D
  | V F M S U B '2' '3' '1' P S
  | V F M S U B '1' '3' '2' S D
  | V F M S U B '1' '3' '2' S S
  | V F M S U B '2' '1' '3' S D
  | V F M S U B '2' '1' '3' S S
  | V F M S U B '2' '3' '1' S D
  | V F M S U B '2' '3' '1' S S
  | V F N M A D D '1' '3' '2' P D
  | V F N M A D D '1' '3' '2' P S
  | V F N M A D D '2' '1' '3' P D
  | V F N M A D D '2' '1' '3' P S
  | V F N M A D D '2' '3' '1' P D
  | V F N M A D D '2' '3' '1' P S
  | V F N M A D D '1' '3' '2' S D
  | V F N M A D D '1' '3' '2' S S
  | V F N M A D D '2' '1' '3' S D
  | V F N M A D D '2' '1' '3' S S
  | V F N M A D D '2' '3' '1' S D
  | V F N M A D D '2' '3' '1' S S
  | V F N M S U B '1' '3' '2' P D
  | V F N M S U B '1' '3' '2' P S
  | V F N M S U B '2' '1' '3' P D
  | V F N M S U B '2' '1' '3' P S
  | V F N M S U B '2' '3' '1' P D
  | V F N M S U B '2' '3' '1' P S
  | V F N M S U B '1' '3' '2' S D
  | V F N M S U B '1' '3' '2' S S
  | V F N M S U B '2' '1' '3' S D
  | V F N M S U B '2' '1' '3' S S
  | V F N M S U B '2' '3' '1' S D
  | V F N M S U B '2' '3' '1' S S
  | X A B O R T
  | X B E G I N
  | X E N D
  | X T E S T
  | B Z H I
  | P D E P
  | P E X T
  | V F R C Z P D
  | V F R C Z P S
  | V F R C Z S D
  | V F R C Z S S
  | V P C O M B
  | V P C O M W
  | V P C O M D
  | V P C O M Q
  | V P C O M U B
  | V P C O M U W
  | V P C O M U D
  | V P C O M U Q
  | V P C O M L T B
  | V P C O M L T W
  | V P C O M L T D
  | V P C O M L T Q
  | V P C O M L T U B
  | V P C O M L T U W
  | V P C O M L T U D
  | V P C O M L T U Q
  | V P C O M L E B
  | V P C O M L E W
  | V P C O M L E D
  | V P C O M L E Q
  | V P C O M L E U B
  | V P C O M L E U W
  | V P C O M L E U D
  | V P C O M L E U Q
  | V P C O M G T B
  | V P C O M G T W
  | V P C O M G T D
  | V P C O M G T Q
  | V P C O M G T U B
  | V P C O M G T U W
  | V P C O M G T U D
  | V P C O M G T U Q
  | V P C O M G E B
  | V P C O M G E W
  | V P C O M G E D
  | V P C O M G E Q
  | V P C O M G E U B
  | V P C O M G E U W
  | V P C O M G E U D
  | V P C O M G E U Q
  | V P C O M E Q B
  | V P C O M E Q W
  | V P C O M E Q D
  | V P C O M E Q Q
  | V P C O M E Q U B
  | V P C O M E Q U W
  | V P C O M E Q U D
  | V P C O M E Q U Q
  | V P C O M N E Q B
  | V P C O M N E Q W
  | V P C O M N E Q D
  | V P C O M N E Q Q
  | V P C O M N E Q U B
  | V P C O M N E Q U W
  | V P C O M N E Q U D
  | V P C O M N E Q U Q
  | V P C O M F A L S E B
  | V P C O M F A L S E W
  | V P C O M F A L S E D
  | V P C O M F A L S E Q
  | V P C O M F A L S E U B
  | V P C O M F A L S E U W
  | V P C O M F A L S E U D
  | V P C O M F A L S E U Q
  | V P C O M T R U E B
  | V P C O M T R U E W
  | V P C O M T R U E D
  | V P C O M T R U E Q
  | V P C O M T R U E U B
  | V P C O M T R U E U W
  | V P C O M T R U E U D
  | V P C O M T R U E U Q
  | V P E R M I L '2' P D
  | V P E R M I L '2' P S
  | V P H A D D B D
  | V P H A D D B Q
  | V P H A D D B W
  | V P H A D D D Q
  | V P H A D D U B D
  | V P H A D D U B Q
  | V P H A D D U B W
  | V P H A D D U D Q
  | V P H A D D U W D
  | V P H A D D U W Q
  | V P H A D D W D
  | V P H A D D W Q
  | V P H S U B B W
  | V P H S U B D Q
  | V P H S U B W D
  | V P M A C S D D
  | V P M A C S D Q H
  | V P M A C S D Q L
  | V P M A C S S D D
  | V P M A C S S D Q H
  | V P M A C S S D Q L
  | V P M A C S S W D
  | V P M A C S S W W
  | V P M A C S W D
  | V P M A C S W W
  | V P M A D C S S W D
  | V P M A D C S W D
  | V P P E R M
  | V P R O T B
  | V P R O T W
  | V P R O T D
  | V P R O T Q
  | V P S H A B
  | V P S H A W
  | V P S H A D
  | V P S H A Q
  | V P S H L B
  | V P S H L W
  | V P S H L D
  | V P S H L Q
  | L L W P C B
  | S L W P C B
  | L W P V A L
  | L W P I N S
  | B E X T R
  | B L S I
  | B L S M S K
  | B L S R
  | T Z C N T
  | B L C F I L L
  | B L C I
  | B L C I C
  | B L C M S K
  | B L C S
  | B L S F I L L
  | B L S I C
  | T '1' M S K C
  | T Z M S K
  | P R E F E T C H
  | P R E F E T C H W
  | F E M M S
  | P A V G U S B
  | P F '2' I D
  | P F '2' I W
  | P F A C C
  | P F A D D
  | P F C M P E Q
  | P F C M P G E
  | P F C M P G T
  | P F M A X
  | P F M I N
  | P F M U L
  | P F N A C C
  | P F P N A C C
  | P F R C P
  | P F R C P I T '1'
  | P F R C P I T '2'
  | P F R S Q I T '1'
  | P F R S Q R T
  | P F S U B
  | P F S U B R
  | P I '2' F D
  | P I '2' F W
  | P M U L H R W
  | P S W A P D
  | S W A P G S
  | R D T S C P
  | C L G I
  | I N V L P G A
  | S K I N I T
  | S T G I
  | V M G E X I T
  | V M L O A D
  | V M M C A L L
  | V M R U N
  | V M S A V E
  | E X T R Q
  | I N S E R T Q
  | L Z C N T
  | P O P C N T
  | X S T O R E '-' R N G
  | X C R Y P T '-' E C B
  | X C R Y P T '-' C B C
  | X C R Y P T '-' C T R
  | X C R Y P T '-' C F B
  | X C R Y P T '-' O F B
  | M O N T M U L
  | X S H A '1'
  | X S H A '2' '5' '6'
  | X S T O R E R N G
  | X C R Y P T E C B
  | X C R Y P T C B C
  | X C R Y P T C T R
  | X C R Y P T C F B
  | X C R Y P T O F B
  | X S T O R E
  | A D C X
  | A D O X
  | R D S E E D
  | C L A C
  | S T A C
  | B N D M K
  | B N D C L
  | B N D C U
  | B N D C N
  | B N D S T X
  | B N D L D X
  | S H A '1' R N D S '4'
  | S H A '1' N E X T E
  | S H A '1' M S G '1'
  | S H A '1' M S G '2'
  | S H A '2' '5' '6' R N D S '2'
  | S H A '2' '5' '6' M S G '1'
  | S H A '2' '5' '6' M S G '2'
  | K S H I F T L W
  | K S H I F T R W
  | K U N P C K B W
  | V A L I G N D
  | V P T E R N L O G D
  | V A L I G N Q
  | V P T E R N L O G Q
  | V B L E N D M P D
  | V P B L E N D M Q
  | V P E R M I '2' P D
  | V P E R M I '2' Q
  | V P E R M T '2' P D
  | V P E R M T '2' Q
  | V P M A X S Q
  | V P M A X U Q
  | V P M I N S Q
  | V P M I N U Q
  | V P R O L V Q
  | V P R O R V Q
  | V P S R A V Q
  | V B L E N D M P S
  | V P B L E N D M D
  | V P E R M I '2' D
  | V P E R M I '2' P S
  | V P E R M T '2' D
  | V P E R M T '2' P S
  | V P R O L V D
  | V P R O R V D
  | V B R O A D C A S T F '3' '2' X '4'
  | V B R O A D C A S T I '3' '2' X '4'
  | V B R O A D C A S T F '6' '4' X '4'
  | V B R O A D C A S T I '6' '4' X '4'
  | V C O M P R E S S P D
  | V C O M P R E S S P S
  | V P C O M P R E S S Q
  | V P C O M P R E S S D
  | V P S C A T T E R D Q
  | V P S C A T T E R Q Q
  | V S C A T T E R D P D
  | V S C A T T E R Q P D
  | V P S C A T T E R D D
  | V S C A T T E R D P S
  | V C V T U D Q '2' P D
  | V C V T P S '2' U D Q
  | V C V T P D '2' U D Q
  | V C V T S D '2' U S I
  | V C V T U S I '2' S D
  | V C V T U S I '2' S S
  | V C V T S S '2' U S I
  | V C V T T P D '2' U D Q
  | V C V T T P S '2' U D Q
  | V C V T T S D '2' U S I
  | V C V T T S S '2' U S I
  | V C V T U D Q '2' P S
  | V E X P A N D P D
  | V P E X P A N D Q
  | V E X P A N D P S
  | V P E X P A N D D
  | V E X T R A C T F '3' '2' X '4'
  | V E X T R A C T I '3' '2' X '4'
  | V E X T R A C T F '6' '4' X '4'
  | V E X T R A C T I '6' '4' X '4'
  | V F I X U P I M M P D
  | V F I X U P I M M P S
  | V F I X U P I M M S D
  | V G E T M A N T S D
  | V R N D S C A L E S D
  | V F I X U P I M M S S
  | V G E T M A N T S S
  | V R N D S C A L E S S
  | V S C A L E F P D
  | V S C A L E F P S
  | V S C A L E F S D
  | V S C A L E F S S
  | V G E T E X P P D
  | V G E T E X P P S
  | V G E T E X P S D
  | V G E T E X P S S
  | V G E T M A N T P D
  | V R N D S C A L E P D
  | V G E T M A N T P S
  | V R N D S C A L E P S
  | V I N S E R T F '3' '2' X '4'
  | V I N S E R T I '3' '2' X '4'
  | V I N S E R T F '6' '4' X '4'
  | V I N S E R T I '6' '4' X '4'
  | V R C P '1' '4' P S
  | V R S Q R T '1' '4' P S
  | V P A B S Q
  | V R C P '1' '4' P D
  | V R S Q R T '1' '4' P D
  | V P S C A T T E R Q D
  | V S C A T T E R Q P S
  | V P S R A Q
  | V R C P '1' '4' S D
  | V R S Q R T '1' '4' S D
  | V R C P '1' '4' S S
  | V R S Q R T '1' '4' S S
  | V S H U F F '3' '2' X '4'
  | V S H U F I '3' '2' X '4'
  | V S H U F F '6' '4' X '2'
  | V S H U F I '6' '4' X '2'
  | V P B R O A D C A S T M B '2' Q
  | V P B R O A D C A S T M W '2' D
  | V P C O N F L I C T D
  | V P C O N F L I C T Q
  | V P L Z C N T D
  | V P L Z C N T Q
  | V E X P '2' P D
  | V E X P '2' P S
  | V R C P '2' '8' P D
  | V R S Q R T '2' '8' P D
  | V R C P '2' '8' P S
  | V R S Q R T '2' '8' P S
  | V R C P '2' '8' S D
  | V R S Q R T '2' '8' S D
  | V R C P '2' '8' S S
  | V R S Q R T '2' '8' S S
  | V G A T H E R P F '0' D P D
  | V G A T H E R P F '0' Q P D
  | V G A T H E R P F '1' D P D
  | V G A T H E R P F '1' Q P D
  | V S C A T T E R P F '0' D P D
  | V S C A T T E R P F '0' Q P D
  | V S C A T T E R P F '1' D P D
  | V S C A T T E R P F '1' Q P D
  | V G A T H E R P F '0' D P S
  | V G A T H E R P F '0' Q P S
  | V G A T H E R P F '1' D P S
  | V G A T H E R P F '1' Q P S
  | V S C A T T E R P F '0' D P S
  | V S C A T T E R P F '0' Q P S
  | V S C A T T E R P F '1' D P S
  | V S C A T T E R P F '1' Q P S
  | P R E F E T C H W T '1'
  | C L F L U S H O P T
  | X R S T O R S
  | X R S T O R S '6' '4'
  | X S A V E S
  | X S A V E S '6' '4'
  | X S A V E C
  | X S A V E C '6' '4'
  | E N C L S
  | E N C L U
  | E N C L V
  | V C V T P D '2' U D Q X
  | V C V T P D '2' U D Q Y
  | V C V T T P D '2' U D Q X
  | V C V T T P D '2' U D Q Y
  | K A D D D
  | K N O T D
  | K O R D
  | K O R T E S T D
  | K T E S T D
  | K X N O R D
  | K X O R D
  | K A D D Q
  | K N O T Q
  | K O R Q
  | K O R T E S T Q
  | K T E S T Q
  | K U N P C K D Q
  | K U N P C K W D
  | K X N O R Q
  | K X O R Q
  | K S H I F T L D
  | K S H I F T L Q
  | K S H I F T R D
  | K S H I F T R Q
  | V D B P S A D B W
  | V P B L E N D M B
  | V P B L E N D M W
  | V P E R M I '2' W
  | V P E R M T '2' W
  | V P E R M W
  | V P S L L V W
  | V P S R A V W
  | V P S R L V W
  | V P T E S T M B
  | V P T E S T M W
  | V P T E S T N M B
  | V P T E S T N M W
  | K A D D B
  | K A N D B
  | K A N D N B
  | K A N D N W
  | K A N D W
  | K A N D D
  | K A N D N D
  | K A N D N Q
  | K A N D Q
  | K N O T B
  | K O R B
  | K O R T E S T B
  | K T E S T B
  | K X N O R B
  | K X O R B
  | K A D D W
  | K T E S T W
  | K S H I F T L B
  | K S H I F T R B
  | V B R O A D C A S T F '3' '2' X '2'
  | V B R O A D C A S T F '3' '2' X '8'
  | V B R O A D C A S T I '3' '2' X '2'
  | V B R O A D C A S T I '3' '2' X '8'
  | V B R O A D C A S T F '6' '4' X '2'
  | V B R O A D C A S T I '6' '4' X '2'
  | V C V T P D '2' Q Q
  | V C V T P D '2' U Q Q
  | V C V T P S '2' Q Q
  | V C V T P S '2' U Q Q
  | V C V T Q Q '2' P D
  | V C V T U Q Q '2' P D
  | V C V T Q Q '2' P S
  | V C V T Q Q '2' P S X
  | V C V T Q Q '2' P S Y
  | V C V T T P D '2' Q Q
  | V C V T T P D '2' U Q Q
  | V C V T T P S '2' Q Q
  | V C V T T P S '2' U Q Q
  | V C V T U Q Q '2' P S
  | V C V T U Q Q '2' P S X
  | V C V T U Q Q '2' P S Y
  | V E X T R A C T F '3' '2' X '8'
  | V E X T R A C T I '3' '2' X '8'
  | V I N S E R T F '3' '2' X '8'
  | V I N S E R T I '3' '2' X '8'
  | V F P C L A S S S S
  | V F P C L A S S S D
  | V E X T R A C T F '6' '4' X '2'
  | V E X T R A C T I '6' '4' X '2'
  | V I N S E R T F '6' '4' X '2'
  | V I N S E R T I '6' '4' X '2'
  | V F P C L A S S P D
  | V F P C L A S S P D Z
  | V F P C L A S S P D X
  | V F P C L A S S P D Y
  | V F P C L A S S P S
  | V F P C L A S S P S Z
  | V F P C L A S S P S X
  | V F P C L A S S P S Y
  | V P M U L L Q
  | V R A N G E P D
  | V R E D U C E P D
  | V R A N G E P S
  | V R E D U C E P S
  | V R A N G E S D
  | V R E D U C E S D
  | V R A N G E S S
  | V R E D U C E S S
  | C L W B
  | V P M A D D '5' '2' H U Q
  | V P M A D D '5' '2' L U Q
  | V P M U L T I S H I F T Q B
  | V P E R M B
  | V P E R M I '2' B
  | V P E R M T '2' B
  | V '4' F M A D D P S
  | V '4' F N M A D D P S
  | V '4' F M A D D S S
  | V '4' F N M A D D S S
  | V P '4' D P W S S D
  | V P '4' D P W S S D S
  | V P O P C N T D
  | V P O P C N T Q
  | V P C O M P R E S S B
  | V P C O M P R E S S W
  | V P E X P A N D B
  | V P E X P A N D W
  | V P S H L D V D
  | V P S H R D V D
  | V P S H L D V Q
  | V P S H R D V Q
  | V P S H L D V W
  | V P S H R D V W
  | V P S H L D D
  | V P S H R D D
  | V P S H L D Q
  | V P S H R D Q
  | V P S H L D W
  | V P S H R D W
  | V P D P B U S D
  | V P D P W S S D
  | V P D P B U S D S
  | V P D P W S S D S
  | V P O P C N T B
  | V P O P C N T W
  | V P S H U F B I T Q M B
  | I N V L P G B
  | T L B S Y N C
  | C L Z E R O
  | M O N I T O R X
  | M W A I T X
  | R D P K R U
  | W R P K R U
  | R D P I D
  | P T W R I T E
  | I N C S S P D
  | I N C S S P Q
  | R D S S P D
  | R D S S P Q
  | S A V E P R E V S S P
  | R S T O R S S P
  | W R S S D
  | W R S S Q
  | W R U S S D
  | W R U S S Q
  | S E T S S B S Y
  | C L R S S B S Y
  | E N D B R '6' '4'
  | E N D B R '3' '2'
  | W B N O I N V D
  | P C O N F I G
  | U M O N I T O R
  | T P A U S E
  | U M W A I T
  | C L D E M O T E
  | V C V T N E '2' P S '2' B F '1' '6'
  | V C V T N E P S '2' B F '1' '6'
  | V C V T N E P S '2' B F '1' '6' X
  | V C V T N E P S '2' B F '1' '6' Y
  | V D P B F '1' '6' P S
  | E N Q C M D
  | E N Q C M D S
  | V P '2' I N T E R S E C T D
  | V P '2' I N T E R S E C T Q
  | M C O M M I T
  | P S M A S H
  | P V A L I D A T E
  | R M P U P D A T E
  | R M P A D J U S T
  | R D P R U
  | S E R I A L I Z E
  | X S U S L D T R K
  | X R E S L D T R K
  | L D T I L E C F G
  | S T T I L E C F G
  | T D P B F '1' '6' P S
  | T D P B S S D
  | T D P B U U D
  | T D P B U S D
  | T D P B S U D
  | T I L E L O A D D
  | T I L E L O A D D T '1'
  | T I L E S T O R E D
  | T I L E R E L E A S E
  | T I L E Z E R O
  | L O A D I W K E Y
  | E N C O D E K E Y '1' '2' '8'
  | E N C O D E K E Y '2' '5' '6'
  | A E S E N C '1' '2' '8' K L
  | A E S D E C '1' '2' '8' K L
  | A E S E N C '2' '5' '6' K L
  | A E S D E C '2' '5' '6' K L
  | A E S E N C W I D E '1' '2' '8' K L
  | A E S D E C W I D E '1' '2' '8' K L
  | A E S E N C W I D E '2' '5' '6' K L
  | A E S D E C W I D E '2' '5' '6' K L
  | T D C A L L
  | S E A M R E T
  | S E A M O P S
  | S E A M C A L L
  | C L U I
  | S T U I
  | T E S T U I
  | S E N D U I P I
  | H R E S E T
  ) (B | W | L | Q | X | Y | Z | S | T)? ('.' S)? ('.' D DIGIT+)? ;
