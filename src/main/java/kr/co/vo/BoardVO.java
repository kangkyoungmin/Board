package kr.co.vo;

import java.util.Date;

public class BoardVO {
	/*
	 * "BOARD_ID" NUMBER(20,0) NOT NULL, 
	"USERID" VARCHAR2(20 BYTE) NOT NULL, 
	"BOARD_TITLE" VARCHAR2(100 BYTE) NOT NULL, 
	"BOARD_CONTENT" CLOB NOT NULL, 
	"BOARD_IMG" VARCHAR2(500 BYTE), 
	"BOARD_DATE" DATE NOT NULL, 
	"VIEWS" NUMBER(10,0) NOT NULL
	 */
	private int board_id;
	private String userid;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int views;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
	
	
}
