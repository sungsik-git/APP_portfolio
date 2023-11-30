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
#issuanceContainer{
 	width: 100%;
 	margin-bottom: 50px;
    position: relative;
    left: -9%;
}
#issuanceContainer p{
	font-size: 26px;
	position: relative;
	left: 3vw;
}
#issuanceContainer table{
	width: 90%;
	margin: 0 auto;
	text-align: center;
}
#issuanceContainer tr th{
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 5px;
	font-size: 16px;
}
#issuanceContainer tr td{
	border-bottom: 1px solid #B6B5B7;
	padding: 5px;
	font-size: 17px;
	font-weight: 300;
}
#listDeleteBtn {
	position: relative;
	border: none;
	padding: 4px;
	background-color: #FFC9C9;
	float: right;
	right: 60px; /* 수정된 부분 */
	border-radius: 4px;
	margin: 10px auto;
	font-weight: 400;
}
</style>
</head>
<body>
	<div id="issuanceContainer">
		<p>카드발급현황</p>
		<table>
			<tr>
				<th></th>
				<th>발급번호</th>
				<th>처리상태</th>
				<th>신청일</th>
				<th>카드이름</th>
				<th>카드사</th>
				<th>발급상담사</th>
			</tr>
			<c:forEach items="${issuanceInfo}" var="list">
			<tr>
				<td><input type="checkbox" name="issCheck"></td>
				<td>${list.num }</td>
				<c:choose>
					<c:when test="${list.issCondition eq 0}">
						<td>발급 대기중</td>
					</c:when>
					<c:when test="${list.issCondition eq 1}">
						<td>발급중</td>
					</c:when>
					<c:when test="${list.issCondition eq 2}">
						<td>발급완료</td>
					</c:when>
				</c:choose>
				<td>${list.requestDate }</td>
				<td>${list.cardName }</td>
				<td>${list.company }</td>
				<c:if test="${list.counseller eq null}">
					<td>배정중</td>
				</c:if>
				<c:if test="${list.counseller ne null}">
					<td>${list.counseller }</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<input type="button" value="발급취소" id="listDeleteBtn">
	</div>
	<script type="text/javascript">
	$("#listDeleteBtn").click(function() {
		var checkedValues = [];
		$("input[name='issCheck']:checked").each(function() {
			checkedValues.push($(this).closest("tr").find("td:eq(1)").text()); 
			});

		if (checkedValues.length === 0) {
				alert("삭제할 데이터를 선택하세요.");
				return;
			}

				var url = "deleteUserissOK.do?num=" + checkedValues;

				$.ajax({
					url : url,
					data : {
						"num" : checkedValues
					},
					type : 'POST',
					success : function(result) {
						alert(checkedValues + "삭제완료");
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