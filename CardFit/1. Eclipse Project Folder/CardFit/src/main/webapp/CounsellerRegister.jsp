<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 회원가입</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">

<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
body {
	position: relative;
	width:100%;
}

#resiterContainer {
	position: relative;
	width: 100%;
	top: 20vh;
}
#resiterContainer p{
	position: relative;
	font-size : 24px;
	margin-left: 25vw;
}
#resiterContainer img{
	position:relative;
	width: 50%;
	margin-left: 25%;
}
 #registerTable {
	position: relative;
	width: 50%;
		margin: 0 auto;
	
}

#registerTable tr th {
	width: 30%;
	padding: 12px;
}

#registerTable tr td {
	width: 70%;
	padding: 12px;
}

input[type=text], input[type=password], input[type=email], select, button
	{
	width: 100%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

input[type=submit] {
	position: relative;
	margin: 3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
}
</style>

</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="resiterContainer">
		<p>상담사 회원가입</p>
		<img alt="" src="./source/svg/line.svg">
		
		<form action="counsellerRegisterOK.do" method="post">
			<table id="registerTable">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="pwCheck" required></td>
				</tr>
				<tr >
					<th>이름</th>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<th>회사</th>
					<td><select name="company" id="selectCompany">
							<c:forEach items="${companyList }" var="list">
								<option value="${list.name }">${list.name }</option>
							</c:forEach>
							<option>소속없음</option>
					</select></td>
				<tr id="email">
					<th>사내메일 인증</th>
					<td><input type="email" name="email" style="width: 68%">
						<button class="searchButton" style="width: 29%">사내메일 인증</button>
						<div id="companyMsg"></div></td>
				</tr>
				<tr id="corporate">
					<th>사업자번호</th>
					<td><input type="text" name="corporate" style="width: 68%">
						<button class="searchButton" style="width: 29%">사업자번호 조회</button>
						<div id="coperateMsg"></div></td>
				</tr>
				<tr>
					<th>직통번호</th>
					<td><input type="text" name="tel" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" value="c" name="division">
					<input type="submit" value="가입하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>