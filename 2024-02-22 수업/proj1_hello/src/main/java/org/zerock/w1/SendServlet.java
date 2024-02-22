package org.zerock.w1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FirstServlet doGet 실행");
		
		response.sendRedirect("second"); // first 들어가면 second 로 바뀜( 주소창 )
		
//		request.getRequestDispatcher("/WEB-INF/todo/list.jsp").forward(request, response);
	}
}
