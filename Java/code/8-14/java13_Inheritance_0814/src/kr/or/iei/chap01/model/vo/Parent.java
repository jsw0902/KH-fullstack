package kr.or.iei.chap01.model.vo;

//extends를 작성하지 않고 아무것도 상속바지 않아도, 모든 클래스는 Object 클래스를 상속 받음.
//Object 클래스는 최상위 클래스를 의미함.
public class Parent extends Object{
	private int money;
	private String apart;
	private String stock;
	
	protected String str;
	
	public Parent() {
		System.out.println("parent 기본 생성자!");
		// TODO Auto-generated constructor stub
	}
	public Parent(int money, String apart, String stock) {
		super();
		this.money = money;
		this.apart = apart;
		this.stock = stock;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getApart() {
		return apart;
	}
	public void setApart(String apart) {
		this.apart = apart;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public void printMsg() {
		System.out.println("i am Parent!");
	}
	protected void printMsg1() {
		System.out.println("i am Parent! printMsg1() ");
	}
	
	@Override
	public String toString() {
		return "Parent [money=" + money + ", apart=" + apart + ", stock=" + stock + "]";
	}
	
}
