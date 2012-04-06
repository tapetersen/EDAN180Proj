package semantic;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.Stack;
import java.util.TreeMap;


import parser.IdDecl;
import parser.Procedure;
import semanticlib.SymbolTable;

public class Semantic {

	private SortedMap<Integer, Exception> errors;
	private Stack<Procedure> currentProcedure;
	private SymbolTable<String, IdDecl> symTab;
	private SymbolTable<String, Procedure> procTab;
	private ArrayList<Procedure> procedures;
	

	public Semantic() {
		errors = new TreeMap<Integer, Exception>();
		procTab = new SymbolTable<String, Procedure>();
		symTab = new SymbolTable<String, IdDecl>();
		procTab.enterBlock();
		symTab.enterBlock();
		procedures = new ArrayList<Procedure>();
		currentProcedure = new Stack<Procedure>();
	}

	public void enterProcedure(Procedure p) {
		currentProcedure.push(p);
		procTab.enterBlock();
		symTab.enterBlock();
	}

	public void exitProcedure() {
		procTab.exitBlock();
		symTab.exitBlock();
		currentProcedure.pop();
	}
	
	public void addProcedure(Procedure p) {
		try {
			procTab.add(p.id(), p);
		} catch (Exception e) {
			addError(new NameError(e.getMessage(), p.beginLine()));
		}
		procedures.add(p);
	}
	
	public void addSymbol(IdDecl s) {
		try {
			symTab.add(s.id(), s);
		} catch (Exception e) {
			addError(new NameError(e.getMessage(), s.beginLine()));
		}
	}
	
	public IdDecl lookupSym(String id) {
		return symTab.lookup(id);
	}
	
	public Procedure lookupProc(String id) {
		return procTab.lookup(id);
	}
	
	public void enterBlock() {
		symTab.enterBlock();
	}
	
	public void exitBlock() {
		symTab.exitBlock();
	}

	/**
	 * Returns the blocklevel used for static links, may be lower than lexical blocklevel.
	 * 
	 * @return Procedure blocklevel
	 */
	public int blockLevel() {
		return procTab.blockLevel();
	}
	
	public Iterable<Procedure> procedures() {
		return procedures;
	}
	
	public Procedure currentProcedure() {
		if (currentProcedure.empty())
			return null;
		return currentProcedure.peek();
	}

	public void addError(Exception e, int line) {
		errors.put(line, e);
	}
	
	public void addError(MiniTError e) {
		errors.put(e.getLine(), e);
	}
	
	public int numErrors() {
		return errors.size();
	}

	public void printAnalysis() {
		if (errors.isEmpty())
			System.out.println("No errors!");
		else {
			System.out.println("errors found");
			for (Map.Entry<Integer, Exception> e : errors.entrySet())
				System.out.println(""+e.getKey()+": Error: " + e.getValue());
		}
	}
}
