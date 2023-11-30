<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디/비밀번호 찾기</title>
<!-- <link href="./css/searchIDPW.css" type="text/css" rel="stylesheet"> -->
<style type="text/css">
@charset "UTF-8";
@font-face {
	font-family: 'Pretendard-Bold';
	src: url('font/Pretendard-Bold.ttf') format('truetype');
}

* {
	font-family: Pretendard-Bold;
	padding: 0;
	margin: 0;
}
body{
	width:600px; 
	height:450px;
}
form{
	padding : 7px;
	margin-bottom: 12px;
}
from p{
	font-size: 16px
}
td{
	font-size: 12px;
	line-height: 12px;
	position: relative;
 	vertical-align: bottom;
 }
#mainBox{
	position:relative;
	width:80%;
	margin: 0 auto;
	height: 70%;
	top:13vh;
}
input{
  height: 32px;
  border: 0;
  outline: none;
  padding-left: 10px;
  border-bottom: 2px solid #012E40;
}
.btn{
	position: relative;
	border: none;
	background-color: #0042ec;
	width:100%;
	text-align: center;
	color: white;
	border-radius: 4px;
}
#closeBtn{
	position: absolute;
	width:100px;
	bottom: 30px;
	right: 12vw;
}

.btnBox{
	padding-top: 20px;
}
</style>
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
</head>
<body>
	<c:import url="./element/Logo/Logo.jsp" />
	<div id="mainBox">
		<form action="searchID.do" method="post">
		<p>아이디 찾기</p>
			<table>
				<tr>
					<td style="width:200px">이름</td>
					<td><input type="text" id="name" name="name" style="width:300px;" required></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td><input type="text" id="regNumF" name="regNumF" style="width:137px" required> - <input type="password" id="regNumB" name="regNumB" style="width:137px" required></td>
				</tr>
				<tr>
					<td colspan="2" class="btnBox">
						<input type="submit" value="아이디 찾기" class="btn">
						<input type="hidden" name="flag" value="0">
					</td>
				</tr>
			</table>
		</form>
		<form action="searchPW.do" method="post">
		<p>비밀번호 찾기</p>
			<table>
				<tr>
					<td style="width:200px">아이디</td>
					<td><input type="text" id="id" name="id" style="width:300px;" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name" style="width:300px;" required></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td><input type="text" id="regNumF" name="regNumF" style="width:137px" required> - <input type="password" id="regNumB" name="regNumB" style="width:137px" required></td>
				</tr>
				<tr>
					<td colspan="2" class="btnBox">
						<input type="submit" value="비밀번호 찾기" class="btn">
						<input type="hidden" name="flag" value="1">
					</td>
				</tr>
			</table>
		</form>
	</div>
		<input type="button" value="창닫기" onclick="window.close()" class="btn" id="closeBtn">
</body>

</html>