package semantic;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Stack;

import parser.Procedure;

public class Semantic {

	private ArrayList<Exception> errors;
	private Stack<Procedure> currentProcedure;
	private ArrayList<Procedure> procedures;

	public Semantic() {
		errors = new ArrayList<Exception>();
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

	public void addError(Exception e) {
		errors.add(e);
	}

	public int numErrors() {
		return errors.size();
	}

	public void printAnalysis() {
		if (errors.isEmpty())
			System.out.println("No errors!");
		else {
			System.out.println("errors found");
			for (Exception e : errors)
				System.out.println("Error: " + e);
		}
	}
}
