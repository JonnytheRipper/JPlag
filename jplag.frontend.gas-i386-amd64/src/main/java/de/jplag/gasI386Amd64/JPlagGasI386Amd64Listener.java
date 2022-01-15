package de.jplag.gasI386Amd64;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import de.jplag.gasI386Amd64.grammar.GasI386Amd64Listener;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ArgumentContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.Assembler_directiveContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.AssignmentContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.Current_addressContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ExprContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ImmediateContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.InstructionContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.Int_exprContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.IntegerContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.LabelContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.Mem_referenceContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.NumberContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.OperandContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.ProgramContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.StatementContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.Statement_terminatorContext;
import de.jplag.gasI386Amd64.grammar.GasI386Amd64Parser.SymbolContext;

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
	public void enterNumber(NumberContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitNumber(NumberContext ctx) {
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
	public void enterInt_expr(Int_exprContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitInt_expr(Int_exprContext ctx) {
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
	public void enterLabel(LabelContext ctx) {
		// TODO Auto-generated method stub
		jplagParser.add(LABEL, ctx.getStart());
	}

	@Override
	public void exitLabel(LabelContext ctx) {
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
	public void enterImmediate(ImmediateContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitImmediate(ImmediateContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterInstruction(InstructionContext ctx) {
		// TODO Auto-generated method stub
		jplagParser.add(INSTRUCTION, ctx.getStart());
	}

	@Override
	public void exitInstruction(InstructionContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterMem_reference(Mem_referenceContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitMem_reference(Mem_referenceContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterOperand(OperandContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitOperand(OperandContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterAssembler_directive(Assembler_directiveContext ctx) {
		// TODO Auto-generated method stub
		jplagParser.add(ASSEMBLER_DIRECTIVE, ctx.getStart());
	}

	@Override
	public void exitAssembler_directive(Assembler_directiveContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterCurrent_address(Current_addressContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitCurrent_address(Current_addressContext ctx) {
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
	public void enterStatement_terminator(Statement_terminatorContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitStatement_terminator(Statement_terminatorContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void enterAssignment(AssignmentContext ctx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void exitAssignment(AssignmentContext ctx) {
		// TODO Auto-generated method stub
		
	}
}
