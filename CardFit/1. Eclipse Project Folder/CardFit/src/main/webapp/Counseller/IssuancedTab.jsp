<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<style type="text/css">
#issuancedContainer {
	position: relative;
	top: 10vh;
	width: 80%;
	margin: 0 auto;
	float: right;
	text-align: center;
}

#issunacedTable {
	position: relative;
	width: 90%;
	font-size: 12px;
	top: 5vh;
	margin: 0 auto;
}

#issunacedTable tr th {
	text-align: center;
	font-size: 18px;
	margin-bottom: 5px;
	background: #F2F6FE;
}

#issunacedTable tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 4px;
	font-size: 16px;
}


#issunacedTable tr td:nth-child(8) {
	width: 200px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
input[type=button] {
	position: relative;
	top: 7vh;
	padding: 8px;
	display: block;
	left: 4vw;
	border: none;
	background-color: #0042ec;
	color: white;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="../CounsellerPage.jsp"/>
	<div id="issuancedContainer">
	<c:choose>
		<c:when test="${sessionScope.company eq null }">
			<h2>${sessionScope.counsellerName }님께서 발급하신 내역입니다.</h2><br>
		</c:when>
		<c:when test="${sessionScope.company ne null }">
			<h2>${sessionScope.company }사에서 발급하신 내역입니다.</h2><br>
		</c:when>
	</c:choose>
	<table id="issunacedTable">
		<tr>
			<th>번호</th>
			<th>고객명</th>
			<th>고객연락처</th>
			<th>카드명</th>
			<th>카드사</th>
			<th>신청일</th>
			<th>발급일</th>
			<th>발급자</th>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.company eq null }">
				<c:forEach items="${idList }" var="list" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${list.userName }</td>
						<td>${list.phone }</td>
						<td>${list.cardName }</td>
						<td>${list.company }</td>
						<td>${list.requestDate }</td>
						<td>${list.issuanceDate }</td>
						<td>${list.counseller }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${sessionScope.company ne null }">
				<c:forEach items="${companyList }" var="list" varStatus="i">
					<tr>
						<td>${i.index +1 }</td>
						<td>${list.userName }</td>
						<td>${list.phone }</td>
						<td>${list.cardName }</td>
						<td>${list.requestDate }</td>
						<td>${list.issuanceDate }</td>
						<td>${list.counseller }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	</div>
</body>
</html>