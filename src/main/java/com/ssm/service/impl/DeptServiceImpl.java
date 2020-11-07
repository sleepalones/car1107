package com.ssm.service.impl;

import com.ssm.dao.DeptMapper;
import com.ssm.domain.Dept;
import com.ssm.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 铭鸽鸽
 * @create 2020/6/16 12:09
 */
@Service
public class DeptServiceImpl implements DeptService {

    @Resource
    private DeptMapper deptMapper;

    @Override
    public List<Dept> getDepts() {
        return deptMapper.selectByExample(null);
    }
}
