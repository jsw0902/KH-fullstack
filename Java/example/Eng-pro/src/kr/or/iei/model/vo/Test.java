package kr.or.iei.model.vo;

public class Test {

	private String testType;
	private int nums;
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Test(String testType, int nums) {
		super();
		this.testType = testType;
		this.nums = nums;
	}
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	
	
	
}
