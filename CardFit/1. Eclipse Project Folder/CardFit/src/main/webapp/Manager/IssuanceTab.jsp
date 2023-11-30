<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="../element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style>
#issuanceContainer {
	height: 560px;
	padding-top: 20px;
}

#issuanceTable {
	position: relative;
	width: 100%;
	font-size: 12px;
}

#issuanceTable tr th {
	text-align: center;
	font-size: 16px;
}

#issuanceTable tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 2px
}

#issuanceTable tr td input {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
	line-height: 30px;
	position: relative;
	top: 100%;
	left: 15%;
}

#userDeleteBtn {
	border: none;
	background-color: red;
	width: 5vw;
	position: absolute;
	left: 10px;
	line-height: 120px;
}

#pageBox {
	position: relative;
	text-align: center;
	border: none;
	top: 10px;
	width: 100%;
	margin: 0 auto;
}

.page-link {
	display: inline !important;
	width: 30px;
	border: none;
	margin: 0 auto;
}

#listDeleteBtn {
	position: relative;
	display: inline-block;
	border: none;
	float: right;
	padding: 4px;
	background-color: #FFC9C9;
	rigth: 5vw;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="../ManagerPage.jsp" />
	
	<div id="issuanceContainer">
		<table id="issuanceTable">
			<tr>
				<th></th>
				<th>순번</th>
				<th>카드명</th>
				<th>신청 고객명</th>
				<th>고객 이아디</th>
				<th>고객 전화번호</th>
				<th>연락 가능 날짜</th>
				<th>연락 가능 시간</th>
				<th>고객 이메일</th>
				<th>신청일</th>
				<th>발급일</th>
				<th>담당상담사</th>
			</tr>
			<c:forEach items="${issuanceList }" var="list">
				<tr>
					<td><input type="checkbox" name="issuanceCheck"></td>
					<td>${list.num }</td>
					<td>${list.cardName }</td>
					<td>${list.userName }</td>
					<td>${list.userId }</td>
					<td>${list.phone }</td>
					<td>${list.contactableDate }</td>
					<td>${list.startTime }~ ${list.endTime }</td>
					<td>${list.email }</td>
					<td>${list.requestDate }</td>
					<td>${list.issuanceDate }</td>
					<td>${list.counseller }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageBox">
			<c:set var="IssuanceTabCurPage" value="${param.curPage }" />
			<c:if test="${IssuanceTabCurPage eq null }">
				<c:set var="IssuanceTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq IssuanceTabCurPage}">
						<span class="page-link">${i+1}</span>
					</c:when>
					<c:when test="${i ne IssuanceTabCurPage}">
						<a class="page-link">${i+1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<input type="button" value="발급신청 삭제" id="listDeleteBtn">
		</div>
	</div>
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('body').on('click', 'a.page-link', function(e) {
				e.preventDefault();
				var IssuanceTabCurPage = parseInt($(this).text() - 1);
				var url = "IssuanceTab.do?curPage=" + IssuanceTabCurPage;

				$.ajax({
					url : url,
					data : {
						"curPage" : IssuanceTabCurPage
					},
					type : 'GET',
					success : function(response) {
						$('body').html(response).show();
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			});
		});

		$("#listDeleteBtn").click(
				function() {
					var checkedValues = [];
					$("input[name='issuanceCheck']:checked").each(
							function() {
								checkedValues.push($(this).closest("tr").find(
										"td:eq(1)").text());
							});

					if (checkedValues.length === 0) {
						alert("삭제할 데이터를 선택하세요.");
						return;
					}

					var url = "deleteIssuanceOK.do?num=" + checkedValues;

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