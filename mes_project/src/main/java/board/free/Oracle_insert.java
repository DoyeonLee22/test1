package board.free;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/doi")
public class Oracle_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		test(request, response);
	}

	void test(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "scott4_3";
		String password = "tiger";
		
		String boardType = request.getParameter("boardType");
		System.out.println("==========================");
		System.out.println("boardType : " + boardType);
		System.out.println("==========================");
		
		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공 OI");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

			HttpSession session = request.getSession(false);
			String userName = null;
			String role = null;

			if (session != null) {
				userName = (String) session.getAttribute("user");
				role = (String) session.getAttribute("role");
			}

			if ("WORKER".equals(role)) {

				String userId = request.getParameter("userId");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				String wdate = request.getParameter("wdate");
				int hits = Integer.parseInt(request.getParameter("hits"));

				if (title.trim().equals("")) {
					System.out.println("제목을 입력하세요");
				} else if (content.trim().equals("")) {
					System.out.println("내용을 입력하세요");
				} else {
					String query = "";
					query += " insert";
					query += " into";
					query += " test2";

					// mesid는 기본 시퀀스라서 어디서 받아오는 값이 아니다.
					query += " (boardType, seq, userId, num, title, content, writer, wdate, hits)";
					query += " values";
					if("자유게시판".equals(boardType)) {
						query += " ('자유게시판', emp_seq.NEXTVAL, ?, num.NEXTVAL, ?, ?, ?, ?, ?)";
					} else if("QaA게시판".equals(boardType)) {
						query += " ('QaA게시판', emp_seq.NEXTVAL, ?, num.NEXTVAL, ?, ?, ?, ?, ?)";												
					} else if("건의게시판".equals(boardType)) {
						query += " ('건의게시판', emp_seq.NEXTVAL, ?, num.NEXTVAL, ?, ?, ?, ?, 0)";												
					}

					System.out.println("query : " + query);
					PreparedStatement ps = con.prepareStatement(query);

					if("자유게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
						ps.setInt(6, hits);
					} else if("QaA게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
						ps.setInt(6, hits);
					} else if("건의게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
					}

					int count = ps.executeUpdate();

					ps.close();
					con.close();
				}
			} else if("ADMIN".equals(role)) {

				String userId = request.getParameter("userId");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				String wdate = request.getParameter("wdate");
				int hits = Integer.parseInt(request.getParameter("hits"));

				if (title.trim().equals("")) {
					System.out.println("제목을 입력하세요");
				} else if (content.trim().equals("")) {
					System.out.println("내용을 입력하세요");
				} else {
					String query = "";
					query += " insert";
					query += " into";
					query += " test2";

					// mesid는 기본 시퀀스라서 어디서 받아오는 값이 아니다.
					query += " (boardType, seq, userId, num, title, content, writer, wdate, hits)";
					query += " values";
					if("자유게시판".equals(boardType)) {
						query += " ('자유게시판', emp_seq.NEXTVAL, ?, '공지', ?, ?, ?, ?, ?)";						
					} else if("QaA게시판".equals(boardType)) {
						query += " ('QaA게시판', emp_seq.NEXTVAL, ?, 'Q_A', ?, ?, ?, ?, ?)";												
					} else if("건의게시판".equals(boardType)) {
						query += " ('건의게시판', emp_seq.NEXTVAL, ?, num.NEXTVAL, ?, ?, ?, ?, 0)";												
					}

					System.out.println("query : " + query);
					PreparedStatement ps = con.prepareStatement(query);

					if("자유게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
						ps.setInt(6, hits);
					} else if("QaA게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
						ps.setInt(6, hits);
					} else if("건의게시판".equals(boardType)) {
						ps.setString(1, userId);
						ps.setString(2, title);
						ps.setString(3, content);
						ps.setString(4, writer);
						ps.setString(5, wdate);
					}

					int count = ps.executeUpdate();

					ps.close();
					con.close();
				}
			} else {
				System.out.println("FUCK");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // 얘가 오라클을 사용할 수 있게 해줌
		
		response.sendRedirect("dot?boardType=" + URLEncoder.encode(boardType, "UTF-8"));
	}

}
