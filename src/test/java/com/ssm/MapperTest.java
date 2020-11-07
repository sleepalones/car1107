package com.ssm;

import com.ssm.dao.DeptMapper;
import com.ssm.dao.EmpMapper;
import com.ssm.domain.Dept;
import com.ssm.domain.Emp;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author 铭鸽鸽
 * @create 2020/6/14 21:51
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest依赖
 * 2、@ContextConfiguration指定Spring配置文件的位置
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private DeptMapper deptMapper;

    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private SqlSession session;

    @Test
    public void testCRUD(){
        //向部门表插入数据
//        deptMapper.insertSelective(new Dept(null,"开发部"));
//        deptMapper.insertSelective(new Dept(null,"测试部"));

        //向员工表插入数据
        //empMapper.insertSelective(new Emp(null,"Jerry","M","Jerry@ssm.com",1));
        //System.out.println(deptMapper);

        //批量插入多个员工,使用可以执行批量操作的sqlSession
//        EmpMapper mapper = session.getMapper(EmpMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String uuid = UUID.randomUUID().toString().substring(0, 5)+i;
//            mapper.insertSelective(new Emp(null,uuid,"M",uuid+"@ssm.com",1));
//        }
//        System.out.println("批量完成");

        //测试查询
//        List<Emp> emps = empMapper.selectByExample(null);
//        for (Emp emp : emps) {
//            System.out.println(emp);
//        }

    }
}
