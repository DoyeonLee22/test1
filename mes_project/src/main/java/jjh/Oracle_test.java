package jjh;

import java.io.IOException;
		
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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

import jjh.BoardDTO;

@WebServlet("/dot")
public class Oracle_test extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		test(request, response);
	}

	void test(HttpServletRequest request, HttpServletResponse response) throws IOException {

//		들어오는 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");

//		내보내는 한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8;");

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
		String user = "scott4_3";
		String password = "tiger";

		List list = new ArrayList();

		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");

			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공 OT");

//			String name = request.getParameter("name");

			String query = "";
			query += " select";
			query += " *";
			query += " from";
			query += " test2";
//			query += " where lower(품목) like '%' || lower(?) || '%'";

			System.out.println("query : " + query);
			PreparedStatement ps = con.prepareStatement(query);

//			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int seq = rs.getInt("seq");
				String userId = rs.getString("userId");
				String num = rs.getString("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date wDate = rs.getDate("wdate");
				int hits = rs.getInt("hits");

				BoardDTO dto = new BoardDTO();
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);

//		디스패쳐 포워드로 jsp로 보낸다.
		RequestDispatcher dispatch = request.getRequestDispatcher("boardTable.jsp");
		try {
			dispatch.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
