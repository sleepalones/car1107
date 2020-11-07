package com.ssm;

import com.github.pagehelper.PageInfo;
import com.ssm.domain.Emp;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.List;


/**
 * @author 铭鸽鸽
 * @create 2020/6/14 23:19
 * 使用Spring测试模块提供测试请求功能，测试curd请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:dispatcherServlet.xml"})
public class MvcTest {

    //传入SpringMVC的ioc
    @Resource
    private WebApplicationContext context;

    //虚拟mvc请求，获取到处理结果
    private MockMvc mockMvc;

    @Before
    public void initMockMvc(){

        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.
                get("/emps.do").param("page", "5")).andReturn();

        //请求成功以后，请求域中会有pageInfo：我们可以取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + attribute.getPageNum());
        System.out.println("总页码：" + attribute.getPages());
        System.out.println("总记录数：" + attribute.getTotal());
        System.out.println("在页面需要连续显示的页码：");
        int[] nums = attribute.getNavigatepageNums();
        for (int num : nums) {
            System.out.println("  " + num);
        }
        List<Emp> lists = attribute.getList();
        for (Emp list : lists) {
            System.out.println("ID:" + list.getEmpId() + "====>Name:" + list.getEmpName());
        }

    }

}
