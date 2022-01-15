package de.jplag.gasI386Amd64;

import de.jplag.TokenConstants;

public interface GasI386Amd64TokenConstants extends TokenConstants {
	final static int FILE_END = 0;
	final static int SEPARATOR_TOKEN = 1;
	
	final static int PROGRAM = 2;
	final static int STATEMENT_TERMINATOR = 3;
	final static int STATEMENT = 4;
	final static int LABEL = 5;
	final static int SYMBOL = 6;
	final static int ASSEMBLER_DIRECTIVE = 7;
	final static int INSTRUCTION = 8;
	final static int OPERAND = 9;
	final static int MEM_REFERENCE = 10;
	final static int IMMEDIATE = 11;
	final static int INTEGER = 12;
	final static int NUMBER = 13;
	final static int ARGUMENT = 14;
	final static int EXPR = 15;
	final static int INT_EXPR = 16;
	final static int ASSIGNMENT = 17;
	final static int CURRENT_ADDRESS = 18;
	
	final static int NUM_DIFF_TOKENS = 19;
}
