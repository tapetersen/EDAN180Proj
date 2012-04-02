package semantic;

public class MiniTError extends Exception {
	private int line;
	
	MiniTError(String message, int line) {
		super(message);
		this.line = line;
	}
	
	public int getLine() { return line; }
}
