package kr.or.iei.model.vo;

public class User <T>{
	
	private String name; //이름
	private int age;	 //나이
				 		 //취미(1명의 User는 1개의 취미)
	
	private T hobby; //

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String name, int age, T hobby) {
		super();
		this.name = name;
		this.age = age;
		this.hobby = hobby;
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

	public T getHobby() {
		return hobby;
	}

	public void setHobby(T hobby) {
		this.hobby = hobby;
	}
	
	
	
	
	
	
	/*
	private Soccer soccer;
	private Baseball baseBall;
	private Basketball basketball;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, int age, Soccer soccer, Baseball baseBall, Basketball basketball) {
		super();
		this.name = name;
		this.age = age;
		this.soccer = soccer;
		this.baseBall = baseBall;
		this.basketball = basketball;
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
	public Soccer getSoccer() {
		return soccer;
	}
	public void setSoccer(Soccer soccer) {
		this.soccer = soccer;
	}
	public Baseball getBaseBall() {
		return baseBall;
	}
	public void setBaseBall(Baseball baseBall) {
		this.baseBall = baseBall;
	}
	public Basketball getBasketball() {
		return basketball;
	}
	public void setBasketball(Basketball basketball) {
		this.basketball = basketball;
	}
	*/
	
	
}
