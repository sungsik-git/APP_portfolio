<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" rel="stylesheet"
	type="text/css">
<style>
#directContainer {
	width: 80%;
	margin: 0 auto;
		position: relative;
    left: -9%;
}

#directContainer p {
	font-size: 26px;
}

#directContainer img {
	width: 100%;
}

#directTable {
	width: 100%;
}

#directTable tr {
	
}

#directTable tr th {
	width: 30%;
	padding: 12px;
}

#directTable tr td {
	width: 70%;
	padding: 12px;
}

input[type=text], input[type=password], input[type=email], select {
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

textarea {
	resize: none;
	width: 100%;
	height: 120px;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}
</style>
</head>
<body>
	<div id="directContainer">
		<p>1:1문의</p>
		<img alt="" src="./source/svg/line.svg">
		<form action="helpDirectOK.do" method="post">
			<table id="directTable">
				<tr>
					<th>제목</th>
					<td><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td><select id="category" name="category">
							<option value="issuance">카드발급 문의</option>
							<option value="userInfo">계정 문의</option>
							<option value="complaint">불만접수</option>
							<option value="counsellerComplaint">상담사 신고</option>
							<option value="other">기타 문의</option>
					</select></td>
				</tr>
				<tr>
					<th>질문내용</th>
					<td><textarea id="contents" name="contents"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="질문등록"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>