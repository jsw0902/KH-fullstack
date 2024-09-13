package kr.or.iei.model.vo;

public class Author {
	private String authorName;
	private int authorAge;
	private String authorGender;
	public Author() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Author(String authorName, int authorAge, String authorGender) {
		super();
		this.authorName = authorName;
		this.authorAge = authorAge;
		this.authorGender = authorGender;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public int getAuthorAge() {
		return authorAge;
	}
	public void setAuthorAge(int authorAge) {
		this.authorAge = authorAge;
	}
	public String getAuthorGender() {
		return authorGender;
	}
	public void setAuthorGender(String authorGender) {
		this.authorGender = authorGender;
	}
	@Override
	public String toString() {
		return "Author [authorName=" + authorName + ", authorAge=" + authorAge + ", authorGender=" + authorGender + "]";
	}
	
	
	
}
