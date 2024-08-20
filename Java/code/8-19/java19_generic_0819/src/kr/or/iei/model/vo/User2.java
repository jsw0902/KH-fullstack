package kr.or.iei.model.vo;

public class User2 <T,E>{

	private T date1;
	private E date2;
	public User2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User2(T date1, E date2) {
		super();
		this.date1 = date1;
		this.date2 = date2;
	}
	public T getDate1() {
		return date1;
	}
	public void setDate1(T date1) {
		this.date1 = date1;
	}
	public E getDate2() {
		return date2;
	}
	public void setDate2(E date2) {
		this.date2 = date2;
	}
	
	
}
