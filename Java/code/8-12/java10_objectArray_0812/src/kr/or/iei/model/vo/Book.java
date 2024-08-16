package kr.or.iei.model.vo;

public class Book {
	
	private String bookname;
	private String author;
	private int price;
	private String publisher;
	
	public Book(){
		
	}
	public Book(String bookname, String author, int price, String publisher) {
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.publisher = publisher;
	}
	
	public String getBookname() {
		return this.bookname;
	}
	public String getAuthor() {
		return this.author;
	}
	public int getPrice() {
		return this.price;
	}
	public String getPublisher() {
		return this.publisher;
	}
	
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
}
