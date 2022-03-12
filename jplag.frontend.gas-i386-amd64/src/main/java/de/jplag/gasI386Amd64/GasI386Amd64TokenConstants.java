package de.jplag.gasI386Amd64;

import de.jplag.TokenConstants;

public interface GasI386Amd64TokenConstants extends TokenConstants {
	final static int FILE_END = 0;
	final static int SEPARATOR_TOKEN = 1;
	
	final static int PROGRAM = 2;
	final static int LABEL = 3;
	final static int ASSIGNMENT = 4;
	final static int MOV_MNE = 5;
	final static int STACK_MNE = 6;
	final static int XCHG_MNE = 7;
	final static int ARITHMETIC_MNE = 8;
	final static int LOGIC_MNE = 9;
	final static int SYSCALL_MNE = 10;
	final static int JMP_MNE = 11;
	final static int CMP_MNE = 12;
	final static int CALL_MNE = 13;
	final static int RET_MNE = 14;
	final static int BIT_MNE = 15;
	final static int GENERIC_MNE = 16;
	final static int SECTION_DIR = 17;
	final static int CONDITION_DIR = 18;
	final static int MACRO_DIR = 19;
	final static int BUNDLE_DIR = 20;
	final static int CFI_DIR = 21;
	final static int SEQUENCE_DIR = 22;
	final static int GENERIC_DIR = 23;
	final static int MACRO_INVOCATION = 24;
	
	final static int NUM_DIFF_TOKENS = 25;
}
