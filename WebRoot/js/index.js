$(document).ready(function(){
	//event binder
	$("#login").click(login);
	$("#register").click(register);
	
	//frame resize
	resizeFrame();
	$(window).resize(resizeFrame);
	
	//key event
	$(document).keydown(function(e) { 
		if (e.which == 13) {
			login();
			return false;
		}		
	}) 
	
	//check cookie, auto login
	cookieLogin();
	
	function login(){
		var name = $("#name").val();
		var password = $("#password").val();
		if(name==""||password==""){
			$("#message").text("请输入用户名和密码！");
			return;
		}
		
		var func = function(data){
			data = JSON.parse(data);
			if(data.result === true) {
				saveLoginCookie(name,data.cookie);
				window.location.href = "main.jsp";
			} else {
				$("#message").text(data.message);
			}
		}
		
		Account.login(name,password,func);
	}
	
	function saveLoginCookie(name,value) {
		var cookieObj = {
			username:name,
			value:value
		}
		var cookieString = JSON.stringify(cookieObj);
		setCookie(LOGINCOOKIE,cookieString,EXPIREDAYS);
	}
	
	function cookieLogin() {
		var value = getCookie(LOGINCOOKIE);
		if(value == ""){
			return;
		} else {
			var cookieObj = JSON.parse(value);
			var func = function(data){
				if(data == "success") {
					window.location.href = "main.jsp";
				} else {
					setCookie(LOGINCOOKIE,"",0);
				}
			}
		
			Account.cookielogin(cookieObj.username,cookieObj.value,func);
		}
	}
	
	function register(){
		var name = $("#name").val();
		var password = $("#password").val();
		if(name==""||password==""){
			$("#message").text("请输入用户名和密码！");
			return;
		}
		
		var account = {
			username:name,
			password:password	
		}
		
		var func = function(data){
			data = JSON.parse(data);
			$("#message").text(data.message);
			if(data.result === true) {
				setTimeout(function(){
					login();
				},1000);
			}
		}
		
		Account.saveAccount(account,func);
	}
	
	function resizeFrame(){
		var height = $(window).height();
		var value = (height - 270)*0.4;
		$("#container").css("margin-top",value);
	}
});