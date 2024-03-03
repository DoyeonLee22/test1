package board.free;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.free.BoardDTO;

@WebServlet("/dot")
public class Oracle_test extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");

		String boardType = request.getParameter("boardType");
		System.out.println("================================================");
		System.out.println("          boardType : " + boardType);
		System.out.println("================================================");
		if (boardType != null && boardType.equals("자유게시판")) {
			try {
				showFreeBoard(request, response);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				System.out.println("자유게시판 못들어감");
			}
		} else if (boardType != null && boardType.equals("QaA게시판")) {
			try {
				showQABoard(request, response);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				System.out.println("Q&A 못들어감");
			}
		} else if (boardType != null && boardType.equals("건의게시판")) {
			try {
				showSuggestBoard(request, response);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				System.out.println("건의게시판 못들어감");
			}
		} else {

			try {
				showFreeBoard(request, response);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				System.out.println("아무것도 못들어감");
			}
		}
	}

	void showFreeBoard(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		// 자유게시판 데이터를 가져오는 코드입니다.
		Connection con = getConn();

		List list = new ArrayList();
		String query = "";
		query += " select";
		query += " *";
		query += " from";
		query += " test2";
		query += " where boardType = '자유게시판'";

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

//		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			String boardType = rs.getString("boardType");
			int seq = rs.getInt("seq");
			String userId = rs.getString("userId");
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			Date wDate = rs.getDate("wdate");
			int hits = rs.getInt("hits");

			BoardDTO dto = new BoardDTO();
			dto.setBoardType(boardType);
			dto.setSeq(seq);
			dto.setUserId(userId);
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

		request.setAttribute("list", list);

//	디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("boardTable.jsp");

		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	void showQABoard(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Connection con = getConn();

		List list = new ArrayList();
		String query = "";
		query += " select";
		query += " *";
		query += " from";
		query += " test2";
		query += " where boardType = 'QaA게시판'";

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

//		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			String boardType = rs.getString("boardType");
			int seq = rs.getInt("seq");
			String userId = rs.getString("userId");
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			Date wDate = rs.getDate("wdate");
			int hits = rs.getInt("hits");

			BoardDTO dto = new BoardDTO();
			dto.setBoardType(boardType);
			dto.setSeq(seq);
			dto.setUserId(userId);
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

		request.setAttribute("list", list);

//	디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("QA.jsp");

		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	void showSuggestBoard(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Connection con = getConn();
		List list = new ArrayList();
		String query = "";
		query += " select";
		query += " *";
		query += " from";
		query += " test2";
		query += " where boardType = '건의게시판'";

		System.out.println("query : " + query);
		PreparedStatement ps = con.prepareStatement(query);

//		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			String boardType = rs.getString("boardType");
			int seq = rs.getInt("seq");
			String userId = rs.getString("userId");
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			Date wDate = rs.getDate("wdate");
			int hits = rs.getInt("hits");

			BoardDTO dto = new BoardDTO();
			dto.setBoardType(boardType);
			dto.setSeq(seq);
			dto.setUserId(userId);
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

		request.setAttribute("list", list);

		//	디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("suggestTable.jsp");

		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

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
			// Class.forName : String 변수로 class 생성
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
