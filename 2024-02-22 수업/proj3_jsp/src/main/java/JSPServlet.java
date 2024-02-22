
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jsp")
public class JSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		// 이건 브라우저 자체를 옮겨
//		response.sendRedirect("param.jsp?id=" + id);
		
		// 이건 브라우저는 그대로 두고 출력내용만 바뀜
//		request.getRequestDispatcher("param.jsp?id=" + id).forward(request, response);
//		request.getRequestDispatcher("param.jsp").forward(request, response);
		
		request.setAttribute("id2", id);
				
		List<String> list = new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("3");
		request.setAttribute("list", list);
		request.getRequestDispatcher("param.jsp").forward(request, response);
	}

}
