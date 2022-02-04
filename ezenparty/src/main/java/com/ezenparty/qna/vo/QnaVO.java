package com.ezenparty.qna.vo;

public class QnaVO {
	
	private long no;
	private String title, content, id, writeDate;
	private long refNo;
	private int ordNo, levNo;
	private long parentNo;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public long getRefNo() {
		return refNo;
	}
	public void setRefNo(long refNo) {
		this.refNo = refNo;
	}
	public int getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}
	public int getLevNo() {
		return levNo;
	}
	public void setLevNo(int levNo) {
		this.levNo = levNo;
	}
	public long getParentNo() {
		return parentNo;
	}
	public void setParentNo(long parentNo) {
		this.parentNo = parentNo;
	}
	
	@Override
	public String toString() {
		return "QnaVO [no=" + no + ", title=" + title + ", content=" + content + ", id=" + id + ", writeDate="
				+ writeDate + ", refNo=" + refNo + ", ordNo=" + ordNo + ", levNo=" + levNo + ", parentNo=" + parentNo
				+ "]";
	}
	
	
}
