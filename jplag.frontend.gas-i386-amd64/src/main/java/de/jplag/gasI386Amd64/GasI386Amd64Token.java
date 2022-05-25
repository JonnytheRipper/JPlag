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
            case GasI386Amd64TokenConstants.MACRO_INVOCATION:
                return "MACRO_INVOCATION";
            case GasI386Amd64TokenConstants.LABEL:
                return "LABEL";
            case GasI386Amd64TokenConstants.ASSIGNMENT:
                return "ASSIGNMENT";
            case GasI386Amd64TokenConstants.MOV_MNE:
                return "MOV_MNE";
            case GasI386Amd64TokenConstants.STACK_MNE:
                return "STACK_MNE";
            case GasI386Amd64TokenConstants.XCHG_MNE:
                return "XCHG_MNE";
            case GasI386Amd64TokenConstants.ARITHMETIC_MNE:
                return "ARITHMETIC_MNE";
            case GasI386Amd64TokenConstants.LOGIC_MNE:
                return "LOGIC_MNE";
            case GasI386Amd64TokenConstants.SYSCALL_MNE:
                return "SYSCALL_MNE";
            case GasI386Amd64TokenConstants.JMP_MNE:
                return "JMP_MNE";
            case GasI386Amd64TokenConstants.CMP_MNE:
                return "CMP_MNE";
            case GasI386Amd64TokenConstants.CALL_MNE:
                return "CALL_MNE";
            case GasI386Amd64TokenConstants.RET_MNE:
                return "RET_MNE";
            case GasI386Amd64TokenConstants.BIT_MNE:
                return "BIT_MNE";
            case GasI386Amd64TokenConstants.GENERIC_MNE:
                return "GENERIC_MNE";
            case GasI386Amd64TokenConstants.SECTION_DIR:
                return "SECTION_DIR";
            case GasI386Amd64TokenConstants.CONDITION_DIR_BEGIN:
                return "CONDITION_DIR_BEGIN";
            case GasI386Amd64TokenConstants.CONDITION_DIR_END:
                return "CONDITION_DIR_END";
            case GasI386Amd64TokenConstants.MACRO_DIR:
                return "MACRO_DIR";
            case GasI386Amd64TokenConstants.BUNDLE_DIR:
                return "BUNDLE_DIR";
            case GasI386Amd64TokenConstants.CFI_DIR:
                return "CFI_DIR";
            case GasI386Amd64TokenConstants.SEQUENCE_DIR_BEGIN:
                return "SEQUENCE_DIR_BEGIN";
            case GasI386Amd64TokenConstants.SEQUENCE_DIR_END:
                return "SEQUENCE_DIR_END";
            case GasI386Amd64TokenConstants.GENERIC_DIR:
                return "GENERIC_DIR";
            case GasI386Amd64TokenConstants.MEM_REFERENCE_OPERAND:
                return "MEM_REFERENCE_OPERAND";
            case GasI386Amd64TokenConstants.REGISTER_OPERAND:
                return "REGISTER_OPERAND";
            case GasI386Amd64TokenConstants.IMMEDIATE_OPERAND:
                return "IMMEDIATE_OPERAND";
            case GasI386Amd64TokenConstants.EVEX_OPERAND:
                return "EVEX_OPERAND";
            default:
                System.err.println("*UNKNOWN: " + type);
                return "UNKNOWN: \"" + type + "\"";
        }
    }
}
