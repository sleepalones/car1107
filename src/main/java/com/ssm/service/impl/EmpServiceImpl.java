package com.ssm.service.impl;

import com.ssm.dao.EmpMapper;
import com.ssm.domain.Emp;
import com.ssm.domain.EmpExample;
import com.ssm.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 铭鸽鸽
 * @create 2020/6/14 23:01
 */
@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    private EmpMapper empMapper;

    @Override
    public List<Emp> getAll() {
        return empMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    @Override
    public boolean checkUser(String empName) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = empMapper.countByExample(example);
        return count == 0;
    }
}
