<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>	
<link href="../element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
#noticeListContainer{
	width: 35%;
	height: 560px;
	float: left;
	margin-top:40px;
}
#utilContainer{
	width:64%;
	height: 600px;
	float: right;
}
#insertNoticeContainer{
	display: none;
}



#noticeListContainer table {
	width: 90%;
	margin: 0 auto;
	text-align: center;
}

#noticeListContainer tr th {
	border-top: 2px solid #B6B5B7;
	border-bottom: 1px solid #B6B5B7;
	padding: 4px;
	font-size: 18px;
}

#noticeListContainer tr td {
	border-bottom: 1px solid #B6B5B7;
	padding: 2px;
	font-size: 15px;
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
#listDeleteBtn, #showNoticeWriter{
	position:relative;
	display: inline-block;
	border: none;
	float:right;
	padding: 4px;
	background-color: #FFC9C9;
	rigth: 5vw;
	border-radius: 4px;
	margin-right: 2px;
}
#showNoticeWriter{
	background-color: #0042ec;
	color: white;
	rigth: 10px;
}
</style>
</head>
<body>
	<c:import url="../ManagerPage.jsp"/>
	<div id="noticeListContainer">
		<p>
			<img src="./source/svg/check.svg">제목을 클릭하면 문의 내용을 확인하고 답변을 작성할
			수 있습니다.
		</p>
		<p>
			<img src="./source/svg/check.svg">글쓰기 창이 정상적으로 출력되지 않으면 글쓰기버튼을 한 번 더 눌러주세요
		</p>
		<table>
			<tr>
				<th></th>
				<th>번호</th>				
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="list" items="${NoticeList }">
			<tr>
				<td><input type="checkbox" name="noticeCheck"></td>
				<td>${list.num }</td>
				<td><a href="#" class="noticeTitle" data-num="${list.num}">${list.title}</a></td>
				<td><a href="#" class="noticeTitle" data-title="${list.title}">${list.title}</a></td>
				<td>${list.wtime }</td>
			</tr>
			</c:forEach>
		</table>
		<div id="pageBox">
			<c:set var="NoticeTabCurPage" value="${param.curPage }" />
			<c:if test="${NoticeTabCurPage eq null }">
				<c:set var="NoticeTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq NoticeTabCurPage}">
						<span class="page-link">${i+1}</span>
					</c:when>
					<c:when test="${i ne NoticeTabCurPage}">
						<a class="page-link">${i+1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
		<input type="button" value="공지글 쓰기" id="showNoticeWriter">
		<input type="button" value="공지삭제" id="listDeleteBtn">
		</div>
	</div>
	<div id="utilContainer"></div>
	
	

 	<script src="../js/jquery.js" type="text/javascript"></script>
 	<script type="text/javascript">
    $(document).ready(function() {
        $('body').on('click', 'a.page-link', function(e) {
            e.preventDefault();
            var NoticeTabCurPage = parseInt($(this).text() - 1);
            var url = "NoticeTab.do?curPage=" + NoticeTabCurPage;

            $.ajax({
                url: url,
                data: { "curPage": NoticeTabCurPage },
                type: 'GET',
                success: function(response) {
                    $('#utilContainer').html(response).show();
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        });

		 $('body').on('click', 'a.noticeTitle', function(event) {
            event.preventDefault();

            var num = $(this).data('num');
            var cachedData = $('#utilContainer').data('noticeCachedData');

            if (cachedData && cachedData.num === num) {
                $('#utilContainer').html(cachedData.response).show();
            } else {
                $.ajax({
                    url: 'NoticeContents.do',
                    type: 'GET',
                    data: { num: num },
                    dataType: 'html',
                    success: function(response) {
                        $('#utilContainer').html(response).show();
                        $('#utilContainer').data('noticeCachedData', { num: num, response: response });
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                    }
                });
            }
        });

        $('#showNoticeWriter').on('click', function(event) {
            event.preventDefault();

            var cachedData = $('#utilContainer').data('showCachedData');
            if (cachedData) {
                $('#utilContainer').html(cachedData.response).show();
            } else {
                $.ajax({
                    url: 'NoticeWriterPage.do',
                    type: 'GET',
                    success: function(response) {
                        $('#utilContainer').html(response).show();
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                    }
                });
            }
        });
    });
    
    //공지사항 삭제
    $("#listDeleteBtn").click(function() {
        var checkedValues = [];
        $("input[name='noticeCheck']:checked").each(function() {
          checkedValues.push($(this).closest("tr").find("td:eq(1)").text()); // 예시로 ID 값을 가져오도록 설정
        });

        if (checkedValues.length === 0) {
          alert("삭제할 데이터를 선택하세요.");
          return;
        }

        
        var url = "deleteNoticeOK.do?num=" + checkedValues;

        $.ajax({
          url: url,
          data: { "num": checkedValues },
          type: 'POST',
          success: function(result) {
            alert(checkedValues + "삭제완료");
            window.location.reload();
          },
          error: function(xhr, status, error) {
            console.error(error);
          }
        });
      });
</script>

</body>
</html>