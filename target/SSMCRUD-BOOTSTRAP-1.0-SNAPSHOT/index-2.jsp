<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="emps.do" />
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <!--引入bootstrap样式和jquery-->
    <script type="text/javascript" src="static/jquery/jquery-3.3.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="static/bootstrap3/css/bootstrap.min.css" />
    <script type="text/javascript" src="static/bootstrap3/js/bootstrap.min.js"></script>
</head>
<body>
    <button type="button" class="btn btn-success">按钮</button>
</body>
</html>
