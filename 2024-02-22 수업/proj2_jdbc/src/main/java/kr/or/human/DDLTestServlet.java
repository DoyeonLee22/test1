package kr.or.human;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/init")
public class DDLTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controller(request, response);
		System.out.println("doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controller(request, response);
		System.out.println("doPost");
	}

	protected void controller(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8;");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외");
		}
		String driver = "oracle.jdbc.driver.OracleDriver"; // 오라클에 접속할때 필요.
		String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";

		String user = "scott4_3";
		String password = "tiger";
		
		try {
			// 드라이버 로딩
			// Class.forName() : String 변수로 class 생성
			Class clazz = Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");
			
			// DB 접속
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("Connection 생성 성공");

			String name = request.getParameter("name");
			String query = """
			   create table emp2 
			   as select * from emp
			""";
			
			System.out.println("query : " + query);
			
			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString(1, name);
			
			// SQL 실행 -> ResultSet 으로 결과 확보
			int result = ps.executeUpdate(); // ctrl + enter ( 실행문 )
			System.out.println("create table result : " + result);

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클래스 예외");
		}
	}

}
