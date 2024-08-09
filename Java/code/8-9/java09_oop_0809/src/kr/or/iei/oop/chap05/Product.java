package kr.or.iei.oop.chap05;

public class Product {
	
	private String productName;
	private int price;
	private String brand;
	
	public Product() {
		
	}
	
	public Product(int price, String productName, String brand) {
		this.price = price;
		this.productName = productName;
		this.brand = brand;
	}
	
	public int getPrice() {
		return this.price;
	}
	
	public String getProductName() {
		return this.productName;
	}
	
	public String getBrand() {
		return this.brand;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
}
