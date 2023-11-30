<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
@font-face {
	font-family: 'Pretendard-Bold';
	src: url('font/Pretendard-Bold.ttf') format('truetype');
}

* {
	font-family: Pretendard-Bold;
	padding: 0;
	margin: 0;
}
body{
	width:600px; 
	height:450px;
}
#msgBox{
	position:relative;
	top:30vh;
	margin:0 auto;
	width: 50%;
	height: 20vh;
	font-weight: 100;
}
#pw1, #pw2{
	margin: 6px 0;
}
.btn{
	position: relative;
	border: none;
	background-color: #0042ec;
	width:100%;
	text-align: center;
	color: white;
	border-radius: 4px;
	padding: 10px;
}
#changePWBtn{
	margin-top : 5px;
}
#closeBtn{
	position: absolute;
	width:100px;
	bottom: 30px;
	right: 12vw;
}
</style>
</head>
<body>
	<c:import url="./element/Logo/Logo.jsp"/>
    <div id="msgBox">
    <c:if test="${flag eq 0 }">
        가입하신 아이디는 <c:out value="${dto.id }"></c:out>입니다.<br>
        <a href ="searchIDPW.do">비밀번호 찾기</a>
    </c:if>
    <c:if test="${flag eq 1 }">
    <form id="changePWForm" action="changePW.do" method="post">
        <input type="hidden" name="id" value="${session.id }">
        <p>비밀번호 변경</p><br>
        비밀번호<br><input type="password" id="pw1" name="pw1" style="width:295px" required><br>
        비밀번호 확인<br><input type="password" id="pw2" name="pw2" style="width:295px" required><br>
        <div id="pwCheckMsg"></div>
        <input type="submit" value="비밀번호 변경" id="changePWBtn" class="btn">
    </form>
	</c:if>
	<c:if test="${flag ne 0 && flag ne 1}">
    	해당 정보로 가입된 아이디가 없습니다.
	</c:if>
    </div>
	<input type="button" value="창닫기" onclick="window.close()" class="btn" id="closeBtn">
</body>
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript">
$(function() {
    $('#changePWForm').on('submit', function(event) {
        event.preventDefault(); // 기본 동작 중단
        var form = $(this);
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(response) {
                alert("비밀번호 변경이 완료되었습니다.");
                window.close();
            },
            error: function() {
                alert("비밀번호 변경에 실패했습니다.");
            }
        });
    });
    

    	  $('#pw2').on('focusout', function(e) {
    	    e.preventDefault(); // 폼의 기본 제출 동작을 막습니다.
    	    
    	    var pw1Val = $('#pw1').val();
    	    var pw2Val = $('#pw2').val();
    	    
    	    if (pw1Val === pw2Val) {
    	      $('#pwCheckMsg').text('비밀번호가 일치합니다.');
    	      $('#changePWBtn').prop('disabled', false); // submit 버튼 활성화
    	    } else {
    	      $('#pwCheckMsg').text('비밀번호가 일치하지 않습니다.');
    	      $('#changePWBtn').prop('disabled', true); // submit 버튼 비활성화
    	    }
    	  });
    	  
    	  $('#changePWForm').on('submit', function(e) {
    	    if ($('#changePWBtn').is(':disabled')) {
    	      e.preventDefault(); // submit 버튼이 비활성화된 경우 폼 제출을 막습니다.
    	    }
    	  });
    	});
</script>
</html>