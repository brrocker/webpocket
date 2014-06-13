<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.webpocket.data.service.AccountService"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网络小口袋</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
	
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/util.js'></script>
	<script type='text/javascript' src='dwr/interface/Account.js'></script>
	<script type="text/javascript" src="jslib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="jslib/json2.js"></script>
	
    <script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
  </head>
  <%
ApplicationContext ctx = WebApplicationContextUtils
			.getRequiredWebApplicationContext(this.getServletConfig()
					.getServletContext());
	AccountService accountService = (AccountService) ctx
			.getBean("accountService");
	String text = accountService.getAccontTotalCount();
%>
  <body>
    <div id="container">
    	<div id="logo"><span style="font-size:35px;color:#0f3d5e;">网络</span><span style="padding-left:10px;font-size:30px;"><h style="color:#F00;">小</h><h style="color:#F90;">口</h><h style="color:#0C0;">袋</h></span></div>
        <div id="message"></div>
        <div id="login_box">
            <div class="floatR">用户名:&nbsp;&nbsp;<input class="input_login" id="name" maxlength=25></input></div>
            <div class="floatR">密码:&nbsp;&nbsp;<input class="input_login" id="password" style="margin-top:20px;" maxlength=25></input></div>
        </div>
        <div style="margin-top:20px;" id="container_bt_1" onselectstart="return false"><a id="login" class="btn_gray_L floatL" style="margin-left:67px;">登录</a><a id="register" class="btn_blue_L floatL" style="margin-left:30px;">注册</a>
        </div>
        <div style="margin-top:10px;margin-left:20px;">提示：输入用户名，密码可以直接注册。</div>
    </div>
    <div style="position:absolute;">
    Welcome to WebPocket !! <br>
    <%=text %>
   </div>
  </body>
</html>
