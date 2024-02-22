package org.zerock.w1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sample")
public class SampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SampleServlet() {
		System.out.println("생성자 실행");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 실행");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet 실행");
		
		response.setContentType("text/html"); // HTML 형식으로 응답을 설정

//		response.getWriter().append("Served at: ").append(request.getContextPath());

		PrintWriter out = response.getWriter();
		out.println("<form method='post' action='post.html'>");
		out.println("<h1 id='h1'>");
		out.print("hello servlet");
		out.println("</h1>");
		out.print("<button type='submit' class='btn'>버튼</button>");
		out.println("</form>");
		
		out.print("<script>");
		out.print(
				"document.querySelector('.btn').addEventListener('click', function() {document.querySelector('#h1').innerHTML += 'click';})");
//		out.print("for(let i=0; i<=5; i++){for(let j=0; j<=i; j++){document.write('*')}document.write('<br>') }");
		out.print("</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost 실행");
		doGet(request, response);
	}

}
