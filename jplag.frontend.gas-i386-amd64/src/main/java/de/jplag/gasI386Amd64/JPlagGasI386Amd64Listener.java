package de.jplag.gasI386Amd64;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import de.jplag.gasI386Amd64.grammar.GasI386Amd64Listener;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ArgumentContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ArithmeticMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.AssemblerDirectiveContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.AssignmentContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.BaseContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.BitMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.BundleDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.CallMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.CfiDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.CmpMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ConditionDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.DisplacementContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.EvexOperandContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ExprContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.GenericDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.GenericMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ImmediateContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ImmediateOperandContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.IndexContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.InstructionContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.IntegerContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.JmpMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.LabelContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.LogicMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.MacroDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.MacroInvocationContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.MemReferenceContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.MemReferenceOperandContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.MovMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.NumberContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.PrefixMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ProgramContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.RegisterContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.RegisterOperandContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.RetMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ScaleContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SectionContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SectionDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SequenceDirContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.StackMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.StatementContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SubExprContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SymbolContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SyscallMneContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.XchgMneContext;

public class JPlagGasI386Amd64Listener implements GasI386Amd64Listener, GasI386Amd64TokenConstants {

    private Parser jplagParser;

    public JPlagGasI386Amd64Listener(Parser jplagParser) {
        this.jplagParser = jplagParser;
    }

    @Override
    public void visitTerminal(TerminalNode node) {
        // TODO Auto-generated method stub

    }

    @Override
    public void visitErrorNode(ErrorNode node) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterStatement(StatementContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void exitStatement(StatementContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterProgram(ProgramContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitProgram(ProgramContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSymbol(SymbolContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitSymbol(SymbolContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterLabel(LabelContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(LABEL, ctx.getStart());
    }

    @Override
    public void exitLabel(LabelContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterInstruction(InstructionContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void exitInstruction(InstructionContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterEveryRule(ParserRuleContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitEveryRule(ParserRuleContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterAssignment(AssignmentContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(ASSIGNMENT, ctx.getStart());
    }

    @Override
    public void exitAssignment(AssignmentContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterStackMne(StackMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(STACK_MNE, ctx.getStart());
    }

    @Override
    public void exitStackMne(StackMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterArithmeticMne(ArithmeticMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(ARITHMETIC_MNE, ctx.getStart());
    }

    @Override
    public void exitArithmeticMne(ArithmeticMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterGenericMne(GenericMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(GENERIC_MNE, ctx.getStart());
    }

    @Override
    public void exitGenericMne(GenericMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterXchgMne(XchgMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(XCHG_MNE, ctx.getStart());
    }

    @Override
    public void exitXchgMne(XchgMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterMovMne(MovMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(MOV_MNE, ctx.getStart());
    }

    @Override
    public void exitMovMne(MovMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSyscallMne(SyscallMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(SYSCALL_MNE, ctx.getStart());
    }

    @Override
    public void exitSyscallMne(SyscallMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterCmpMne(CmpMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(CMP_MNE, ctx.getStart());
    }

    @Override
    public void exitCmpMne(CmpMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterJmpMne(JmpMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(JMP_MNE, ctx.getStart());
    }

    @Override
    public void exitJmpMne(JmpMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterRetMne(RetMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(RET_MNE, ctx.getStart());
    }

    @Override
    public void exitRetMne(RetMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterCallMne(CallMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(CALL_MNE, ctx.getStart());
    }

    @Override
    public void exitCallMne(CallMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterBitMne(BitMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(BIT_MNE, ctx.getStart());
    }

    @Override
    public void exitBitMne(BitMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterLogicMne(LogicMneContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(LOGIC_MNE, ctx.getStart());
    }

    @Override
    public void exitLogicMne(LogicMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSectionDir(SectionDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(SECTION_DIR, ctx.getStart());
    }

    @Override
    public void exitSectionDir(SectionDirContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterGenericDir(GenericDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(GENERIC_DIR, ctx.getStart());
    }

    @Override
    public void exitGenericDir(GenericDirContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterConditionDir(ConditionDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(CONDITION_DIR_BEGIN, ctx.getStart());
    }

    @Override
    public void exitConditionDir(ConditionDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(CONDITION_DIR_END, ctx.getStop());
    }

    @Override
    public void enterBundleDir(BundleDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(BUNDLE_DIR, ctx.getStart());
    }

    @Override
    public void exitBundleDir(BundleDirContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterMacroDir(MacroDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(MACRO_DIR, ctx.getStart());
    }

    @Override
    public void exitMacroDir(MacroDirContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterCfiDir(CfiDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(CFI_DIR, ctx.getStart());
    }

    @Override
    public void exitCfiDir(CfiDirContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterAssemblerDirective(AssemblerDirectiveContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitAssemblerDirective(AssemblerDirectiveContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterPrefixMne(PrefixMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitPrefixMne(PrefixMneContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSequenceDir(SequenceDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(SEQUENCE_DIR_BEGIN, ctx.getStart());
    }

    @Override
    public void exitSequenceDir(SequenceDirContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(SEQUENCE_DIR_END, ctx.getStop());
    }

    @Override
    public void enterMacroInvocation(MacroInvocationContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(MACRO_INVOCATION, ctx.getStart());
    }

    @Override
    public void exitMacroInvocation(MacroInvocationContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterArgument(ArgumentContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitArgument(ArgumentContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterInteger(IntegerContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitInteger(IntegerContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSubExpr(SubExprContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitSubExpr(SubExprContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterNumber(NumberContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitNumber(NumberContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterExpr(ExprContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitExpr(ExprContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterMemReferenceOperand(MemReferenceOperandContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(MEM_REFERENCE_OPERAND, ctx.getStart());
    }

    @Override
    public void exitMemReferenceOperand(MemReferenceOperandContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterRegisterOperand(RegisterOperandContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(REGISTER_OPERAND, ctx.getStart());
    }

    @Override
    public void exitRegisterOperand(RegisterOperandContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterImmediateOperand(ImmediateOperandContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(IMMEDIATE_OPERAND, ctx.getStart());
    }

    @Override
    public void exitImmediateOperand(ImmediateOperandContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterEvexOperand(EvexOperandContext ctx) {
        // TODO Auto-generated method stub
        jplagParser.add(EVEX_OPERAND, ctx.getStart());
    }

    @Override
    public void exitEvexOperand(EvexOperandContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterMemReference(MemReferenceContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void exitMemReference(MemReferenceContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterImmediate(ImmediateContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void exitImmediate(ImmediateContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterRegister(RegisterContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void exitRegister(RegisterContext ctx) {
        // TODO Auto-generated method stub
    }

    @Override
    public void enterScale(ScaleContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitScale(ScaleContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterSection(SectionContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitSection(SectionContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterDisplacement(DisplacementContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitDisplacement(DisplacementContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterIndex(IndexContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitIndex(IndexContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void enterBase(BaseContext ctx) {
        // TODO Auto-generated method stub

    }

    @Override
    public void exitBase(BaseContext ctx) {
        // TODO Auto-generated method stub

    }
}
