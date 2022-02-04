package com.ezenparty.product.vo;

public class ProductVO {
	
	private long pno;
	private String pname, price, color;
	private int unit;
	private String image, title, content, writeDate;
	private long hit;
	
	public long getPno() {
		return pno;
	}
	public void setPno(long pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", pname=" + pname + ", price=" + price + ", color=" + color + ", unit=" + unit
				+ ", image=" + image + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", hit=" + hit + "]";
	}
}
