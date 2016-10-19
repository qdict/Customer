<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>修改密码</title>
		<!-- CSS -->
		
		<link rel="stylesheet" href="css/login-css/supersized.css">
		<link rel="stylesheet" href="css/login-css/login.css">
		<link href="css/login-css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script src="js/html5.js"></script>
		<![endif]-->
		<script src="js/login-js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/login-js/jquery.form.js"></script>
		<script type="text/javascript" src="js/login-js/tooltips.js"></script>
		<script type="text/javascript" src="js/login-js/login.js"></script>
		<script type=text/javascript>
			function updatamima(){
				var Password=$("#password").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				
				if(Password=='' || Password==null){
					alert("系统提示,用户原密码不能为空！");
					return false;
				}
				if(newPassword=='' || newPassword==null){
					alert("系统提示,新密码不能为空！");
					return false;
				}
				if(newPassword2=='' || newPassword2==null){
					alert("系统提示,确认密码不能为空！");
					return false;
				}
				if(newPassword!=newPassword2){
					alert("系统提示,两次密码不一致！");
					return false;
				}
				if(newPassword==newPassword2){
					alert("系统提示,修改密码成功，下次登录有效。。。。");
					$("#update_form").submit();
					return false;
				}
			 }
			
			
		</script>
	</head>
	<body>
		<div class="page-container">
			<div class="main_box">
				<div class="login_box">
					<div class="login_logo">
						<font size="8px" color="bred">修改密码</font>
					</div>
				
					<div class="login_form">
						<form action="${pageContext.request.contextPath}/updatamima.do?userid=${selectmima.userid}" id="update_form"  method="post">
							<div class="form-group">
								<label for="j_username" class="t"><font size="5px" color="bred">用 户 名:</font></label> 
								<input id="email" value="${selectmima.email}" name="email" readonly="readonly" type="text" class="form-control x319 in" 
								/>
							</div>
							<div class="form-group">
								<label for="j_password" class="t"><font size="5px" color="bred">原 密 码:</font></label> 
								<input id="password"  value="${selectmima.password}" name="password" type="text" 
								class="password form-control x319 in">
							</div>
							<!-- 新密码 -->
							<div class="form-group">
								<label for="j_password" class="t"><font size="5px" color="bred">新 密 码:</font></label> 
								<input id="newPassword" value="" name="newpassword" type="password" 
								class="password form-control x319 in">
							</div>
							<div class="form-group">
								<label for="j_password" class="t"><font size="5px" color="bred">确认密码:</font></label> 
								<input id="newPassword2" value="" name="newPassword2" type="password" 
								class="password form-control x319 in">
							</div>
							<div class="form-group space">
								<label class="t"></label>　　　
								<button type="submit" id="updatemm_btn" class="btn btn-success" onclick="return updatamima();">确认修改</button>
								<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-warning">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Javascript -->
		
		<script src="js/login-js/supersized.3.2.7.min.js"></script>
		<script src="js/login-js/supersized-init.js"></script>
		<script src="js/login-js/scripts.js"></script>
		<script type="text/javascript" src="js/yzm/jQuery.js"></script>
   		<script type="text/javascript" src="js/yzm/verifyCode.js"></script>
	</body>
</html>