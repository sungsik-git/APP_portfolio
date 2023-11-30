<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
#noticeContainer {
	width: 90%;
	margin:40px auto;
}

#noticeTable {
	width: 100%;
	border-collapse: collapse;
	max-height: 500px;
}

#noticeTable th, #noticeTable td {
	padding: 4px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

#noticeTable th {
	width: 30%;
	background-color: #f2f2f2;
	text-align: center;
}

#noticeTable td {
	width: 70%;
}

body::-webkit-scrollbar {
	display: none;
}

#contents {
	max-height: 300px;
	overflow: auto;
}

#contents::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body>
	<div id="noticeContainer">
		<c:set var="dto" value="${dto }" />
		<table id="noticeTable">
			<tr>
				<th>제목</th>
				<td>
					<c:if test="${dto.emphasis eq 1 }">
						[중요공지]  
					</c:if>${dto.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="contents">${dto.contents }</td>
			</tr>
		</table>
	</div>
</body>
</html>
