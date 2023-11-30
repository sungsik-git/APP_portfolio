<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
#allContainer{
 	width: 100%;
 	padding-bottom: 50px;
 		position: relative;
    left: -9%;
}
#allContainer p{
	font-size: 26px;
	position: relative;
	left: 3vw;
}
#allContainer table{
	width: 90%;
	margin: 0 auto;
	text-align: center;
}
#allContainer tr th{
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 5px;
	font-size: 16px;
}
#allContainer tr td{
	border-bottom: 1px solid #B6B5B7;
	padding: 5px;
	font-size: 17px;
	
}
#FAQTitle{
	margin-top: 30px;
}
a{
	text-decoration: none;
	color: black;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="allContainer">
		<p><a href="#" id="helpNoticeMenu">공지사항</a></p>
		<table id="noticeBox">
			<tr>
				<th></th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="list" items="${NoticeList }">
				<tr>
				<c:choose>
					<c:when test="${list.emphasis eq 0 }"><td></td></c:when>
					<c:when test="${list.emphasis eq 1 }"><td><img src="./source/svg/check.svg">중요</td></c:when>
				</c:choose>	
				<td><a href="#" class="noticeTitle" data-num="${list.num}">${list.title}</a></td>
					<td>${list.wtime }</td>
				</tr>
			</c:forEach>
		</table>
		
		<p id="FAQTitle">FAQ</p>
		<table id="FAQBox">
			<tr>
				<th>질문</th>
			</tr>
			<tr>
				<td>test</td>
			</tr>
		</table>
	</div>
	<div id="hiddenBtn"></div>
	
	 	<script src="../js/jquery.js" type="text/javascript"></script>
 	<script type="text/javascript">
 	$('body').on('click', 'a.noticeTitle', function(event) {
 	    event.preventDefault();

 	    var num = $(this).data('num');
 	    var cachedData = $('#allContainer').data('noticeCachedData');

 	    if (cachedData && cachedData.num === num) {
 	        $('#allContainer').html(cachedData.response).show();
 	    } else {
 	        $.ajax({
 	            url: 'NoticeContents.do',
 	            type: 'GET',
 	            data: { num: num },
 	            dataType: 'html',
 	            success: function(response) {
 	                $('#allContainer').html(response).show();
 	                $('#allContainer').data('noticeCachedData', { num: num, response: response });
 	            },
 	            error: function(xhr, status, error) {
 	                console.error(error);
 	            }
 	        });
 	    }
 	});
 	
	</script>
</body>
</html>