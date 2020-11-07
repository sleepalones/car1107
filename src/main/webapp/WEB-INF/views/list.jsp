<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h4 class="modal-title" id="insertModalLabel">新增会员</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="insert_name">真实姓名</label>
                            <input type="text" class="form-control" id="insert_name" placeholder="请输入姓名">
                        </div>
                        <div class="form-group">
                            <label for="insert_birth">出生日期</label>
                            <input type="text" class="form-control" id="insert_birth" placeholder="请选择出生日期">
                        </div>
                        <div class="form-group">
                            <label for="insert_phone">电话号码</label>
                            <input type="text" class="form-control" id="insert_phone" placeholder="请输入电话号码">
                        </div>
                        <div class="form-group">
                            <label for="insert_address">详细地址</label>
                            <input type="text" class="form-control" id="insert_address" placeholder="请输入详细地址">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">保存</button>
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#delModal">
            <span class="glyphicon glyphicon-zoom-out" aria-hidden="true"></span>查询
        </button>
    </div>
    <!--表格-->
    <div class="myposition" style="top: 15px;">
        <table class="table table-striped">
            <tr>
                <th><input type="checkbox" /></th>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>员工性别</th>
                <th>邮政编码</th>
                <th>所在部门</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td><input type="checkbox" /></td>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.gender=="M"?"男":"女"}</td>
                    <td>${emp.email}</td>
                    <td>${emp.dept.deptName}</td>
                    <td>
                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editModal">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delModal">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <!--翻页组件-->
    <div>
        <div class="myposition col-md-6" style="top: 30px;">
            当前${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
        </div>

        <div class="col-md-6" style="top: 30px;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--当前页是第一页--%>
                    <c:if test="${pageInfo.isFirstPage == true}">
                        <li><a href="#">首页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.isFirstPage == false}">
                        <li><a href="<%=basePath%>emps.do?page=1">首页</a></li>
                    </c:if>
                    <%--如果有上一页，则显示下一页符号，并设置跳转参数--%>
                    <c:if test="${pageInfo.hasPreviousPage == true}">
                        <li>
                            <a href="<%=basePath%>emps.do?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="<%=basePath%>emps.do?page=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                        <%--如果有下一页，则显示下一页符号，并设置跳转参数--%>
                        <c:if test="${pageInfo.hasNextPage == true}">
                            <li>
                                <a href="<%=basePath%>emps.do?page=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <%--当前页是第最后一页--%>
                        <c:if test="${pageInfo.isLastPage == true}">
                            <li><a href="#">尾页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.isLastPage == false}">
                            <li><a href="<%=basePath%>emps.do?page=${pageInfo.pages}">尾页</a></li>
                        </c:if>
                </ul>
            </nav>
        </div>

    </div>
</body>
</html>
