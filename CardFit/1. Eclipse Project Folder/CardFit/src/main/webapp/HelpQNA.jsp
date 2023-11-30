<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
#QNAContainer {
	width: 100%;
	padding-bottom: 50px;
		position: relative;
    left: -9%;
}

#QNAContainer p {
	font-size: 26px;
	position: relative;
	left: 3vw;
}

#QNAContainer table {
	width: 90%;
	margin: 0 auto;
	text-align: center;
}

#QNAContainer tr th {
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 14px;
}

#QNAContainer tr td {
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 15px;
}
#QNABox{
	position: relative;
	width: 100%;
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

.inqiryTitle{
	float: left;
}

</style>
</head>
<body>
	<div id="QNAContainer">
		<p>Q&A</p>
		<table id="QNABox">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${directList }" var="list">
				<tr>
					<td>${list.num }</td>
					<td><a href="#" class="inqiryTitle" data-num="${list.num}">${list.title}</a></td>
					<td>${list.writer }</td>
					<td>${list.wtime }</td>
					<%-- join으로 출력값이 나오면 답변완료 아니면 대기중으로 표시되도록 --%>
					<c:if test="${list.answercheck eq 0}">
						<td>답변대기</td>
					</c:if>
					<c:if test="${list.answercheck eq 1}">
						<td style="background-color: #0042EC; border-radius: 4px; color: #ffffff;">답변완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<c:set var="curPage" value="${param.curPage }" />
		<c:if test="${curPage eq null }">
			<c:set var="curPage" value="0" />
		</c:if>
		<div id="pageBox">
			<c:set var="UserTabCurPage" value="${param.curPage }" />
			<c:if test="${UserTabCurPage eq null }">
				<c:set var="UserTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq UserTabCurPage}">
						<span class="page-link">${i+1}</span>
					</c:when>
					<c:when test="${i ne UserTabCurPage}">
						<a class="page-link">${i+1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<script src="./webapp/js/jquery.js" type="text/javascript"></script>
	<script>
	$(document).ready(function() {
	    $('body').on('click', 'a.page-link', function(e) {
	        e.preventDefault();
	        var curPage = parseInt($(this).text()-1); // 클릭한 페이지 번호를 curPage 변수에 설정
	        var url = "HelpQNA.do?curPage=" + curPage; // URL에 페이지 번호를 포함하여 설정
	        
	        $.ajax({
	        	url: url,
	        	data: { "curPage": curPage }, // 현재 페이지 번호를 AJAX 요청의 매개변수로 전달
	            type: 'GET',
	            success: function(response) {
	                $('#QNAContainer').html(response).show();
	            },
	            error: function(xhr, status, error) {
			          console.error(error);
	            }
	        });
	    });
	});
	
	
	$(document).ready(function() {
	    $('body').on('click', 'a.inqiryTitle', function(event) {
	        event.preventDefault();

	        var num = $(this).data('num');
	        var cachedData = $('#QNAContainer').data('inqiryCachedData');

	        if (cachedData && cachedData.num === num) {
	            $('#QNAContainer').html(cachedData.response).show();
	        } else {
	            $.ajax({
	                url: 'directAnswer.do',
	                type: 'GET',
	                data: { num: num },
	                dataType: 'html',
	                success: function(response) {
	                    $('#QNAContainer').html(response).show();
	                    $('#QNAContainer').data('inqiryCachedData', { num: num, response: response });
	                },
	                error: function(xhr, status, error) {
	                    console.error(error);
	                }
	            });
	        }
	    });
	});
	</script>
</body>
</html>