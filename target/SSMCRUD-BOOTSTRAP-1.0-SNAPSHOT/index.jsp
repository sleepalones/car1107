<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>员工列表</title>
    <base href="<%=basePath%>">
    <style type="text/css">
        .myposition{
            position: relative;
            left: 50px;
        }
    </style>
    <!--引入bootstrap样式和jquery-->
    <script type="text/javascript" src="<%=basePath%>static/jquery/jquery-3.3.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>static/bootstrap3/css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>static/bootstrap3/js/bootstrap.min.js"></script>
</head>
<body>
    <!--新增会员的模态框-->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="insertModalLabel">新增员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="张三">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">邮政编码</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="zhangsan@ssm.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">员工性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" checked="checked" id="gender_m" value="M"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_f" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">部门名称</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="deptId" id="dept_add_select">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!--修改会员的模态框-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="updateModalLabel">修改会员</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="update_name">真实姓名</label>
                            <input type="text" value="弟中弟" class="form-control" id="update_name" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="update_birth">出生日期</label>
                            <input type="text" value="2000-8-15" class="form-control" id="update_birth" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="update_phone">电话号码</label>
                            <input type="text" value="16684488854" class="form-control" id="update_phone" placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="update_address">详细地址</label>
                            <input type="text" value="宁夏回族自治区无名区大学西路152号楼330房" class="form-control" id="update_address" placeholder="">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!--删除会员的模态框-->
    <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="deleteModalLabel">确定要删除么？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger">确定</button>
                </div>
            </div>
        </div>
    </div>


    <!--页头-->
    <div class="myposition">
        <div class="page-header">
            <h1>SSM＿CRUD <small>信息维护</small></h1>
        </div>
    </div>
    <!--按钮组-->
    <div class="col-md-10 col-md-offset-10">
        <button class="btn btn-info" id="emp_add_model_btn">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button class="btn btn-success" id="emp_add_query">
            <span class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span>查询
        </button>
    </div>
    <!--表格-->
    <div class="myposition" style="top: 15px;">
        <table class="table table-striped" id="emps_table">
            <thead>
                <tr>
                    <th><input type="checkbox" /></th>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>邮政编码</th>
                    <th>所在部门</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <!--翻页组件-->
    <div>
        <div class="myposition col-md-6" style="top: 30px;" id="page_info_area"></div>

        <div class="col-md-6" style="top: 30px;" id="page_nav_area"></div>

        <script type="text/javascript">

            var totalRecord,currentPage;

            $(function () {
                to_page(1);
            });

            function to_page(page) {
                $.ajax({
                    url:"<%=basePath%>emps.do",
                    data:"page="+page,
                    type:"GET",
                    success:function (result) {
                        //1.解析并显示员工数据
                        build_emp_table(result);
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.解析并显示分页条数据
                        build_page_nav(result);
                    }
                })
            }

            //1.解析并显示员工数据
            function build_emp_table(result) {
                //清空table表格
                $("#emps_table tbody").empty();
                var emps = result.dataMap.pageInfo.list;
                $.each(emps,function(index,item){
                    var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender==='M'?"男":"女");
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.dept.deptName);
                    /**
                     <button class="">
                     <span class="" aria-hidden="true"></span>
                     编辑
                     </button>
                     */
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                    //为编辑按钮添加一个自定义的属性，来表示当前员工id
                    editBtn.attr("edit-id",item.empId);
                    var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                    //为删除按钮添加一个自定义的属性来表示当前删除的员工id
                    delBtn.attr("del-id",item.empId);
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    //var delBtn =
                    //append方法执行完成以后还是返回原来的元素
                    $("<tr></tr>").append(checkBoxTd)
                        .append(empIdTd)
                        .append(empNameTd)
                        .append(genderTd)
                        .append(emailTd)
                        .append(deptNameTd)
                        .append(btnTd)
                        .appendTo("#emps_table tbody");
                });
            }
            //2.解析并显示分页信息
            function build_page_info(result) {
                $("#page_info_area").empty();
                $("#page_info_area").append("当前"+result.dataMap.pageInfo.pageNum+"页,总"+
                    result.dataMap.pageInfo.pages+"页,总"+
                    result.dataMap.pageInfo.total+"条记录");
                //totalRecord = result.dataMap.pageInfo.total;
                currentPage = result.dataMap.pageInfo.pageNum;
            }
            //3.解析并显示分页条数据
            function build_page_nav(result) {
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination");

                //构建元素
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if(result.dataMap.pageInfo.hasPreviousPage === false){
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                }else{
                    //为元素添加点击翻页的事件
                    firstPageLi.click(function(){
                        to_page(1);
                    });
                    prePageLi.click(function(){
                        to_page(result.dataMap.pageInfo.pageNum -1);
                    });
                }

                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                if(result.dataMap.pageInfo.hasNextPage === false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else{
                    nextPageLi.click(function(){
                        to_page(result.dataMap.pageInfo.pageNum +1);
                    });
                    lastPageLi.click(function(){
                        to_page(result.dataMap.pageInfo.pages);
                    });
                }

                //添加首页和前一页 的提示
                ul.append(firstPageLi).append(prePageLi);
                //1,2，3遍历给ul中添加页码提示
                $.each(result.dataMap.pageInfo.navigatepageNums,function(index,item){

                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if(result.dataMap.pageInfo.pageNum === item){
                        numLi.addClass("active");
                    }
                    numLi.click(function(){
                        to_page(item);
                    });
                    ul.append(numLi);
                });
                //添加下一页和末页 的提示
                ul.append(nextPageLi).append(lastPageLi);

                //把ul加入到nav
                var navEle = $("<nav></nav>").append(ul);
                navEle.appendTo("#page_nav_area");
            }

            //清空表单样式及内容
            function reset_form(ele){
                $(ele)[0].reset();
                //清空表单样式
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");
            }

            //点击新增按钮弹出模态框
            $("#emp_add_model_btn").click(function () {
                //清除表单数据（表单完整重置（表单的数据，表单的样式））
                reset_form("#addModal form");
                getDepts("#addModal select");
                $("#addModal").modal({
                    backdrop:"static"
                });
            });

            //查出所有的部门信息并显示在下拉列表中
            function getDepts(ele) {
                $.ajax({
                    url:"<%=basePath%>depts.do",
                    type:"GET",
                    success:function (result) {
                        $.each(result.dataMap.depts,function(){
                            var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                            optionEle.appendTo(ele);
                        });
                    }
                })
            }

            //校验表单数据
            function validate_add_form(){
                //1、拿到要校验的数据，使用正则表达式
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if(!regName.test(empName)){
                    //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    return false;
                }else{
                    show_validate_msg("#empName_add_input", "success", "");
                };

                //2、校验邮箱信息
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if(!regEmail.test(email)){
                    //alert("邮箱格式不正确");
                    //应该清空这个元素之前的样式
                    show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
                    /* $("#email_add_input").parent().addClass("has-error");
                    $("#email_add_input").next("span").text("邮箱格式不正确"); */
                    return false;
                }else{
                    show_validate_msg("#email_add_input", "success", "");
                }
                return true;
            }

            //显示校验结果的提示信息
            function show_validate_msg(ele,status,msg){
                //清除当前元素的校验状态
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                }else if("error" == status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            //校验用户名是否可用
            $("#empName_add_input").change(function(){
                //发送ajax请求校验用户名是否可用
                var empName = this.value;
                $.ajax({
                    url:"<%=basePath%>checkuser.do",
                    data:"empName="+empName,
                    type:"POST",
                    success:function(result){
                        if(result.code==200){
                            show_validate_msg("#empName_add_input","success","用户名可用");
                            $("#emp_save_btn").attr("ajax-va","success");
                        }else{
                            show_validate_msg("#empName_add_input","error",result.dataMap.va_msg);
                            $("#emp_save_btn").attr("ajax-va","error");
                        }
                    }
                });
            });

            //保存
            $("#emp_save_btn").click(function () {
                if(!validate_add_form()){
                    return false;
                };
                if($(this).attr("ajax-va")==="error"){
                    return false;
                }
                $.ajax({
                    url: "<%=basePath%>emps.do",
                    type: "POST",
                    data: $("#addModal form").serialize(),
                    success: function (result) {
                        if(result.code == 200){
                            //员工保存成功；
                            //1、关闭模态框
                            $("#addModal").modal('hide');
                        }else{
                            //显示失败信息
                            //console.log(result);
                            //有哪个字段的错误信息就显示哪个字段的；
                            if(undefined !== result.dataMap.errorFields.email){
                                //显示邮箱错误信息
                                show_validate_msg("#email_add_input", "error", result.dataMap.errorFields.email);
                            }
                            if(undefined !== result.dataMap.errorFields.empName){
                                //显示员工名字的错误信息
                                show_validate_msg("#empName_add_input", "error", result.dataMap.errorFields.empName);
                            }
                        }
                    }
                });

            });

            //添加完成之后点击查询跳转到最后一页展示刚刚添加的数据
            $("#emp_add_query").click(function () {
                $.ajax({
                    url: "<%=basePath%>emps.do",
                    type: "GET",
                    success: function (result) {
                        totalRecord = result.dataMap.pageInfo.pages;
                        to_page(totalRecord);
                    }
                });
            })

        </script>

    </div>
</body>
</html>
