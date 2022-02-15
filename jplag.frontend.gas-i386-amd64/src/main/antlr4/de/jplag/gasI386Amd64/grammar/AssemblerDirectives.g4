lexer grammar AssemblerDirectives ;

import Fragments ;

SECTION_DIRECTIVE :
  '.'
  ( S E C T I O N
  |	B S S
  | L B S S
  | D A T A
  | T E X T
  | P U S H S E C T I O N
  | P O P S E C T I O N
  | S U B S E C T I O N
  ) ~[\n;]*? ;

CONDITION_DIRECTIVE :
  '.'
  ( I F
  | E L S E
  | E L S E I F
  | E N D I F
  | I F D E F 
  | I F B 
  | I F C 
  | I F E Q 
  | I F E Q S 
  | I F G E 
  | I F G T 
  | I F L E 
  | I F L T 
  | I F N B   
  | I F N C 
  | I F N D E F 
  | I F N O T D E F 
  | I F N E 
  | I F N E S
  ) ~[\n;]*? ;

MACRO_DIRECTIVE :
  '.'
  ( M A C R O .*? (E X I T M | E N D M)
  //|	E N D M
  //| E X I T M
  | A L T M A C R O
  | N O A L T M A C R O
  | P U R G E M
  ) ~[\n;]*? ;

BUNDLE_DIRECTIVE :
  '.'
  ( B U N D L E '_' A L I G N '_' M O D E
  | B U N D L E '_' L O C K
  | B U N D L E '_' U N L O C K
  ) ~[\n;]*? ;

CFI_DIRECTIVE :
  '.'
  ( C F I '_' S E C T I O N S
  | C F I '_' S T A R T P R O C
  | C F I '_' E N D P R O C
  | C F I '_' P E R S O N A L I T Y
  | C F I '_' P E R S O N A L I T Y '_' I D
  | C F I '_' F D E '_' D A T A
  | C F I '_' L S D A
  | C F I '_' I N L I N E '_' L S D A
  | C F I '_' D E F '_' C F A
  | C F I '_' D E F '_' C F A '_' R E G I S T E R
  | C F I '_' D E F '_' C F A '_' O F F S E T
  | C F I '_' A D J U S T '_' C F A '_' O F F S E T
  | C F I '_' O F F S E T
  | C F I '_' V A L '_' O F F S E T
  | C F I '_' R E L '_' O F F S E T
  | C F I '_' R E G I S T E R
  | C F I '_' R E S T O R E
  | C F I '_' U N D E F I N E D
  | C F I '_' S A M E '_' V A L U E
  | C F I '_' R E M E M B E R '_' S T A T E
  | C F I '_' R E S T O R E '_' S T A T E
  | C F I '_' R E T U R N '_' C O L U M N
  | C F I '_' S I G N A L '_' F R A M E
  | C F I '_' W I N D O W '_' S A V E
  | C F I '_' E S C A P E
  | C F I '_' V A L '_' E N C O D E D '_' A D D R
  ) ~[\n;]*? ;

EQU_DIRECTIVE :
  '.'
  ( E Q U
  | S E T
  | E Q U I V
  | E Q V
  ) ~[\n;]*? ;

GENERIC_DIRECTIVE :
  '.'
  ( A B O R T
  | A L I G N
  | A R C H
  | A S C I I
  | A S C I Z
  | A T T '_' S Y N T A X
  | A T T A C H '_' T O '_' G R O U P
  | B A L I G N
  | C O M M
  | B Y T E
  | D C
  | D C B
  | D S
  | D E F
  | D E S C
  | D I M
  | D O U B L E
  | E J E C T
  | E N D
  | E N D E F
  | E N D F U N C
  | E R R
  | E R R O R
  | E X T E R N
  | F A I L
  | F I L E
  | F I L L
  | F L O A T
  | T F L O A T
  | F U N C
  | G L O B A L
  | G L O B L
  | G N U '_' A T T R I B U T E
  | H I D D E N
  | H W O R D
  | I D E N T
  | I N C B I N
  | I N C L U D E
  | I N T E L '_' S Y N T A X
  | I N T
  | I N T E R N A L
  | I R P
  | I R P C
  | L A R G E C O M M
  | L C O M M
  | L F L A G S
  | L I N E
  | L I N K O N C E
  | L I S T
  | L N
  | L O C
  | L O C '_' M A R K '_' L A B E L S
  | L O C A L
  | L O N G
  | M R I
  | N O L I S T
  | N O P
  | N O P S
  | O C T A
  | O F F S E T
  | O R G
  | P '2' A L I G N
  | P R E V I O U S
  | P R I N T
  | P R O T E C T E D
  | P S I Z E
  | Q U A D
  | R E L O C
  | R E P T
  | S B T T L
  | S C L
  | S H O R T
  | S I N G L E
  | S I Z E
  | S K I P
  | S L E B '1' '2' '8'
  | S P A C E
  | S T A B D
  | S T R I N G
  | S T R U C T
  | S Y M V E R
  | T A G
  | T I T L E
  | T L S '_' C O M M O N
  | T Y P E
  | U L E B '1' '2' '8'
  | V A L
  | V A L U E
  | V E R S I O N
  | V T A B L E '_' E N T R Y
  | V T A B L E '_' I N H E R I T
  | W A R N I N G
  | W E A K
  | W E A K R E F
  | W O R D
  | Z E R O
  | [248] B Y T E
  | C O D E '1' '6'
  | C O D E '1' '6' C C
  | C O D E '3' '2'
  | C O D E '6' '4'
  ) ~[\n;]*? ;
