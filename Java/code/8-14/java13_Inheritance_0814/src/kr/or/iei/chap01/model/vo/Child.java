package kr.or.iei.chap01.model.vo;


//Child 클래스가 Parent 클래스를 상속 받음.
public class Child extends Parent{
	
	//자식 클래스만의 멤버 변수 
	private int childMoney;
	
	public Child() {
		System.out.println("child 기본 생성자");
	}
	public Child(int money, String apart, String stock) {
		/* 상속을 받아도, 부모 클래스의 private 변수에는 직접적인 접근이 불가.
		this.money = money;
		this.apart = apart;
		this.stock = stock;
		*/
		
		
		//setMoney(money);
		//부모 클래스의 생성자를 호출. -> 해당 코드 이전에, 수행 코드 작성 불가
		super(money, apart, stock);
		
		//v2 상속받은 메소드를 사용해 초기화
		setMoney(money);
		setApart(apart);
		setStock(stock);
		
		//v3 super 키워드를 사용해, 명시적으로 부모 클래스의 메소드 호출
		super.setMoney(money);
		super.setApart(apart);
		super.setStock(stock);
		
		//str은 Parent 클래스에 protected 접근제어지시자로 선언된 변수이므로 직접적인 접근이 가능하다.
		//protected : 후손 관계(부모 ~ 자식 관계를 의미)
		str = "";
	}
	
	public Child(int money, String apart, String stock, int childMoney) {
		//super(money, apart, stock, childMoney); //부모 클래스는 childMoney가 없어서 오류
		
		//부모 클래스에는 변수가 3개뿐이고, 자식 클래스에는 3개 + 1개.  
		/*
		super(money, apart, stock);
		this.childMoney = childMoney;
		*/
		
		//현재 자식(Child) 클래스에 정의된 매개변수 3개짜리 생성자 호출
		this(money, apart, stock);
		this.childMoney = childMoney;
	}
	
	
	public int getChildMoney() {
		return childMoney;
	}
	public void setChildMoney(int childMoney) {
		this.childMoney = childMoney;
	}
	
	
	//Override : 부모 클래스에서 상속받은 멤버를 재정의 한다는 의미를 가진 어노테이션
	//Override 어노테이션을 붙이지 않아도, 재정의 가능하지만 오타가 날 경우 별도의 메소드로 인식해버림
	@Override
	public void printMsg() {
		
		System.out.println("i am child!");
	}
	
	//오버라이딩한 메소드의 접근제시자는 부모클래스의 접근제어제시자와 같거나, 범위가 더 넓어야 한다.
	//오버라이딩한 메소드는 부모클래스의 메소드의 반환형, 메소드명, 매개변수 갯수 or 타입이 모두 일치해야 한다.
	@Override
	protected void printMsg1() {
		System.out.println("i am Child! printMsg1() ");
	}
	
	/*
	 * 시험에는 안나오나 기억해두면 좋은 것
	 * 아래 super 키워드(부모 클래스 지침)를 작성하지 않으면, 재귀호출(자기 자신을 호출) 하여.
	 * StackOverflowError가 발생한다.
	 */
	@Override
	public int getMoney() {
		System.out.println("this is getMoney() ");
		return (int)(super.getMoney() * 0.2);
	}
	
	public void getBonus() {
		
	}
	Child childTest = new Child();
	
}
