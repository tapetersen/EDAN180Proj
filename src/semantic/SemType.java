package semantic;
/**
  * SemType implements a representation of types for supporting
  * typechecking of simple languages.
  */

public class SemType {
	public static final String INTEGER_STRING = "integer";
	public static final String BOOL_STRING = "bool";
	public static final String NONE_STRING = "none";
	public static final String UNKNOWN_STRING = "unknown";
	
  public static final SemType INTEGER = new IntegerType();
  public static final SemType BOOL = new BoolType();
  public static final SemType NONE = new NoneType();
  public static final SemType UNKNOWN = new UnknownType();
  
  static class IntegerType extends SemType {
    public String toString() { return INTEGER_STRING; }
  }
  static class BoolType extends SemType {
    public String toString() { return BOOL_STRING; }
  }
  static class NoneType extends SemType {
	  public String toString() { return NONE_STRING; }
  }
  static class UnknownType extends SemType {
	  public String toString() { return UNKNOWN_STRING; }
  }

  public static SemType fromString(String s) {
	  if(s.equals(INTEGER_STRING)) {
		  return INTEGER;
	  }
	  if(s.equals(BOOL_STRING)) {
		  return BOOL;
	  }
	  if(s.equals(NONE_STRING)) {
		  return NONE;
	  }
	  return UNKNOWN;
  }
}
