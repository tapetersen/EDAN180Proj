package test;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import org.junit.Test;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import parser.MiniT;
import parser.MiniTConstants;
import parser.Start;
import semantic.Semantic;

public class TestSemantic extends TestCaseOutput {
    private final static String DATA = "data/";
    private final static String RESULT = "result/";
    private final static String RESULT_EXTENSION = ".res";

    private void assertCorrectOutput(String testName) {
        String fullName = testName;
        analyse(DATA + fullName);
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

    private static int analyse(String arg) {
    	MiniT parser;
			try {
				parser = new MiniT(new FileReader(arg));
				Start start = parser.start();
				Semantic s = new Semantic(); 
				start.nameAnalysis(s);
				s.printAnalysis();
				return s.numErrors();
			} catch (FileNotFoundException e) {
				System.out.println("File not found");
			} catch (parser.ParseException e) {
				System.out.println(e);
			}
			return 0;

    }

    public static void main(String[] args) {
        analyse(args[0]);
    }
}
