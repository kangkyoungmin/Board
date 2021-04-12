package player;

import java.util.Date;
public class Player {
	 private String player_id;
	 private String player_name;
	 private Date player_birth;
	 private Integer player_num;
	 private Integer height;
	 private Integer position_id;
	 public String getPlayer_id() {
		return player_id;
	}
	public void setPlayer_id(String player_id) {
		this.player_id = player_id;
	}
	public String getPlayer_name() {
		return player_name;
	}
	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}
	public Date getPlayer_birth() {
		return player_birth;
	}
	public void setPlayer_birth(Date player_birth) {
		this.player_birth = player_birth;
	}
	public Integer getPlayer_num() {
		return player_num;
	}
	public void setPlayer_num(Integer player_num) {
		this.player_num = player_num;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Integer getPosition_id() {
		return position_id;
	}
	public void setPosition_id(Integer position_id) {
		this.position_id = position_id;
	}
	public Integer getTeam_id() {
		return team_id;
	}
	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}
	public Integer getCareer() {
		return career;
	}
	public void setCareer(Integer career) {
		this.career = career;
	}
	private Integer team_id;
	 private Integer career;
}
