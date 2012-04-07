package semantic;

public class MiniTError extends Exception {
	private int line;
	
	public MiniTError(String message, int line) {
		super(message);
		this.line = line;
	}
	
	public int getLine() { return line; }
}
