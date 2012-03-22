package util;
import icode.*;

public class TempFactory {
    private int top = 0; // next number to allocated
    private int max = 0; // maximum allocated number since last reset

    /**
     * Returns the maximum number of the temporaries allocated since the
     * previous call to reset.
     */
    public int getNumberOfTemps() {
        return max;
    }

    /**
     * Resets all local data. Call before starting to generate code for a
     * method.
     */
    public void reset() {
        top = 0;
        max = 0;
    }

    /**
     * Restarts the numbering of temporaries (the next allocated temporary will
     * get the value 0). This method can be called at points where it is known
     * that no temporaries are in use, e.g., between statements.
     */
    public void restartNumbering() {
        top = 0;
    }

    public Temp create() {
        // returns a new Temp and updates top and max.
        top++;
        if (top > max)
            max = top;
        return new Temp(top - 1);
    }
}
