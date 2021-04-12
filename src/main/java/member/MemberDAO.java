package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement st = null;
	ResultSet rs = null;

	public MemberDAO() {
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

	public int login(String id, String password) {
		String sql = "select password from member where userid ='" + id + "'";
		try {

			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1;
				} else
					return 0;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	public int join(Member member) {
		String sql = "insert into member values(?,?,?,?,?)";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, member.getUserid());
			st.setString(2, member.getPassword());
			st.setString(3, member.getName());
			st.setString(4, member.getAddress());
			st.setString(5, member.getPhone());
			return st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
