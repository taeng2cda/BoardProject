package com.spring.datatree.Vo;

import java.sql.Date;

public class BoardVo {
	
	private int bnum;
	private String userid;
	private String title;
	private String content;
	private int count;
	private int likecount;
	private Date boarddate;
	
	
	public BoardVo() {
		super();
	}
	public BoardVo(int bnum, String userid, String title, String content, int count, int likecount, Date boarddate) {
		super();
		this.bnum = bnum;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.count = count;
		this.likecount = likecount;
		this.boarddate = boarddate;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	
	

}
