<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style>
body {
	position: relative; width : 1920px;
	height: 800px;
	width: 1920;
}

input[name="tab_item"] {
	display: none;
}

#loginContainer {
	position: relative;
	top: 35%;
	width: 40%;
	height: 40%;
	margin: 0 auto;
	text-align: center;
	padding: 8px;
	padding-top: 20px;
}

.tab_item {
	width: 45%; 
	padding : 10px;
	text-align: center;
	background-color: #eee;
	padding: 10px;
	display: inline-block;
	border-radius: 4px;
}
.tab_item label{
	padding: 10px 120px;
	cursor: pointer;
}
.tab_content form {
	position: relative;
	width: 100%;
	padding-top: 30px;
	text-align: center;
	margin-top: 30px;
}

.tab_content {
	display: none;
	margin: auto auto;
	width: 100%;
	height: 100%;
	position: relative;
}

form input[type=text], form input[type=password] {
	width: 70%;
	padding: 8px;
	margin-bottom: 10px;
}

form p {
	display: inline-block;
	width: 70%;
	margin: 0;
	text-align: left;
}
.linkContainer {
	position: relative;
	width: 100%;
	text-align: center;
}

.linkContainer a {
position:relative;	
	display: inline-block;
	padding: 8px;
	width: 30%;
	margin: 0 5px; 
	
}


input[type=submit] {
	position: relative;
	width: 75%;
	background-color: #0042ec;
	color: white;
	border: none;
	padding: 10px 40px;
	margin: 0 auto;
	border-radius: 4px;
	font-size: 16px;
}

#counseller_tab:checked ~ #counseller_login, #manager_tab:checked ~
	#manager_login {
	display: block;
}

#counseller_tab:checked+.tab_item, #manager_tab:checked+.tab_item {
	background-color: #0042ec;
	color: white;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="loginContainer">
		<input type="radio" id="counseller_tab" name="tab_item" checked>
		<div class="tab_item">
			<label for="counseller_tab">상담사 로그인</label>
		</div>

		<input type="radio" id="manager_tab" name="tab_item">
		<div class="tab_item">
			<label for="manager_tab">관리자 로그인</label>
		</div>
		<div id="counseller_login" class="tab_content">
			<form action="counsellerLoginOK.do" method="post">
				<p>아이디</p>
				<input type="text" name="id"><br>
				<p>비밀번호</p>
				<input type="password" name="pw"><br>
				<c:if test="${result eq 1 }">
					<p id="errorMSG"
						style=" color: red; font-size: 12px; width: 60%;">아이디와
						비밀번호를 다시 확인해주세요.</p>
				</c:if>
				<div class="linkContainer">
					<a href="CounsellerRegister.do">회원가입</a>
					<a href="CounsellerRegister.do">아이디 비밀번호 찾기</a><br>
				</div> 
				<input type="hidden" name="divisionCheck" value="c"> 
				<input type="submit" value="로그인">
			</form>
		</div>


		<div id="manager_login" class="tab_content">
			<form action="managerLoginOK.do" method="post">
				<p>아이디</p>
				<input type="text" name="id"><br>
				<p>비밀번호</p>
				<input type="password" name="pw"><br>
				<c:if test="${result eq 1 }">
					<p id="errorMSG"
						style=" color: red; font-size: 12px; width: 60%;">아이디와
						비밀번호를 다시 확인해주세요.</p>
				</c:if>
				<div class="linkContainer">
				</div> 
				<input type="hidden" name="divisionCheck" value="m"> <input type="submit"
					value="로그인">
			</form>
		</div>
	</div>
</body>
</html>