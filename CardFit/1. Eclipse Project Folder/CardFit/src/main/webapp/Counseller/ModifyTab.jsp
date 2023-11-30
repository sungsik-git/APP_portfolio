<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../element/Default/Default.css" type="text/css" rel="stylesheets">
<style type="text/css">
body {
	position: relative;
	width:100%;
}

#resiterContainer{
	position: relative;
	float: right;
	width: 75%;
	top: 100px;
	text-align: center;
	boder:2px solid red;
	height: 150px;
}
#resiterContainer p{
	position: relative;
	font-size : 24px;
}
#resiterContainer img{
	position:relative;
	width: 50%;
}
 #registerTable {
	position: relative;
	width: 50%;
	margin: 0 auto;
}

#registerTable tr th {
	width: 30%;
	padding: 6px;
}

#registerTable tr td {
	width: 70%;
	padding: 6px;
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
<title>상담사 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
</head>
<body>
	<c:import url="../CounsellerPage.jsp"/>
	<c:set value="${dto }" var="dto"/>
	<div id="resiterContainer">
		<p>상담사 회원정보 수정</p>
		<img alt="" src="./source/svg/line.svg">
		
		<form action="cModifyOK.do" method="post">
			<table id="registerTable">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" required value="${dto.id }"></td>
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
					<td><input type="text" name="name" required value="${dto.name }"></td>
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
					<td><input type="email" name="email" style="width: 67.5%" value="${dto.email }">
						<button class="searchButton" style="width: 28%">사내메일 인증</button>
						<div id="companyMsg"></div></td>
				</tr>
				<tr id="corporate">
					<th>사업자번호</th>
					<td><input type="text" name="corporate" style="width: 67.5%" value="${dto.corporate }">
						<button class="searchButton" style="width: 28%">사업자번호 조회</button>
						<div id="coperateMsg"></div></td>
				</tr>
				<tr>
					<th>직통번호</th>
					<td><input type="text" name="tel" required value="${dto.tel }"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" value="c" name="division">
					<input type="submit" value="정보 수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>