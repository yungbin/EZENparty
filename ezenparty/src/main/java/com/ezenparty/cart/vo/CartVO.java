package com.ezenparty.cart.vo;

public class CartVO {

	private long pno;
	private String image, pname;
	private int nuit;
	private long price;
	public long getPno() {
		return pno;
	}
	public void setPno(long pno) {
		this.pno = pno;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getNuit() {
		return nuit;
	}
	public void setNuit(int nuit) {
		this.nuit = nuit;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartVO [pno=" + pno + ", image=" + image + ", pname=" + pname + ", nuit=" + nuit + ", price=" + price
				+ "]";
	}
	
}
