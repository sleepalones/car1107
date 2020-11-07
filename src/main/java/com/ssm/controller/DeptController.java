package com.ssm.controller;

import com.ssm.domain.Dept;
import com.ssm.domain.InfoDataJson;
import com.ssm.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 铭鸽鸽
 * @create 2020/6/16 12:08
 */
@Controller
public class DeptController {

    @Resource
    private DeptService deptService;

    /**
     * 返回所有部门信息
     */
    @RequestMapping("/depts.do")
    @ResponseBody
    public InfoDataJson getDepts(){
        List<Dept> depts = deptService.getDepts();
        return InfoDataJson.success().addData("depts",depts);
    }
}
