package semantic;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.SortedMap;
import java.util.Stack;
import java.util.TreeMap;

import parser.Procedure;

public class Semantic {

	private SortedMap<Integer, Exception> errors;
	private Stack<Procedure> currentProcedure;
	private ArrayList<Procedure> procedures;

	public Semantic() {
		errors = new TreeMap<Integer, Exception>();
		procedures = new ArrayList<Procedure>();
		currentProcedure = new Stack<Procedure>();
	}

	public void enterProcedure(Procedure p) {
		currentProcedure.push(p);
		procedures.add(p);
	}

	public Collection<Procedure> getProcedures() {
		return procedures;
	}

	public void exitProcedure() {
		currentProcedure.pop();
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
