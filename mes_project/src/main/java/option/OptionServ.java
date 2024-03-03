package option;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/option")
public class OptionServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");

		try {
			inOption(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("아무것도 못들어감");
		}
	}

	private void inOption(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, UnsupportedEncodingException, IOException {

	    Connection con = getConn();

	    int createLine = Integer.parseInt(request.getParameter("createLine"));
	    
	    int[] cLine = new int[request.getParameterValues("createLine").length];
	    for (int i = 0; i < cLine.length; i++) {
	    	cLine[i] = Integer.parseInt(request.getParameterValues("createLine")[i]);
	    }


	    String selectGrade = request.getParameter("selectGrade");
	    String[] selectGrades = request.getParameterValues("selectGrade");

	    int count = Integer.parseInt(request.getParameter("count"));
	    int[] counts = new int[request.getParameterValues("count").length];
	    for (int i = 0; i < counts.length; i++) {
	        counts[i] = Integer.parseInt(request.getParameterValues("count")[i]);
	    }
	    
	    String[] gpu = new String[selectGrades.length];
	    
	    for(int i=0; i<gpu.length; i++) {
	    	if(request.getParameter("selectGPU" + i) != null) {
	    		gpu[i] = request.getParameter("selectGPU" + i);	    		    		
	    	} else {
	    		gpu[i] = "Default";
	    	}
	    }
	    
	    String[] ssd = new String[selectGrades.length];
	    for(int i=0; i<ssd.length; i++) {
	    	if(request.getParameter("selectSSD" + i) != null) {
	    		ssd[i] = request.getParameter("selectSSD" + i);	    		    		
	    	} else {
	    		ssd[i] = "Default";
	    	}
	    }
	    
	    String[] ram = new String[selectGrades.length];
	    for(int i = 0; i < ram.length; i++) {
	        if(request.getParameter("selectRAM" + i) != null) {
	            ram[i] = request.getParameter("selectRAM" + i);	    		    		
	        } else {
	            ram[i] = "Default";
	        }
	    }

	    String[] cpu = new String[selectGrades.length];
	    for(int i = 0; i < cpu.length; i++) {
	        if(request.getParameter("selectCPU" + i) != null) {
	            cpu[i] = request.getParameter("selectCPU" + i);	    		    		
	        } else {
	            cpu[i] = "Default";
	        }
	    }

	    String[] cooler = new String[selectGrades.length];
	    for(int i = 0; i < cooler.length; i++) {
	        if(request.getParameter("select쿨러" + i) != null) {
	            cooler[i] = request.getParameter("select쿨러" + i);	    		    		
	        } else {
	            cooler[i] = "Default";
	        }
	    }

	    String[] mainboard = new String[selectGrades.length];
	    for(int i = 0; i < mainboard.length; i++) {
	        if(request.getParameter("select메인보드" + i) != null) {
	            mainboard[i] = request.getParameter("select메인보드" + i);	    		    		
	        } else {
	            mainboard[i] = "Default";
	        }
	    }

	    String[] power = new String[selectGrades.length];
	    for(int i = 0; i < power.length; i++) {
	        if(request.getParameter("select파워" + i) != null) {
	            power[i] = request.getParameter("select파워" + i);	    		    		
	        } else {
	            power[i] = "Default";
	        }
	    }

	    String query = "INSERT INTO equipment (e_sequence, e_grade, e_count, e_gpu, e_ssd, e_ram, e_cpu, e_쿨러, e_메인보드, e_파워) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement ps = con.prepareStatement(query);

	    for (int i = 0; i < selectGrades.length; i++) {

	        ps.setInt(1, cLine[i]);
	        ps.setString(2, selectGrades[i]);
	        ps.setInt(3, counts[i]);

	        // 선택된 부품만을 사용하여 쿼리 작성
	        ps.setString(4, gpu[i]);
	        ps.setString(5, ssd[i]);
	        ps.setString(6, ram[i]); 
	        ps.setString(7, cpu[i]); 
	        ps.setString(8, cooler[i]);
	        ps.setString(9, mainboard[i]);
	        ps.setString(10, power[i]);

	        int start = ps.executeUpdate();
	    }

	    ps.close();
	    con.close();
	    
	    response.sendRedirect("grade");
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
