package com.pc.emp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.pc.emp.dto.Employee;
import com.pc.emp.dto.Role;

public class EmpRepositoryJDBC implements EmpRepository {
	public EmpRepositoryJDBC() {
	}

	@Override // 아이디 조회
	public Employee findByUserId(String userId) {
		Employee empolyee = null;
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		String sql = "SELECT * FROM staff WHERE userId = ?";
		System.out.println(sql);
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			System.out.println("userId: " + userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				empolyee = new Employee();
				empolyee.setUserId(rs.getString("userId"));
				empolyee.setPassword(rs.getString("password"));
				System.out.println("rs.getString(password): " + rs.getString("password"));
				empolyee.setName(rs.getString("sname"));
				String roleStr = rs.getString("role");
				Role role = Role.fromString(roleStr);
				empolyee.setRole(role);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return empolyee;
	}

	@Override // 직원 목록 조회 메소드
	public List<Employee> getEmpList(Employee employee) {
		// DB 호출
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		List<Employee> empList = new ArrayList<Employee>();
		// sql문 작성
		String sql = "SELECT * FROM staff WHERE lower(sname) LIKE '%' || lower(?) || '%' ORDER BY sname ASC";
		System.out.println(sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, employee.getName());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setEmpno(rs.getInt("staffno"));
				emp.setName(rs.getString("sname"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setDuty(rs.getString("sduty"));
				emp.setSal(rs.getInt("sal"));
				emp.setDeptno(rs.getInt("offino"));
				empList.add(emp);
			}
			System.out.println(empList);

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	public Employee getEmp(int empno) {
		// DB 호출
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		Employee emp = null;
		// sql문 작성
		String sql = "SELECT * FROM staff WHERE staffno = ?";
		System.out.println(sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empno);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				emp = new Employee();
				emp.setEmpno(rs.getInt("staffno"));
				emp.setName(rs.getString("sname"));
				emp.setDuty(rs.getString("sduty"));
				emp.setSal(rs.getInt("sal"));
				emp.setDeptno(rs.getInt("offino"));

				System.out.println(rs.getInt("staffno"));
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

	public boolean addEmp(Employee emp) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		// SQL INSERT 문
		String sql = "INSERT INTO staff (staffno, sname, hiredate, sduty, sal, offino) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, emp.getEmpno());
			ps.setString(2, emp.getName());
			ps.setDate(3, new Date(emp.getHiredate().getTime())); // java.util.Date를 java.sql.Date로 변환
			ps.setString(4, emp.getDuty());
			ps.setInt(5, emp.getSal());
			ps.setInt(6, emp.getDeptno());
			int result = ps.executeUpdate(); // SQL 실행
			ps.close();
			con.close();
			return result > 0; // 삽입 성공 여부 반환 (성공하면 true, 실패하면 false)
		} catch (SQLException e) {
			e.printStackTrace();
			return false; // 예외 발생 시 실패로 처리
		}
	}

	// 수정
	public boolean updateEmp(Employee employee) {
		try {
			EmpDAO empDAO = new EmpDAO();
			Connection con = empDAO.getConn();
			String sql = "UPDATE staff SET sname=?, sduty=?, sal=?, offino=? WHERE staffno=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, employee.getName());
			ps.setString(2, employee.getDuty());
			ps.setInt(3, employee.getSal());
			ps.setInt(4, employee.getDeptno());
			ps.setInt(5, employee.getEmpno());
			int result = ps.executeUpdate();
			ps.close();
			con.close();
			return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteEmp(int empno) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    boolean isDeleted = false;

	    try {
	    	EmpDAO empDAO = new EmpDAO();
			conn = empDAO.getConn();
	        String sql = "DELETE FROM staff WHERE staffno = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, empno);

	        int rowsAffected = pstmt.executeUpdate();
	        isDeleted = rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return isDeleted;
	}

	public boolean isEmpNumberExist(int empNumber) {
		EmpDAO empDAO = new EmpDAO();
		Connection con = empDAO.getConn();
		String sql = "SELECT COUNT(staffno) FROM staff WHERE staffno = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, empNumber);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count > 0;
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
