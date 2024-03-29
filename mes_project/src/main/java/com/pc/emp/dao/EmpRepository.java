package com.pc.emp.dao;

import java.util.List;

import com.pc.emp.dto.Employee;

public interface EmpRepository {
    Employee findByUserId(String userId);
    public List<Employee> getEmpList(Employee employee);
    
    // 메서드 추가 가능
}
