package de.jplag.gasI386Amd64;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import de.jplag.AbstractParser;
import de.jplag.TokenList;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Lexer;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ProgramContext;

public class Parser extends AbstractParser implements GasI386Amd64TokenConstants {
    private TokenList tokenList;
    private String currentFile;

    public TokenList parse(File dir, String files[]) {
        errors = 0;
        tokenList = new TokenList();

        for (int i = 0; i < files.length; i++) {
            getErrorConsumer().print(null, "Parsing file " + files[i] + "\n");
            if (!parseFile(dir, files[i]))
                errors++;
            tokenList.addToken(new GasI386Amd64Token(FILE_END, files[i], -1, -1, -1));
        }
        this.parseEnd();
        return tokenList;
    }

    private boolean parseFile(File dir, String file) {
        BufferedInputStream fileInputStream;
        CharStream input;

        try {
            fileInputStream = new BufferedInputStream(new FileInputStream(new File(dir, file)));
            currentFile = file;
            input = CharStreams.fromStream(fileInputStream);

            // create a lexer that feeds off of input CharStream
            GasI386Amd64Lexer lexer = new GasI386Amd64Lexer(input);

            // create a buffer of tokens pulled from the lexer
            CommonTokenStream tokens = new CommonTokenStream(lexer);

            // create a parser that feeds off the tokens buffer
            GasI386Amd64Parser parser = new GasI386Amd64Parser(tokens);

            ProgramContext ctx = parser.program();

            ParseTreeWalker treeWalker = new ParseTreeWalker();
            for (int i = 0; i < ctx.getChildCount(); i++) {
                ParseTree parseTree = ctx.getChild(i);
                treeWalker.walk(new JPlagGasI386Amd64Listener(this), parseTree);
            }

            fileInputStream.close();

        } catch (IOException e) {
            getErrorConsumer().addError("Parsing Error in '" + file + "':\n" + e.getMessage() + "\n");
            return false;
        }
        return true;
    }

    public void add(int type, Token tok) {
        tokenList.addToken(new GasI386Amd64Token(type, (currentFile == null ? "null" : currentFile), tok.getLine(), tok.getCharPositionInLine() + 1,
                tok.getText().length()));
    }
}
