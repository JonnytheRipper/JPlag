package de.jplag.gasI386Amd64;

import de.jplag.Token;

public class GasI386Amd64Token extends Token implements GasI386Amd64TokenConstants {
    private int column;
    private int length;
    private int line;

    public GasI386Amd64Token(int type, String file, int line, int column, int length) {
        super(type, file, line, column, length);
    }

    @Override
    public int getLine() {
        return line;
    }

    @Override
    public int getColumn() {
        return column;
    }

    @Override
    public int getLength() {
        return length;
    }

    @Override
    public void setLine(int line) {
        this.line = line;
    }

    @Override
    public void setColumn(int column) {
        this.column = column;
    }

    @Override
    public void setLength(int length) {
        this.length = length;
    }

    @Override
    protected String type2string() {
        switch (type) {
            case GasI386Amd64TokenConstants.FILE_END:
                return "***EOF***";
            default:
                System.err.println("*UNKNOWN: " + type);
                return "UNKNOWN: \"" + type + "\"";
        }
    }
}
