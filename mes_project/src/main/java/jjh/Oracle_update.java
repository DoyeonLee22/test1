package jjh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

@WebServlet("/dou")
public class Oracle_update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		test(request, response);

	}

	void test(HttpServletRequest request, HttpServletResponse response) throws IOException {

//		들어오는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");

//		내보내는 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8;");

		try {
			Connection con = getConn();

			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String seq = request.getParameter("seq");
			

			String query = "";
			query += " update";
			query += " test2";
			query += " set";

			query += " title = ? ,";

			query += " content = ? ,";

			query += " writer = ? ";

			query += " where seq = ?";

			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, writer);
			ps.setString(4, seq);

			System.out.println("----------바꿀거-----------");
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("writer : " + writer);
			System.out.println("seq : " + seq);
			System.out.println("--------------------------");

			int count = ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("dot");
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
