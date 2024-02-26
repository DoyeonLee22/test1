package doyeon;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/setting")
public class Setting extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 깨짐 방지
				try {
					request.setCharacterEncoding("utf-8");
					response.setContentType("text/html; charset=utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}

				// 전달받은 값(Parameter) 확보
				String num = request.getParameter("num");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writer = request.getParameter("writer");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
				java.util.Date utilDate = null;
				System.out.println(request.getParameter("wdate"));
				try {
					utilDate = sdf.parse(request.getParameter("wdate"));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Date wDate = new Date(utilDate.getTime());
				
				int hits = Integer.parseInt(request.getParameter("hits"));

				// empDTO 에 담아서 보내기
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setNum(num);
				boardDTO.setTitle(title);
				boardDTO.setContent(content);
				boardDTO.setWriter(writer);
				boardDTO.setWdate(wDate);
				boardDTO.setHits(hits);

				// DB 담당에게 전달하고
				BoardDAO boardDAO = new BoardDAO();

				List<Object> list = boardDAO.selectEmp(boardDTO);
				
				System.out.println(((BoardDTO)list.get(0)).getNum());
				System.out.println(((BoardDTO)list.get(0)).getTitle());
				System.out.println(((BoardDTO)list.get(0)).getContent());
				System.out.println(((BoardDTO)list.get(0)).getWriter());
				System.out.println(((BoardDTO)list.get(0)).getWdate());
				System.out.println(((BoardDTO)list.get(0)).getHits());

				// view 담당에게 전달
				request.setAttribute("list", list);
				request.getRequestDispatcher("boardTable.jsp").forward(request, response);
				
				
			}

			protected void doPost(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
//				// 한글 깨짐 방지
//				System.out.println(request.getAttribute("title"));
//				System.out.println(request.getAttribute("content"));
//				
//				String title = (String)request.getAttribute("title");
//				String content = (String)request.getAttribute("content");
//				String writer = (String)request.getAttribute("writer");
//				
//				long currentTimeMillis = System.currentTimeMillis();
//				Date date = new Date(currentTimeMillis);
//				
//
//				
//				BoardDTO boardDTO = new BoardDTO();
//				boardDTO.setEname(ename);
//				boardDTO.setEmpno(empno);
//				
//				BoardDAO boardDAO = new BoardDAO();
//				int result = boardDAO.updateEmp2(boardDTO);
//				System.out.println("업데이트 결과 : " + result);
//				
//				response.sendRedirect("emp");
////				doGet(request, response);
				
		
	}

}
