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
#noticeContainer{
	position: relative;
	float: right;
	width: 75%;
	top: 5vh;
	text-align: center;
	boder:2px solid red;
	height: 150px;
}
#noticeContainer table{
	width: 80%;
	margin: 0 auto;
	margin-top: 15px;
}

#noticeContainer tr th {
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 14px;
}

#noticeContainer tr td {
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 15px;
}

#QNAContainer{
	position: relative;
	float: right;
	width: 75%;
	top: 10vh;
	text-align: center;
}

#QNAContainer table{
	width: 80%;
	margin: 0 auto;
	margin-top: 15px;
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
</style>
</head>
<body>
	<c:import url="../CounsellerPage.jsp"/>
	<div id="noticeContainer">
	<h2>관리자 공지사항입니다.</h2><br>
	<p>읽지 않은 공지는 꼭 확인해주세요!</p>
	<table>
		<tr>
			<th>중요공지</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${NoticeList }" var="list">
		<tr>
			<td>
				<c:if test="${list.emphasis eq 1 }"><img src="./source/svg/check.svg">중요</c:if>
			</td>
			<td>
				<a href="#" class="noticeTitle" data-num="${list.num}">${list.title}</a>
			</td>
			<td>${list.wtime }</td>
		</tr>		
		</c:forEach>
	</table>
	</div>
	
	<div id="QNAContainer">
	<h2>Q$A</h2>
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
		 	<script src="../js/jquery.js" type="text/javascript"></script>
 <script type="text/javascript">
    $('body').on('click', 'a.noticeTitle', function(event) {
        event.preventDefault();

        var num = $(this).data('num');
        var cachedData = $('#noticeContainer').data('noticeCachedData');

        if (cachedData && cachedData.num === num) {
            $('#noticeContainer').html(cachedData.response).show();
        } else {
            $.ajax({
                url: 'NoticeContents.do',
                type: 'GET',
                data: { num: num },
                dataType: 'html',
                success: function(response) {
                    $('#noticeContainer').html(response).show().css({
                        'width': '60%',
                        'position': 'relative',
                        'left': '-20vh',
                        'top': '-5vh'
                    });
                    $('#noticeContainer').data('noticeCachedData', { num: num, response: response });
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });


    $(document).ready(function() {
        $('body').on('click', 'a.page-link', function(e) {
            e.preventDefault();
            var curPage = parseInt($(this).text()) - 1; // 클릭한 페이지 번호를 curPage 변수에 설정
            var url = "HelpQNA.do?curPage=" + curPage; // URL에 페이지 번호를 포함하여 설정

            $.ajax({
                url: url,
                data: { "curPage": curPage }, // 현재 페이지 번호를 AJAX 요청의 매개변수로 전달
                type: 'GET',
                success: function(response) {
                    $('#QNAContainer').html(response).show().css({
                        'width': '65%',
                        'position': 'relative',
                        'left' : '-5vw',
                        'top': '3vh',
                        'margin' : '0 auto'
                    });
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
                $('#QNAContainer').html(cachedData.response).show().css({
                    'width': '75%',
                    'position': 'relative',
                    'left': '-20vh',
                    'top': '8vh'
                });
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