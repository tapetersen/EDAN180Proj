package util;

public class AsmContext {
	
	private final static int[] tabs = {4, 12, 28};
	private int numVars;
	private int numTemps;

	
	private final static int varSize = 4;
	private final static int implicitVars = 2;

	public TabbedBuffer newLineBuf() {return new TabbedBuffer(tabs);};
	public int getTempOffset(int number) {
		return -varSize*(implicitVars+getNumVars());
	}

	public int getVarOffset(int number) {
		return -varSize*implicitVars;
	}

	public int getNumVars() {
		return numVars;
	}

	public void setNumVars(int numVars) {
		this.numVars = numVars;
	}
	
	public int getNumTemps() {
		return numTemps;
	}
	
	public void setNumTemps(int numTemps) {
		this.numTemps = numTemps;
	}
	
	public int getRecordSize() {
		return varSize*(implicitVars+numVars+numTemps);
	}
}
