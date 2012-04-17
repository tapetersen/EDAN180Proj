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
    private final static String RESULT_EXTENSION = ".sdump";

    private void assertCorrectOutput(String testName) {
        String fullName = testName;
        analyse(DATA + fullName);
        assertOutput(new File(RESULT + fullName + RESULT_EXTENSION));
    }

    @Test
    public void if_dead() {
        assertCorrectOutput("if_dead");
    }

    @Test
    public void for_dead() {
        assertCorrectOutput("for_dead");
    }

    @Test
    public void for_ret() {
        assertCorrectOutput("for_ret");
    }

    @Test
    public void if_live() {
        assertCorrectOutput("if_live");
    }
    
    @Test
    public void simple_dead() {
    	assertCorrectOutput("simple_dead");
    }
    
    @Test
    public void printRec() {
    	assertCorrectOutput("printRec");
    }
    
    @Test
    public void printNested() {
    	assertCorrectOutput("printNested");
    }
    
    @Test
    public void printTwoNested() {
    	assertCorrectOutput("printTwoNested");
    }
    
    @Test
    public void factorial() {
    	assertCorrectOutput("factorial");
    }
    
    @Test
    public void boolexample() {
    	assertCorrectOutput("boolexample");
    }
    
    @Test
    public void codeexample() {
    	assertCorrectOutput("codeexample");
    }
    
    @Test
    public void double_func_call() {
    	assertCorrectOutput("double_func_call");
    }

    private static int analyse(String arg) {
    	MiniT parser;
			try {
				parser = new MiniT(new FileReader(arg));
				Start start = parser.start();
				Semantic s = new Semantic(); 
				start.nameAnalysis(s);
				if(s.numErrors()>0) {
					s.printAnalysis();
					return s.numErrors();
				}
				start.typeAnalysis(s);
				if(s.numErrors()>0)
					s.printAnalysis();
				else
					start.dumpSemantics(System.out);
				return s.numErrors();
			} catch (FileNotFoundException e) {
				System.out.println("File not found");
			} catch (parser.ParseException e) {
				System.out.println(e);
			}
			return -1;
    }

    public static void main(String[] args) {
        analyse(args[0]);
    }
}
