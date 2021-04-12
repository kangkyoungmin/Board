package player;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PlayerDAO {

	Connection conn = null;
	
	ResultSet rs = null;
   
	public PlayerDAO() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // localhost대신 ip주소가 들어갈수도
			String id = "sys as sysdba";
			String pw = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			// System.out.println(conn.isClosed()?"접속종료":"접속중");// 접속중(false), 접속종료(true)
			// 4. 접속
			// - Connection 객체 생성 + 접속 작업.

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Player> getList(){
		String sql = "select * from(select*from player order by career desc) where rownum<=5";
		ArrayList<Player> list = new ArrayList<Player>();
		try {
		   PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Player p = new Player();
				p.setPlayer_id(rs.getString(1));
				p.setPlayer_name(rs.getString(2));
				p.setPlayer_birth(rs.getDate(3));
				p.setPlayer_num(rs.getInt(4));
				p.setHeight(rs.getInt(5));
				p.setPosition_id(rs.getInt(6));
				p.setTeam_id(rs.getInt(7));
				p.setCareer(rs.getInt(8));
				list.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
