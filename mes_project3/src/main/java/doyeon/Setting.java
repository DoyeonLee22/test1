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
	
	

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
    	try {
			doServlet(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	String action = request.getParameter("action");
        if(action != null) {
            switch(action) {
                case "insert":
				try {
					insertData(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
                    break;
                case "delete":
				try {
					deleteData(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                    break;
                default:
                    // Unknown action
                    break;
            }
            
        }
		
    }
    
    private void doServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 전달받은 값(Parameter) 확보
        int seq = Integer.parseInt(request.getParameter("seq"));
        String num = request.getParameter("num");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(request.getParameter("wdate"));
        } catch (ParseException e) {
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

        // view 담당에게 전달
        request.setAttribute("list", list);
        
        // 작업이 완료되었음을 사용자에게 알리는 메시지를 작성
        String message = "작업이 성공적으로 처리되었습니다.";
        request.setAttribute("message", message);
        
        // 적절한 페이지로 포워딩
        request.getRequestDispatcher("boardTable.jsp").forward(request, response);
    }


    private void insertData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(request.getParameter("wdate"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date wDate = new Date(utilDate.getTime());
        int hits = Integer.parseInt(request.getParameter("hits"));

        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setNum(num);
        boardDTO.setTitle(title);
        boardDTO.setContent(content);
        boardDTO.setWriter(writer);
        boardDTO.setWdate(wDate);
        boardDTO.setHits(hits);

        BoardDAO boardDAO = new BoardDAO();
        try {
            boardDAO.insertSQL(boardDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("boardTable.jsp"); // 예시로 setting 페이지로 다시 이동
    }

    private void deleteData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int seq = Integer.parseInt(request.getParameter("seq"));
        
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setSeq(seq);

        BoardDAO boardDAO = new BoardDAO();
        try {
            boardDAO.deleteSQL(boardDTO);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("boardTable.jsp"); // 예시로 setting 페이지로 다시 이동
    }
}
