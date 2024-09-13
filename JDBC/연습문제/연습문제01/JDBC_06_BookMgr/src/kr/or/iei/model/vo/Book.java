package kr.or.iei.model.vo;

import java.sql.Date;
public class Book {

	private String bookName;
	private String bookContent;
	private String bookKind;
	private int bookPrice;
	private String bookAuthorName;
	private Date bookPublish;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(String bookName, String bookContent, String bookKind, int bookPrice, String bookAuthorName,
			Date bookPublish) {
		super();
		this.bookName = bookName;
		this.bookContent = bookContent;
		this.bookKind = bookKind;
		this.bookPrice = bookPrice;
		this.bookAuthorName = bookAuthorName;
		this.bookPublish = bookPublish;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookContent() {
		return bookContent;
	}
	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}
	public String getBookKind() {
		return bookKind;
	}
	public void setBookKind(String bookKind) {
		this.bookKind = bookKind;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookAuthorName() {
		return bookAuthorName;
	}
	public void setBookAuthorName(String bookAuthorName) {
		this.bookAuthorName = bookAuthorName;
	}
	public Date getBookPublish() {
		return bookPublish;
	}
	public void setBookPublish(Date bookPublish) {
		this.bookPublish = bookPublish;
	}
	@Override
	public String toString() {
		return "Book [bookName=" + bookName + ", bookContent=" + bookContent + ", bookKind=" + bookKind + ", bookPrice="
				+ bookPrice + ", bookAuthorName=" + bookAuthorName + ", bookPublish=" + bookPublish + "]";
	}
	
	
	
}
