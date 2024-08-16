package kr.or.iei.model.vo;


//추상 메소드를 포함한 클래스 : 추상클래스
public abstract class Parent {
	
	private int money;
	private String apart;
	private String stock;

	public Parent() {
		super();
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
	
	//추상 메소드 : 몸체가 없는 메소드
	public abstract void test();
}
