lexer grammar AssemblerDirectives ;

import Fragments ;

ASSEMBLER_DIRECTIVE : '.'
                    ( A B O R T
                    | A L I G N
                    | A L T M A C R O
                    | A S C I I
                    | A S C I Z
                    | A T T A C H '_' T O '_' G R O U P
                    | B A L I G N
                    | B S S
                    | B U N D L E '_' A L I G N '_' M O D E
                    | B Y T E
                    | C F I '_' S T A R T P R O C
                    | C O M M
                    | D A T A
                    | D C
                    | D C B
                    | D S
                    | D E F
                    | D E S C
                    | D I M
                    | D O U B L E
                    | E J E C T
                    | E L S E
                    | E L S E I F
                    | E N D
                    | E N D E F
                    | E N D F U N C 
                    | E N D I F 
                    | E Q U 
                    | E Q U I V 
                    | E Q V 
                    | E R R 
                    | E R R O R 
                    | E X I T M 
                    | E X T E R N 
                    | F A I L 
                    | F I L E 
                    | F I L L 
                    | F L O A T 
                    | F U N C 
                    | G L O B A L
                    | G L O B L
                    | G N U '_' A T T R I B U T E 
                    | H I D D E N 
                    | H W O R D 
                    | I D E N T 
                    | I F 
                    | I N C B I N 
                    | I N C L U D E 
                    | I N T 
                    | I N T E R N A L 
                    | I R P 
                    | I R P C 
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
                    | M A C R O 
                    | M R I 
                    | N O A L T M A C R O 
                    | N O L I S T 
                    | N O P 
                    | N O P S 
                    | O C T A 
                    | O F F S E T 
                    | O R G 
                    | P '2' A L I G N 
                    | P O P S E C T I O N 
                    | P R E V I O U S 
                    | P R I N T 
                    | P R O T E C T E D 
                    | P S I Z E 
                    | P U R G E M 
                    | P U S H S E C T I O N 
                    | Q U A D 
                    | R E L O C 
                    | R E P T 
                    | S B T T L 
                    | S C L 
                    | S E C T I O N 
                    | S E T 
                    | S H O R T 
                    | S I N G L E 
                    | S I Z E 
                    | S K I P 
                    | S L E B '1' '2' '8' 
                    | S P A C E 
                    | S T A B D 
                    | S T R I N G 
                    | S T R U C T 
                    | S U B S E C T I O N 
                    | S Y M V E R 
                    | T A G 
                    | T E X T 
                    | T I T L E 
                    | T L S '_' C O M M O N 
                    | T Y P E
                    | U L E B '1' '2' '8'
                    | V A L
                    | V E R S I O N
                    | V T A B L E '_' E N T R Y
                    | V T A B L E '_' I N H E R I T
                    | W A R N I N G
                    | W E A K
                    | W E A K R E F
                    | W O R D
                    | Z E R O
                    | [248] B Y T E
                    ) ;
