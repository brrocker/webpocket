<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.webpocket.commonservice.Constants"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/pages.css">
	
	<script type='text/javascript' src='dwr/engine.js'></script>
	<script type='text/javascript' src='dwr/util.js'></script>
	<script type='text/javascript' src='dwr/interface/Text.js'></script>
	<script type='text/javascript' src='dwr/interface/Account.js'></script>
	<script type="text/javascript" src="jslib/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="jslib/json2.js"></script>
	
    <script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/main.js"></script>	
	<title>网络小口袋</title>
</head>

<%
String accountid = (String)session.getAttribute(Constants.SESSION_ID);
String username = (String)session.getAttribute(Constants.SESSION_NAME);
%>
<script>
var accountid = "<%= accountid%>";
var username = "<%= username%>";
if(accountid == "null") {
	window.location.href = "index.jsp";
}
</script>
<body>
<div id="header_box">
	<div id="header">
    	<!-- menu options-->
        <div class="menu_item">记事本</div>
        <div class="menu_item">文件夹</div>
        <div class="menu_item">每日计划</div>
        <div class="menu_item">日程表</div>
        <!--options end-->
        <div id="logout">注销</div>
        <div id="welcome">享受这一天吧，<%= username%> !</div>
    </div>
</div>
<div id="center_box">
    
    <!--navi-->
    <div style="margin-top:10px;">
    <div id="add" class="button_S" style="margin-left:20px;">添加</div>
    </div>
    <div id="textnavbox" style="margin-top:10px;"></div>
    <div class="clearfloat"></div>
    
    <div id="hint" style="margin-top:5px;">提示: 1.ctrl+s 可以即时保存 2.点击文档名称可以更改,回车提交更改 3.删除的功能暂未完成：）</div>
    <div style="margin-left:200px;height:20px;"><span id='message' style="color:#F00;display:none;">保存成功!</span></div>
    <div id="edittextname"><div id="textnametop" class="floatL"></div><div id="save" class="button_S floatL" style="margin-left:400px;margin-bottom:5px;">保存</div>
    <div class="clearfloat"></div>
    </div>
    
    <!--editbox-->
    <div id="editbox">
    <textarea id="editarea"></textarea>
    </div>
    
    <div class="clearfloat"></div>
    
</div>
</body>
</html>