package kr.co.vo;

import java.util.Date;

public class ReplyVO {

	private int board_id;
	private int comment_id;
	private String comment_content;
	private String userid;
	private Date comment_date;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [board_id=" + board_id + ", comment_id=" + comment_id + ", comment_content=" + comment_content
				+ ", userid=" + userid + ", comment_date=" + comment_date + "]";
	}
	
	
	
}
