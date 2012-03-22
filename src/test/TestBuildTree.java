package test;
import java.io.File;
import java.io.FileReader;
import org.junit.Test;
import parser.MiniT;
import parser.MiniTConstants;
import parser.Start;

public class TestBuildTree extends TestCaseOutput {
    private final static String DATA = "data/";
    private final static String RESULT = "result/";
    private final static String RESULT_EXTENSION = ".res";

    private void assertCorrectOutput(String testName) {
        String fullName = testName;
        dumpTree(DATA + fullName);
        assertOutput(new File(RESULT + fullName + RESULT_EXTENSION));
    }

    @Test
    public void example() {
        assertCorrectOutput("example");
    }

    @Test
    public void example1() {
        assertCorrectOutput("example1");
    }

    @Test
    public void example2() {
        assertCorrectOutput("example2");
    }

    @Test
    public void example3() {
        assertCorrectOutput("example3");
    }

    private static void dumpTree(String arg) {
        try {
            MiniT parser = new MiniT(new FileReader(arg));
            Start start = parser.start();
            start.dumpTree("", System.out);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        dumpTree(args[0]);
    }
}
