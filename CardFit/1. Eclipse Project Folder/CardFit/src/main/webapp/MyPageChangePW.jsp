<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
	#changePWContainer {
	width: 80%;
	margin: 0 auto;
	position: relative;
    left: -9%;
}
#changePWContainer p{
	font-size:26px;
}
#line{
	width: 100%;
}
#changePWTable{
	position:relative;
	width: 100%;
	top:30px;
}

#changePWTable tr th{
	width:30%;
	padding: 12px;
	
}
#changePWTable tr td{
	width:70%;
	padding: 12px;
	
}
input[type=text], input[type=password], input[type=email]{
	width:100%;
	border: 1px solid #DADADB;
		padding: 6px;
		margin:6px 0;
	border-radius: 4px;
}
input[type=submit]{
	position:relative;
	margin:3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color:white;
	border-radius: 4px;
}
#check{
	width: 30px;
	height: 20px;	
}
#comentsBox{
	position: relative;
	top: 15px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="changePWContainer">
		<p>비밀번호변경</p>
		<img alt="" src="./source/svg/line.svg" id="line">
		<div id="changePWBox">
			<div id="comentsBox">
				<img alt="" src="./source/svg/check.svg" id="check"><span>변경하실 비밀번호를 입력해주세요</span>
			</div>
			<form action="changePWOK.do" method="post">
				<table id="changePWTable">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw1"></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input type="password" name="pw2">
						<div id="errMsg"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="비밀번호 번경"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
	function validateForm() {
		var pw1 = document.getElementsByName("pw1")[0].value;
		var pw2 = document.getElementsByName("pw2")[0].value;
		var errMsg = document.getElementById("errMsg");

		if (pw1 !== pw2) {
			errMsg.innerText = "비밀번호가 서로 일치하지 않습니다.";
			errMsg.style.color = "red";
			return false;
		} else {
			errMsg.innerText = "비밀번호가 서로 일치합니다.";
			errMsg.style.color = "green";
			return true;
		}
	}

	document.getElementsByName("pw2")[0].addEventListener("focusout", function(){
		validateForm();
	});
</script>


</body>
</html>