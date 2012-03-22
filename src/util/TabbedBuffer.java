package util;
/**
 * A TabbedBuffer is a string builder with tabulator stops.
 */
public class TabbedBuffer {
    private StringBuilder builder = new StringBuilder(120);
    private int tab;
    private int tabs[];
    final static private String spaces = "                                                                      ";

    /**
     * Creates a TabbedBuffer with tabulator stops given by the tabs array.
     */
    public TabbedBuffer(int tabs[]) {
        this.tabs = tabs;
    }

    /**
     * Creates a TabbedBuffer with 20 stops, one at every eightth position.
     */
    public TabbedBuffer() {
        tabs = new int[20];
        for (int i = 0; i < tabs.length; i++) {
            tabs[i] = (i + 1) * 8;
        }
    }

    /**
     * Appends the string representation of object and pads spaces up to the
     * next tabulator stop.
     */
    public TabbedBuffer append(Object object) {
        builder.append(object);
        if (tab < tabs.length) {
            int len = tabs[tab] - builder.length();
            if (0 < len && len < spaces.length()) {
                builder.append(spaces.subSequence(0, len));
            }
        }
        tab++;
        return this;
    }

    /**
     * Appends the string representation of value and pads spaces up to the next
     * tabulator stop.
     */
    public TabbedBuffer append(int value) {
        return append(String.valueOf(value));
    }

    /**
     * Tabs forward to tabulator position number tab.
     */
    public void tabTo(int tab) {
        while (tab > this.tab) {
            append("");
        }
    }

    /**
     * Clears this TabbedBuffer.
     */
    public void clear() {
        builder.setLength(0);
        tab = 0;
    }

    /**
     * Returns the contents of this TabbedBuffer.
     */
    public String toString() {
        return builder.toString();
    }
}
