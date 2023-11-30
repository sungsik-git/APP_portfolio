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
#registerFormContainer {
	position: relative;
	top: 20vh;
	width: 30vw;
	margin: 0 auto;
}
#title{
	font-size:28px;
	margin-bottom: 5vh;
}
form p{
	margin: 0;
	font-size: 18px;
}
input{
	width: 100%;
	padding: 4px;
}

.postbox{
margin: 5px 0;
}
#registerBtn{
	margin-top: 20px;
	margin-bottom : 10vh;
	background-color: #0042ec;
	color: white;
	padding: 6px;
	border-radius: 4px;
}
#cardInfoTable tr th,#memberInfoTable tr th {
	width: 30%;
	padding: 12px;
}

#cardInfoTable tr td,#memberInfoTable tr td {
	width: 70%;
	padding: 12px;
}

input[type=text], input[type=password], input[type=email], select, button
	{
	width: 100%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

input[type=submit] {
	position: relative;
	margin: 3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
}
input[type=button]{
	border:none;
	padding:7px;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="registerFormContainer">
		<h3 id="title">회원가입</h3>
		<form id="registerForm" action="register.do">
			<p>아이디</p>
			<input type="text" id="id" name="id" required placeholder="아이디">
			<div id="idCheckMsg"></div>
			<p>비밀번호</p>
			<input type="password" id="pw" name="pw" required placeholder="비밀번호(영문, 숫자 포함 20자 이내)">
			<p>비밀번호확인</p>
			<input type="password" id="pwCheck" name="pwCheck" required placeholder="비밀번호 확인">
			<div id="checkPWMsg"></div>
			<p>이름</p>
			<input type="text" id="name" name="name" required placeholder="이름">
			<p>주민등록번호</p>
			<input type="text" id="regNumF" name="regNumF" required style="width:48.2%" placeholder="앞 6자리">
			 - <input type="password" id="regNumB" name="regNumB" required style="width:48.2%" placeholder="뒤 7자리">
			<p>전화번호</p>
			<input type="text" id="phone" name="phone" required placeholder="전화번호">
			<p>이메일</p>
			<input type="email" name="email" id="email" required placeholder="이메일">
			<p>주소</p>
			<input type="text" id="sample4_postcode" placeholder="우편번호"
				name="postcode" style="width:74%" class="postbox"> <input type="button"
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="width:25%" class="postbox"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" required name="roadAddress" class="postbox">  <input
				type="text" id="sample4_jibunAddress" placeholder="지번주소" required name="dibunAddress" class="postbox"> <span
				id="guide" style="color: #999; display: none"></span> <input
				type="text" id="sample4_detailAddress" placeholder="상세주소" required name="detailAddress" class="postbox"> <input
				type="text" id="sample4_extraAddress" placeholder="참고항목" required name="extraAddress" class="postbox"> 
				<input type="hidden" value="u" name="division">
				<input type="submit" value="회원가입" id="registerBtn">
		</form>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./js/PostAPI.js" type="text/javascript"></script>
	<script type="text/javascript" src="./js/jquery.js"></script>
	<script>

/* id체크 */
$('#id').on('blur', function(){
let id = $('#id').val();

if (id === '') {
  $("#idCheckMsg").html("아이디를 입력하세요.").css({"color":"red" , "font-size":"14px"});
  return; // 아이디가 입력되지 않았으므로 더 이상 진행하지 않음
}

$.ajax({
url : "idCheck.do",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
type:  "post",			// HTTP 요청방식 (get/post)
data: {"id": id},			// HTTP 요청과 함께 서버로 보낼 데이터
dataType: 'text',		// 서버에서 보내줄 데이터의 타입
// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
success: function(result){
	if(result == 0){
		$("#idCheckMsg").html("이미 존재하는 아이디 입니다.").css({"color":"red" , "font-size":"14px"});
	} else if(result == 1){
		$("#idCheckMsg").html("사용할 수 있는 아이디 입니다.").css({"color":"green" , "font-size":"14px"});
	} else{
		console.log("error");
	}
},
error:function(){
	alert("서버요청실패");
}
})
});

$(document).ready(function() {
	  $("#pw, #pwCheck").on("keyup", function() {
	    var pwVal = $("#pw").val();
	    var pwCheckVal = $("#pwCheck").val();
	    
	    if (pwVal === pwCheckVal) {
	      $("#checkPWMsg").text("비밀번호가 일치합니다.").css({"color":"green" , "font-size":"14px"});
	    } else {
	      $("#checkPWMsg").text("비밀번호가 일치하지 않습니다.").css({"color":"red" , "font-size":"14px"});
	    }
	  });
	});
	
$('#pw').on('blur', function() {
	  var password = $(this).val();
	  var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,20}$/;
	  
	  if (password !== '' && !regex.test(password)) {
	    alert('비밀번호는 영문자와 숫자를 포함하여 20자 이내로 입력해야 합니다.');
	    $(this).val(''); 
	    $(this).focus(); 
	  }
	});

$(document).ready(function() {
	  // 주민등록번호 앞자리 입력 필드 포커스 아웃 이벤트 처리
	  $("#regNumF").on("focusout", function() {
	    var regNumF = $(this).val();

	    // 유효성 체크 정규표현식
	    var regex = /^\d{6}$/;

	    // 입력값이 유효한 경우에만 처리
	    if (regNumF && !regex.test(regNumF)) {
	      alert("주민등록번호 앞자리는 6자리 숫자로 입력해주세요.");
	      $(this).val(""); // 입력값 초기화
	      $(this).focus(); // 포커스 이동
	    }
	  });

	  // 주민등록번호 뒷자리 입력 필드 포커스 아웃 이벤트 처리
	  $("#regNumB").on("focusout", function() {
	    var regNumB = $(this).val();

	    // 유효성 체크 정규표현식
	    var regex = /^\d{7}$/;

	    // 입력값이 유효한 경우에만 처리
	    if (regNumB && !regex.test(regNumB)) {
	      alert("주민등록번호 뒷자리는 7자리 숫자로 입력해주세요.");
	      $(this).val(""); // 입력값 초기화
	      $(this).focus(); // 포커스 이동
	    }
	  });
	});
</script>


</body>
</html>