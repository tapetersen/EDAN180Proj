package semantic;
import semanticlib.SymbolTable;

import java.util.ArrayList;

public class Semantic {
	
	private ArrayList<Exception> errors;
	public Semantic() {
		errors = new ArrayList<Exception>();
	}
	
	public void addError(Exception e) {
		errors.add(e);
	}
	
	public int numErrors() { return errors.size(); }
	public void printAnalysis() {
		if(errors.isEmpty())
			System.out.println("No errors!");
		else {
			System.out.println("errors found");
			for(Exception e : errors)
				System.out.println("Error: " + e);
		}
	}
}
