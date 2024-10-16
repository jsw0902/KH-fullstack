package kr.or.iei.model.vo;

public class Student {
	
	private String studentName;
	private int studentage;
	private String studentAddr;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(String studentName, int studentage, String studentAddr) {
		super();
		this.studentName = studentName;
		this.studentage = studentage;
		this.studentAddr = studentAddr;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public int getStudentage() {
		return studentage;
	}

	public void setStudentage(int studentage) {
		this.studentage = studentage;
	}

	public String getStudentAddr() {
		return studentAddr;
	}

	public void setStudentAddr(String studentAddr) {
		this.studentAddr = studentAddr;
	}

	@Override
	public String toString() {
		return "Student [studentName=" + studentName + ", studentage=" + studentage + ", studentAddr=" + studentAddr
				+ "]";
	}
	
	
}
