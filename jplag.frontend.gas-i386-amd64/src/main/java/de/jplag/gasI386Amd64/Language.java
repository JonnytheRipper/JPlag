package de.jplag.gasI386Amd64;

import java.io.File;

import de.jplag.Program;
import de.jplag.TokenList;

public class Language implements de.jplag.Language {
	private Parser parser;
	
	public Language(Program program) {
		this.parser = new Parser();
		this.parser.setProgram(program);
	}

	@Override
	public String[] suffixes() {
		String[] res = {".asm", ".ASM", ".s", ".S"};
		return res;
	}

	@Override
	public String getName() {
		return "GNU Assembler i386 AMD64 AbstractParser";
	}

	@Override
	public String getShortName() {
		return "gasI386Amd64";
	}

	@Override
	public int minimumTokenMatch() {
		//TODO: Change to the correct number.
		return 7; // Dummy value.
	}

	@Override
	public TokenList parse(File dir, String[] files) {
		return this.parser.parse(dir, files);
	}

	@Override
	public boolean hasErrors() {
		return parser.hasErrors();
	}

	@Override
	public int errorCount() {
		return parser.errorsCount();
	}

	@Override
	public boolean supportsColumns() {
		return true;
	}

	@Override
	public boolean isPreformatted() {
		return true;
	}

	@Override
	public boolean usesIndex() {
		return false;
	}

	@Override
	public int numberOfTokens() {
		return GasI386Amd64TokenConstants.NUM_DIFF_TOKENS;
	}

	@Override
	public String type2string(int type) {
		return GasI386Amd64Token.type2String(type);
	}
	
}
