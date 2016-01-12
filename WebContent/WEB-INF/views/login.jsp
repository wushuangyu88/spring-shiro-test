<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css"
	href="css/easyui.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

<script type="text/javascript">
	var LoginAndReg;

	function login() {
		var txtUserName = $("#txtUserName");
		var txtPassword = $("#txtPassword");

		if (txtUserName.val() == "") {
			alert("请输入用户名！");
			txtUserName.focus();
			return false;
		} else if (txtPassword.val() == "") {
			alert("请输入密码！");
			txtPassword.focus();
			return false;
		} else {
			//$("#btnLogin").click(function () {
			console.info($("#txtPassword").val());
			var user = encodeSTR($("#txtUserName").val());
			var pass = encodeSTR($("#txtPassword").val());
			$.post("Login.ashx", {
				txtUsername : user,
				txtPass : pass,
			},
			function(e) {
				console.info(e);
				alert(e);
				if (e == "登录成功！") {
					window.location.href = "index.aspx";
				}
			}, "html");
			//});
		}
	}
	function encodeSTR(str) {
		var t = "";
		for (var x = 0; x < str.length; x++) {
			var a = str.charCodeAt(x);
			if (x != 0) {
				t += '|';
			}
			t += new Number(a).toString(10);
		}
		return t;
	}

	function decodeSTR(str) {
		var a1 = str.split('|');
		for (var x = 0; x < a1.length; x++) {
			a1[x] = String.fromCharCode(a1[x]);
		}
		return a1.join('');
	}

	function getsize() {
		var windowHeight = 0;
		var widowWidth = 0;
		if (typeof (window.innerHeight) == 'number') {
			windowHeight = window.innerHeight;
			widowWidth = window.innerWidth;
		} else {
			if (document.documentElement
					&& document.documentElement.clientHeight) {
				windowHeight = document.documentElement.clientHeight;
				widowWidth = document.documentElement.clientWidth;
			} else {
				if (document.body && document.body.clientHeight) {
					windowHeight = document.body.clientHeight;
					widowWidth = document.body.clientWidth;
				}
			}
		}

		return {
			width : widowWidth,
			height : windowHeight
		};
	}

	$(function() {

		$('#btnLogin').click(function() {
			login();
			return false;
		});
		//响应键盘的回车事件
		//$(this).keydown(function (event) {
		//    if (event.keyCode == 13) {
		//        event.returnValue = false;
		//        event.cancel = true;
		//        return login();
		//    }
		//});
		//$('#txtorgcode').combobox({
		//    data:orgdata,valueField:'id',textField:'text',panelHeight:'300',width:160
		//})
	})
</script>
</head>
<body>
	<div id="LoginCircle">
		<div id="LoginDoc">
			<div id="SysName"></div>

			<form id="LoginFrom" method="post">
				<div id="SysInput">
					<!--<ul>
                    <li>单位代码：</li>
                    <li>
                        <input id="txtorgcode" name="orgcode" value="" type="text" class="InputStyle" maxlength="18" /></li>
                </ul>-->
					<ul>
						<li>用户名：</li>
						<li><input id="txtUserName" name="username" value=""
							type="text" class="InputStyle" maxlength="18" /></li>
					</ul>
					<ul>
						<li>密&nbsp;&nbsp;&nbsp;码：</li>
						<li><input name="password" type="password" class="InputStyle"
							value="" id="txtPassword" /></li>
					</ul>
					<ul>
						<li>&nbsp;</li>
					</ul>
					<ul>
						<li></li>
						<li>
							<div style="width: 170px; text-align: left">
								<button class="sexybutton" id="btnLogin">
									<span><span><span class="usergo">登录</span></span></span>
								</button>
								&nbsp;
								<button class="sexybutton" type="reset">
									<span><span><span class="reload">重置</span></span></span>
								</button>
							</div>
						</li>

					</ul>
				</div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<a href="<%=basePath %>main">MAIN</a>
</body>
</html>