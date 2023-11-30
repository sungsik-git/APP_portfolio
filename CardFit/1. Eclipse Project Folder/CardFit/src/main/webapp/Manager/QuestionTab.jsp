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

#QNAContainer {
	position: relative;
	width: 46%;
	height: 560px;
	padding-bottom: 50px;
	overflow: hidden;
	margin: 0px auto;
	overflow-x: hidden;
	top: 10px;
	float: left;
}

#QNAContainer p {
	font-size: 12px;
	margin: 0;
	position: relative;
	left: 2vw;
	padding: 4px;
}
/* 아래의 모든 코드는 영역::코드로 사용 */
#QNAContainer::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

#QNAContainer::-webkit-scrollbar-thumb {
	height: 30%; /* 스크롤바의 길이 */
	background: #668ef4; /* 스크롤바의 색상 */
	border-radius: 10px;
}

#QNAContainer::-webkit-scrollbar-track {
	background: #EBF0FE; /*스크롤바 뒷 배경 색상*/
}

#QNAContainer table {
	width: 90%;
	height: 90%;
	margin: 0 auto;
	text-align: center;
}

#QNAContainer tr th {
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 15px;
}

#QNAContainer tr td {
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 12px;
}

#answerDiv {
	position: relative;
	height: 560px;
	width: 53%;
	top: 2vh;
	float: right;
}

#answerDiv p {
	position: relative;
	width: 60%;
	float: left;
	left: 15%;
}

#inqiryContentsBox {
	position: relative;
	width: 90%;
	height: 35%;
	margin: 0 auto;
	overflow-y: auto;
}

#inqiryContentsBox::-webkit-scrollbar {
	display: none;
}

#answerContentsBox {
	position: relative;
	width: 90%;
	height: 55%;
	margin: 0 auto;
}

#pageBox {
	position: relative;
	text-align: center;
	border: none;
	top: 10px;
	overflow: hidden;
	width: 100%;
}

.page-link {
	position:relative;
	display: inline;
	width: 30px;
	float: left;
	border: none;
	margin: 0 auto;
	left: 30px;
}
</style>
</head>
<body>
	<c:import url="../ManagerPage.jsp"/>
	<div id="QNAContainer">
		<p>
			<img src="./source/svg/check.svg">제목을 클릭하면 문의 내용을 확인하고 답변을 작성할
			수 있습니다.
		</p>
		<table id="QNABox">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>상태</th>
			</tr>
			<c:forEach items="${directList }" var="list">
				<tr>
					<td>${list.num }</td>
					<td>${list.category }
					<td><a href="#" class="inqiryTitle" data-num="${list.num}">${list.title}</a></td>
					<td>${list.writer }</td>
					<td>${list.wtime }</td>
					<c:if test="${list.answercheck eq 0}">
						<td>답변대기</td>
					</c:if>
					<c:if test="${list.answercheck eq 1}">
						<td
							style="background-color: #0042EC; border-radius: 4px; color: #ffffff;">답변완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<div id="pageBox">
			<c:set var="QuestionTabCurPage" value="${param.curPage }" />
			<c:if test="${QuestionTabCurPage eq null }">
				<c:set var="QuestionTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq QuestionTabCurPage}">
						<span class="page-link">${i + 1}</span>
					</c:when>
					<c:when test="${i ne QuestionTabCurPage}">
						<a class="page-link">${i + 1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<div id=answerDiv>
		<p>세부 내용</p>
		<div id="inqiryContentsBox"></div>
		<div id="answerContentsBox"></div>
	</div>
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script>
    $(document).ready(function() {
        $('body').on('click', 'a.page-link', function(e) {
            e.preventDefault();
            var QuestionTabCurPage = parseInt($(this).text() - 1);
            var url = "QuestionTab.do?curPage=" + QuestionTabCurPage;
            
            $.ajax({
                url: url,
                data: { "curPage": QuestionTabCurPage },
                type: 'GET',
                success: function(response) {
                    $('body').html(response).show();
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
	        var cachedData = $('#inqiryContentsBox').data('inqiryCachedData');

	        if (cachedData && cachedData.num === num) {
	            $('#inqiryContentsBox').html(cachedData.response).show();
	        } else {
	            $.ajax({
	                url: 'directAnswer.do',
	                type: 'GET',
	                data: { "num": num },
	                dataType: 'html',
	                success: function(response) {
	                    $('#inqiryContentsBox').html(response).show();
	                    $('#inqiryContentsBox').data('inqiryCachedData', { num: num, response: response });
	                },
	                error: function(xhr, status, error) {
	                    console.error(error);
	                }
	            });

	            // 동시에 answerContentsBox에 insertAnswer.do를 출력
	            $.ajax({
	                url: 'insertAnswer.do',
	                type: 'GET',
	                data: { num: num },
	                dataType: 'html',
	                success: function(response) {
	                    $('#answerContentsBox').html(response).show();
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