package kr.or.iei.oop.chap05;

public class BookInfo {
	
	public BookInfo(){
		
	}
	
	private String bookName;
	private int bookPrice;
	private String bookAuthor;
	private String publisher;
	
	public BookInfo(String bookName, int bookPrice, String bookAuthor, String publisher) {
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookAuthor = bookAuthor;
		this.publisher = publisher;
	}
	
	public String getBookName() {
		return this.bookName;
	}
	
	public String getBookAuthor() {
		return this.bookAuthor;
	}

	public int getBookPrice() {
		return this.bookPrice;
	}
	public String getPublisher() {
		return this.publisher;
	}
	
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
}

