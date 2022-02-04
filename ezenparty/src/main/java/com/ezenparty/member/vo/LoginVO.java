package com.ezenparty.member.vo;

public class LoginVO {

	private String id, pw, name, photo;
	private int gradeNo;
	private String gradeName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	
	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", pw=" + pw + ", name=" + name + ", photo=" + photo + ", gradeNo=" + gradeNo
				+ ", gradeName=" + gradeName + "]";
	}
	
	
}
