package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.domain.Emp;
import com.ssm.domain.InfoDataJson;
import com.ssm.service.EmpService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 铭鸽鸽
 * @create 2020/6/14 22:57
 * 处理员工CRUD请求
 */
@Controller
public class EmpController {

    @Resource
    private EmpService empService;

    @ResponseBody
    @RequestMapping(value = "/checkuser.do",method = RequestMethod.POST)
    public InfoDataJson checkuser(@RequestParam("empName")String empName){
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return InfoDataJson.fail().addData("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }

        //数据库用户名重复校验
        boolean b = empService.checkUser(empName);
        if(b){
            return InfoDataJson.success();
        }else{
            return InfoDataJson.fail().addData("va_msg", "用户名不可用");
        }
    }

    @RequestMapping(value = "/emps.do",method = RequestMethod.POST)
    @ResponseBody
    public InfoDataJson saveEmp(Emp emp){
        empService.saveEmp(emp);
        return InfoDataJson.success();
    }


    @RequestMapping(value = "/emps.do",method = RequestMethod.GET)
    @ResponseBody
    public InfoDataJson getEmpsWithJson(@RequestParam(value = "page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,5);
        //分页查询
        List<Emp> empAll = empService.getAll();
        //使用PageInfo包装查询后的结果
        PageInfo<Emp> pageInfo = new PageInfo<>(empAll,8);
        return InfoDataJson.success().addData("pageInfo",pageInfo);
    }

    /**
     * 查询员工数据（分页查询）
     * @return
     */
    //@RequestMapping("/emps.do")
    public String getEmps(@RequestParam(value = "page",defaultValue = "1") Integer page, Model model){
        //引入PageHelper插件
        PageHelper.startPage(page,6);
        //分页查询
        List<Emp> empAll = empService.getAll();
        //使用PageInfo包装查询后的结果
        PageInfo<Emp> pageInfo = new PageInfo<>(empAll,8);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }

}
