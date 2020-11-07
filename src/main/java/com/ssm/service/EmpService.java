package com.ssm.service;

import com.ssm.domain.Emp;

import java.util.List;

/**
 * @author 铭鸽鸽
 * @create 2020/6/14 23:00
 */
public interface EmpService {
    /**
     * 查询所有员工信息
     * @return
     */
    List<Emp> getAll();

    void saveEmp(Emp emp);

    boolean checkUser(String empName);
}
