package com.pc.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.pc.emp.dao.EmpRepositoryJDBC;
import com.pc.emp.dto.Employee;

@WebServlet("/emp")
public class EmpServlet extends HttpServlet {
	private Gson gson = new Gson();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String action = request.getParameter("action");
		if ("search".equals(action)) {
			searchEmployee(request, response);
		} else if ("list".equals(action)) {
			listEmployees(request, response); // AJAX를 통한 조회 요청 처리
		} else if ("edit".equals(action)) {
			editEmployeeGet(request, response); // 수정된 메서드 이름으로 변경
		} else if ("delete".equals(action)) {
			deleteEmployee(request, response);
		} else {
			// 알 수 없는 액션에 대한 처리
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().print(gson.toJson("알 수 없는 동작 요청"));
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String empNumberStr = request.getParameter("empNumber");
		String ename = request.getParameter("ename");
		String hireDateStr = request.getParameter("hireDate");
		String job = request.getParameter("job");
		String salStr = request.getParameter("sal");
		String deptnoStr = request.getParameter("deptno");

		if (empNumberStr == null || empNumberStr.trim().isEmpty() || ename == null || ename.trim().isEmpty()
				|| hireDateStr == null || hireDateStr.trim().isEmpty() || job == null || job.trim().isEmpty()
				|| salStr == null || salStr.trim().isEmpty() || deptnoStr == null || deptnoStr.trim().isEmpty()) {

			response.sendRedirect("empmgmt.jsp?error=잘못된 입력 입니다.");
			return;
		}

		try {
			int empNumber = Integer.parseInt(empNumberStr);
			int sal = Integer.parseInt(salStr);
			int deptno = Integer.parseInt(deptnoStr);
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsedDate = dateFormat.parse(hireDateStr);
			Date hireDate = new Date(parsedDate.getTime());

			Employee employee = new Employee();
			employee.setEmpno(empNumber);
			employee.setName(ename);
			employee.setDuty(job);
			employee.setSal(sal);
			employee.setDeptno(deptno);
			employee.setHiredate(hireDate);

			EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();

			if (empRepo.isEmpNumberExist(empNumber)) {
			    request.setAttribute("errorMessage", "직원 번호가 이미 존재합니다.");
			    RequestDispatcher dispatcher = request.getRequestDispatcher("/empmgmt.jsp");
			    dispatcher.forward(request, response);
			    return;
			}
			
			boolean result = empRepo.addEmp(employee);
			if (result) {
				// 데이터가 성공적으로 추가되었다면, 사용자를 직원 목록 페이지로 리디렉션합니다.
				response.sendRedirect(request.getContextPath() + "/empmgmt.jsp");
			} else {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 삽입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 요청 데이터");
		}

	}

	private void editEmployeeGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 쿼리 파라미터에서 정보 추출
		int empno = Integer.parseInt(request.getParameter("empno"));
		String name = request.getParameter("name");
		String duty = request.getParameter("duty");
		int sal = Integer.parseInt(request.getParameter("sal"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));

		// JDBC를 사용하여 직원 정보 가져오기 및 수정
		EmpRepositoryJDBC repository = new EmpRepositoryJDBC();
		Employee currentEmployee = repository.getEmp(empno);

		// 수정된 필드가 있는 경우에만 업데이트
		if (name != null)
			currentEmployee.setName(name);
		if (duty != null)
			currentEmployee.setDuty(duty);
		if (sal > 0)
			currentEmployee.setSal(sal);
		if (deptno > 0)
			currentEmployee.setDeptno(deptno);

		boolean success = repository.updateEmp(currentEmployee);

		// 응답 설정: JSON 형식으로 성공 또는 실패 응답
		PrintWriter out = response.getWriter();
		if (success) {
			out.print("{\"success\":true}");
		} else {
			out.print("{\"success\":false}");
		}
		out.flush();
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		try {
			int empno = Integer.parseInt(request.getParameter("empno"));
			EmpRepositoryJDBC repository = new EmpRepositoryJDBC();
			boolean isDeleted = repository.deleteEmp(empno);

			if (isDeleted) {
				// 삭제 성공 응답
				out.print("{\"success\": true}");
			} else {
				// 삭제 실패 응답
				out.print("{\"success\": false, \"message\": \"직원을 찾지 못했거나 직원 삭제에 실패했습니다.\"}");
			}
		} catch (NumberFormatException e) {
			// 잘못된 파라미터 형식으로 인한 예외 처리
			out.print("{\"success\": false, \"message\": \"잘못된 직원 번호 형식.\"}");
		} catch (Exception e) {
			// 기타 예외 처리
			out.print("{\"success\": false, \"message\": \"삭제 중에 오류가 발생했습니다.\"}");
		} finally {
			out.flush();
		}
	}

	private void searchEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int empno = Integer.parseInt(request.getParameter("empno"));
		EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();
		Employee employee = empRepo.getEmp(empno); // 데이터베이스에서 직원 정보 조회

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		if (employee != null) {
			// 직원 정보를 JSON 형태로 변환
			String json = new Gson().toJson(employee);
			out.print(json);
		} else {
			// 직원 정보가 없는 경우, 적절한 JSON 응답
			out.print("{}");
		}
		out.flush();
	}

	private void listEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && "ADMIN".equals(session.getAttribute("role"))) {
			EmpRepositoryJDBC empRepo = new EmpRepositoryJDBC();
			List<Employee> empList = empRepo.getEmpList(new Employee());

			// 날짜 형식을 '년-월-일'로 설정하는 Gson 인스턴스 생성
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

			String json = gson.toJson(empList);
			response.getWriter().print(json);
		} else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().print(gson.toJson("로그인이 필요합니다."));
		}
	}
}