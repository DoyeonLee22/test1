package doyeon;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
	public List<Object> selectEmp(BoardDTO boardDTO) {
		List<Object> list = new ArrayList<>();

		try {
			Connection con = getConn();

			// SQL 만들기
			String query = "";
			query += " SELECT" + " *";
			query += " FROM" + " test";
			System.out.println("query : " + query);

			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
		
			// SQL 실행 및 결과 확보
			ResultSet rs = ps.executeQuery();

			// 결과 활용
			while (rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date wDate = rs.getDate("wdate");
				int hits = rs.getInt("hits");

//				System.out.println("num : " + num);
//				System.out.println("title : " + title);
//				System.out.println("content : " + content);
//				System.out.println("writer : " + writer);
//				System.out.println("wDate : " + wDate);
//				System.out.println("hits : " + hits);
				
				BoardDTO dto = new BoardDTO();
				dto.setNum(num);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setWriter(writer);
				dto.setWdate(wDate);
				dto.setHits(hits);

				list.add(dto);
			}

			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	private Connection getConn() {
		// DB 접속
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "scott4_3";
		String password = "tiger";

		Connection con = null;

		try {
			// 드라이버 로딩
			Class.forName(driver);

			// DB 접속
			con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외");
		}
		return con;
	}
	
}
