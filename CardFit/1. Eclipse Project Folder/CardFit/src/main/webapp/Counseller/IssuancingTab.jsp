<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<style>
#issuancingContainer {
	position: relative;
	top: 10vh;
	width: 80%;
	margin: 0 auto;
	float: right;
	text-align: center;
}

#issuancingTable {
	position: relative;
	width: 90%;
	font-size: 12px;
	top: 5vh;
	margin: 0 auto;
}

#issuancingTable tr th {
	text-align: center;
	font-size: 18px;
	margin-bottom: 5px;
	background: #F2F6FE;
}

#issuancingTable tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 4px;
	font-size: 16px;
}


#issuancingTable tr td:nth-child(8) {
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
	<div id="issuancingContainer">
	<h2>발급 대기중인 카드예요!</h2><br>
	<p>발급이 가능하면 체크박스를 체크하고 발급진행하세요!</p>
	<table id="issuancingTable">
		<tr>
			<th></th>
			<th>번호</th>
			<th>요청일</th>
			<th>카드사</th>
			<th>카드이름</th>
			<th>고객명</th>
			<th>연락가능일</th>
			<th>연락가능시간</th>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.company eq null }">
				<c:forEach items="${issuanceList }" var="list">
					<tr>
						<td><input type="checkbox" name="issuanceCheck"></td>
						<td>${list.num }</td>
						<td>${list.requestDate }</td>
						<td>${list.cardCompany }</td>
						<td>${list.cardName }</td>
						<td>${list.userName }</td>
						<td>${list.contactableDate }</td>
						<td>${list.startTime } ~ ${list.endTime }</td>
					</tr>
			</c:forEach>
			</c:when>
			<c:when test="${sessionScope.company ne null }">
				<c:forEach items="${ComapnyIssuancelist }" var="list">
					<tr>
						<td><input type="checkbox" name="issuanceCheck"></td>
						<td>${list.num }</td>
						<td>${list.requestDate }</td>	
						<td>${list.cardCompany }</td>
						<td>${list.cardName }</td>
						<td>${list.userName }</td>
						<td>${list.contactableDate }</td>
						<td>${list.startTime } ~ ${list.endTime }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	
		<input type="button" value="발급처리" id="issuanceBtn">
	</div>
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript">
		$("#issuanceBtn").click(
				function() {
					var checkedValues = [];
					$("input[name='issuanceCheck']:checked").each(
							function() {
								checkedValues.push($(this).closest("tr").find("td:eq(1)").text()); 
							});

					if (checkedValues.length === 0) {
						alert("발급할 카드를 선택하세요.");
						return;
					}

					var url = "counsellerIssuanceOK.do?num=" + checkedValues;

					$.ajax({
						url : url,
						data : {
							"num" : checkedValues
						},
						type : 'POST',
						success : function(result) {
							alert(checkedValues + "번 발급처리완료 발급중인 정보창에서 확인 가능합니다.");
							window.location.reload();
						},
						error : function(xhr, status, error) {
							console.error(error);
						}
					});
				});
		</script>
</body>
</html>