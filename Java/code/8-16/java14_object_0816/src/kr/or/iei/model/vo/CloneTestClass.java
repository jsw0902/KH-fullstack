package kr.or.iei.model.vo;

//객체 복사 시, Cloneble을 implements 해야 한다.
//Cloneable을 implements 키워드로 작성하는건, JVM에게 복사할 객체라는 것을 알려주기 위한 용도.
public class CloneTestClass implements Cloneable{ //implements : 구현하다

	private String a;
	private String b;
	public CloneTestClass() {
		super();
	}
	public CloneTestClass(String a, String b) {
		super();
		this.a = a;
		this.b = b;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	
	@Override
	public Object clone() {
		try {
			return super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/* finale이라는 키워드로 작성된 메소드는 오버라이딩 하지 못함 
	@Override
	public final Class<?> getClass(){
		
	}
	*/
}
