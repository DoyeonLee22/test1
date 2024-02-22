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

@WebServlet("/jdbc")
public class JdbcServlet extends HttpServlet {
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
			
			
//			String name = "S";
//			// SQL 작성
//			String query = "";
//			query += " select";
//			query += " *";
//			query += " from";
//			query += " emp";
////			query += " where ename = 'SCOTT'";
//			query += " where ename like '%' || ? || '%'";
			
//			String name = "s";
			String name = request.getParameter("name");
			String query = """
			   select * from emp
			    where lower(ename) LIKE '%' || lower(?) || '%'
			    """;
			
			System.out.println("query : " + query);
			
			// SQL 실행 준비
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			
			// SQL 실행 -> ResultSet 으로 결과 확보
			ResultSet rs = ps.executeQuery(); // ctrl + enter ( 실행문 )
			
			// select -> executeQuery()
			//		return : ResultSet
			// 그 외   -> executeUpdate()
			//		return : int -> 몇개의 row 가 영향을 받았는지
			
			// DB 값을 활용 ( 출력 )
			// ResultSet 에는 모든 줄이 담겨져 있음
			// 		rs.next() : 다음줄이 있는지 여부 true / false
			//		next() 실행 후에 ResultSet 에는 다음줄이 담김
			
			PrintWriter out = response.getWriter();
			out.println("<style>th {border: 1px solid #555;} td {text-align: center; border: 1px solid #555;} table {border: 1px solid #555; border-collapse: collapse; width: 800px;}</style>");
			out.println("<table><tr><th>사원번호</th><th>사원이름</th><th>입사일</th></tr>");
			while(rs.next()) {
				// getXXX(타입) / 전달인자로 컬럼명, 대소문자 구분X
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				Date hiredate = rs.getDate("hiredate");
				// 날짜 사용하고 싶으면 클래스명이 같기 때문에 java.util.Date << 이 형태로 사용해야함.
				
				System.out.println("ename : " + ename + "\nempno : " + empno + "\nhiredate : " + hiredate);
			
				out.println("<tr>");
				out.println("<td>" + empno + "</td>");
				out.println("<td>" + ename + "</div>");
				out.println("<td>" + hiredate + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
			
			
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클래스 예외");
		}

//		PrintWriter out = response.getWriter();
//		out.println("hello world!");

	}

}
