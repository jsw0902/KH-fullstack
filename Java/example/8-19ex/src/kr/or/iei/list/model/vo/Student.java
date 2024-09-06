package kr.or.iei.list.model.vo;

public class Student {
	
	private String name; 	//이름
	private int age;	 	//나이
	private String addr; 	//주소
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String name, int age, String addr) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return name + "\t" + age + "\t" + addr + "\n";
	}
	
	
}
