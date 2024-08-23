package kr.or.iei.chap04.model.vo;

import java.io.Serializable;

//직렬화 : 객체를 스트림으로 내보내기 위해, 사전에 해주어야 하는 작업
//Serializable 인터페이스를 구현해야 함. JVM에게 해당 클래스로 생성된 객체를 직렬화한다는 것을 알려주기 위한 용도
//*중요*
public class User implements Serializable{
	private static final long SerialVersionUID = 392839429392L;
	private String id;
	private transient String pw; //transient로 선언한 필드는, 직렬화 시 내보내지지 않음.
	private String name;
	private int age;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String id, String pw, String name, int age) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return id + "/" + pw + "/" + name + "/" + age;
	}
	
}
