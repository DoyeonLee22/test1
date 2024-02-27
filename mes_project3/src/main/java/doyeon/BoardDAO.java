package doyeon;

import java.sql.Connection;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDAO {
	public List<Object> selectEmp(BoardDTO boardDTO) {
		try {
			insertSQL(boardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Object> list = new ArrayList<>();

		try {
			Connection con = getConn();

			// SQL 만들기
			String query = "";
			query += " SELECT" + " *";
			query += " FROM" + " test2";

			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);

			// SQL 실행 및 결과 확보
			ResultSet rs = ps.executeQuery();

			// 결과 활용
			while (rs.next()) {
				int seq = rs.getInt("seq");
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date wDate = rs.getDate("wdate");
				int hits = rs.getInt("hits");

				BoardDTO dto = new BoardDTO();
				dto.setSeq(seq);
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

	public void insertSQL(BoardDTO boardDTO) throws Exception {
	    Connection con = getConn();
	    String sql = "INSERT INTO test2 (num, title, content, writer, wdate, hits) VALUES (?, ?, ?, ?, ?, ?)";
	    PreparedStatement pstmt = con.prepareStatement(sql);

	    pstmt.setString(1, boardDTO.getNum());
	    pstmt.setString(2, boardDTO.getTitle());
	    pstmt.setString(3, boardDTO.getContent());
	    pstmt.setString(4, boardDTO.getWriter());

	    // 현재 날짜 및 시간을 yyyy-MM-dd HH:mm:ss 형식으로 포맷하여 삽입
	    LocalDateTime currentTime = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String nowTime = currentTime.format(formatter);

	    pstmt.setString(5, nowTime);
	    pstmt.setInt(6, boardDTO.getHits());
	    pstmt.executeUpdate();

	    System.out.println("인서트 성공");
	}


	public void deleteSQL(BoardDTO boardDTO) throws SQLException {
		Connection con = getConn();
		String sql = "DELETE from test2 where seq = ?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardDTO.seq);
		
		pstmt.executeUpdate();
		System.out.println("딜리드 성공");
	}

}
