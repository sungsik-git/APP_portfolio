<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드핏</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">

<!-- <link href="./css/Index.css" rel="stylesheet" type="text/css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- <link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
 -->
<style type="text/css">
@charset "UTF-8";

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Bold.ttf') format('truetype');
	font-weight: 700;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Black.ttf') format('truetype');
	font-weight: 900;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-ExtraBold.ttf') format('truetype');
	font-weight: 800;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-ExtraLight.ttf') format('truetype');
	font-weight: 200;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Light.ttf') format('truetype');
	font-weight: 300;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Medium.ttf') format('truetype');
	font-weight: 500;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Regular.ttf') format('truetype');
	font-weight: 400;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-SemiBold.ttf') format('truetype');
	font-weight: 600;
}

@font-face {
	font-family: 'Pretendard';
	src: url('webapp/font/Pretendard-Thin.ttf') format('truetype');
	font-weight: 100;
}

* {
	font-family: Pretendard;
	font-weight: 700;
	padding: 0;
	margin: 0;
}

body {
	width: 1920px;
	overflow: scroll;
	overflow-x: hidden;
}
/* 아래의 모든 코드는 영역::코드로 사용 */
body::-webkit-scrollbar {
	width: 15px;
}

body::-webkit-scrollbar-thumb {
	height: 30%; /* 스크롤바의 길이 */
	background: #E8E8E8; /* 스크롤바의 색상 */
	border-radius: 10px;
}

body::-webkit-scrollbar-track {
	
}

#bannerContainer {
	position: relative;
	width: 1920px;
	padding-top: 90px;
	box-sizing: border-box;
}

.bannerContents {
	position: relative;
	width: 1800px;
	display: none;
}

.bannerContents>img {
	position: relative;
	width: 1920px;
	height: 650px;
}

.bannerComent {
	position: absolute;
	top: 180px;
	left: 280px;
}

#bannerComent1 {
	color: white;
}

#bannerComent1 img {
	position: relative;
	left: -4vw;
}

#bannerComent1 p:nth-child(2), #bannerComent1 p:nth-child(3) {
	font-size: 52px;
}

#bannerComent1 p:nth-child(4), #bannerComent1 p:nth-child(5) {
	font-weight: 300;
}

#bannerComent2 {
	color: white;
	line-height: 60px;
	position: absolute;
	left: 280px;
	top: 228px;
}

#bannerComent2 p:nth-child(1), #bannerComent2 p:nth-child(2) {
	font-size: 52px;
}

#goSearchMyCard {
	width: 300px;
	height: 60px;
	color: white;
	background-color: #668ef4;
	text-align: center;
	padding: 20px;
	line-height: 22px;
	font-size: 22px;
	box-shadow: 0px 4px 5px rgb(0, 0, 0, 0.2);
	border-radius: 4px;
	margin-top: 45px;
	font-weight: 600;
}

#goSearchMyCard:hover {
	background-color: #4573EA;
	cursor: pointer;
}

/* about section start */
#aboutContainer {
	position: relative;
	width: 1920px;
	height: 2300px;
	margin: 0 auto;
}

#aboutContainer>p {
	position: relative;
	text-align: center;
	font-size: 30px;
	margin: 20px;
	font-weight: 400;
	margin-top: 80px;
}

#aboutContents {
	position: relative;
	width: 1920px;
	height: 1400px;
}

.aboutImgs {
	position: relative;
	width: 55%;
	height: 50%;
	float: left;
	text-align: center;
}

.aboutImgs img {
	position: relative;
	width: 650px;
	height: 680px;
	margin: 0 auto;
}

.aboutContexts {
	position: relative;
	width: 45%;
	height: 50%;
	float: right;
}

.aboutContexts p {
	font-weight: 600;
	font-size: 36px;
}

#aboutContext1, #aboutContext2 {
	position: absolute;
	top: 250px;
	left: 182px;
}

/* adventage Section Start */
#adventageContainer {
	position: relative;
	width: 1920px;
	height: auto;
	text-align: center;
	top: 150px;
}

.adventage {
	position: relative;
	float: left;
	width: calc(100%/ 3);
	height: 100%;
	font-size: 24px;
}

.adventage img {
	position: relative;
	width: 60%;
	margin: 0 auto;
	margin-bottom: 20px;
}

#adventage3 {
	top: 50px;
}

/* 카드추천 영역*/
#searchMyCardContainer {
	position: relative;
	width: 70%;
	height: 800px;
	border-radius: 10px;
	margin: 80px auto;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	padding: 18px;
}

.introduceBox {
	display: block;
	position: relative;
	width: 80%;
	margin: 0 auto;
	padding: 12px;
	text-align: center;
	margin-top: 40px;
}

.introduceBox>p {
	font-size: 28px;
}

#cardMessageBox {
	position: relative;
	display: none;
	width: 40%;
	margin: 0 auto;
	padding: 12px;
	font-size: 20px;
	top: 100px;
	box-shadow: 0px 4px 5px rgb(0, 0, 0, 0.2);
	border: #F8F8F8;
	border-radius: 8px;
}

#cardMessageBox img {
	position: relative;
	width: 60px;
	height: 60px;
	float: left;
	margin: 5px auto;
	left: 50px;
}

#cardMessageBox p {
	position: relative;
	width: 60%;
	float: right;
	font-size: 18px;
	font-weight: 500;
	left: -30px;
}

#cardMessageBox p:last-child {
	font-weight: 400;
	font-size: 14px;
}

#messageBtn {
	width: 100%;
}

#messageBtn input[type=button] {
	position: relative;
	width: 80%;
	border: none;
	background-color: #0042ec;
	color: white;
	padding: 5px;
	margin: 15px auto;
	border-radius: 8px;
	left: 10%;
}

/* 랭킹 영역*/
#cardRankingContainer {
	position: relative;
	width: 1920px;
	height: 1000px;
	text-align: center;
}

#rankingTitleBox {
	position: relative;
	width: 20%;
	height: 10%;
	margin: 0 auto;
	text-align: center;
	float: left;
	left: 15%
}

#rankingTitleBox p {
	margin: 0;
}

#tabBtnContainer {
	width: 50%;
	height: 10%;
	margin: 0 auto;
	text-align: center;
	margin-left: 550px;
}

#tabBtnContainer input[type="radio"] {
	display: none;
}

#tabBtnContainer label {
	width: 150px;
	height: 90px;
	border: none;
	font-size: 24px;
	background: none;
	line-height: 70px;
	cursor: pointer;
}

#changAjaxContainer {
	width: 100%;
	height: 800px;
	margin: 0 auto;
	text-align: center;
	overflow: scroll;
	overflow-x: hidden;
}

footer {
	position: relative;
	width: 1920px;
	height: 150px;
	text-align: center;
	background-color: #49484B;
	color: white;
}

footer a {
	position: relative;
	top:10px;
	text-decoration: none;
	color: black;
	padding: 12px 28px;
	font-size: 14px;
	background-color: white;
	border-radius: 4px;
}

footer p{
	font-size: 16px;
}

footer #leftContainer {
	width: 40%;
	float: left;
	margin-top: 30px;
}

footer #rightContainer {
	width: 60%;
	float: right;
	margin-top: 70px;
}

/* 타이핑 효과 */
div.typing-txt {
	display: none; . introduceBox { display : flex; /* 요소를 행으로 배치 */
	flex-direction: column; /* 요소를 세로로 정렬 */
	width: 80%;
	margin: 0 auto;
}

.typing {
	display: block;
	animation-name: cursor;
	animation-duration: 0.1s;
	animation-iteration-count: infinite;
	padding: 20px;
}

@
keyframes cursor { 0% {
	border-right: 1px solid #fff
}
50
%
{
border-right
:
1px
 
solid
 
#000
}
100
%
{
border-right
:
1px
solid
#fff
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="bannerContainer">
		<div class="bannerContents" id="bannerContents1">
			<img src="source/svg/banner1.svg" alt="">
			<div id="bannerComent1" class="bannerComent">
				<img alt="" src="./source/svg/mark.svg">
				<p>나만의 자산운용 비서</p>
				<p>카드핏!</p>
				<p>나에게 딱 맞는 카드 사용 설계,</p>
				<p>생활 패턴에 맞춰진 최적의 금전 사용 파트너</p>
			</div>
		</div>
		<div class="bannerContents" id="bannerContents2">
			<img src="source/svg/banner2.svg" alt="">
			<div id="bannerComent2" class="bannerComent">
				<p>당신의 카드찾기 서비스 카드핏</p>
				<p>나에게 딱 맞는 카드 찾기</p>
				<div id="goSearchMyCard">추천받기</div>
			</div>
		</div>
	</div>
	<div id="aboutContainer">
		<p>나의 소비습관에 딱 맞는 카드로 최고의 금전 사용 시나리오를 만들어보세요</p>
		<div id="aboutContents">
			<div id="aboutImg1" class="aboutImgs" style="float: left">
				<img alt="" src="./source/svg/intro1.svg">
			</div>
			<div class="aboutContexts" style="float: right">
				<p id="aboutContext1">
					당신이 사용하는 카드는<br> 당신의 생활패턴에<br> 맞추어져 있나요?
				</p>
			</div>
			<div id="aboutImg2" class="aboutImgs" style="float: right">
				<img alt="" src="./source/svg/intro2.svg">
			</div>
			<div class="aboutContexts" style="float: left">
				<p id="aboutContext2">
					이왕 쓰는 돈이라면 가장 합리적으로!<br> 당신에게 가장 맞는 카드로 <br> 숨은 포인트 까지
					챙겨드릴게요
				</p>
			</div>
		</div>


		<div id="adventageContainer">
			<div id="adventage1" class="adventage">
				<img alt="" src="./source/svg/advetage1.svg">
				<p>나에게 필요한 혜택들만 최대한으로</p>
				<p>고르고 골라서 최고의 효율을 낼 수 있는 카드를 GET!!</p>
			</div>
			<div id="adventage2" class="adventage">
				<img alt="" src="./source/svg/advetage2.svg">
				<p>카드가 필요해?</p>
				<p>카드핏에서 딱 맞춰주는데 아무거나 쓸거야?</p>
			</div>
			<div id="adventage3" class="adventage">
				<img alt="" src="./source/svg/advetage3.svg">
				<p>맞춤카드라고 골랐더니 검색결과 이렇게 많아?</p>
				<p>타이트하게 딱 맞춘 카드들로!</p>
			</div>
		</div>
	</div>


	<div id="searchMyCardContainer">
		<div class="introduceBox">
			<div id="typingContainer">
				<div class="typing-txt">안녕하세요? 나를 위한 맞춤형 자산 사용 설계 서비스 카드핏 입니다.</div>
				<div class="typing-txt"><br></div>
				<div class="typing-txt">당신에게 맞춤형 카드를 추천해드리기위해 당신에 대해 알고 싶어요!</div>
				<div class="typing-txt">당신에게 가상의 상황을 드릴게요 :)</div> 
			</div>
			<p class="typing"></p>
		</div>
		<div id="cardMessageBox">
			<img alt="" src="./source/svg/profile.svg">
			<p>카드핏 메시지</p>
			<p>새로운 메시지가 있습니다.</p>
			<div id="messageBtn">
				<input type="button" id="goTestBtn" value="메시지 보기">
			</div>
		</div>
	</div>


	<div id="cardRankingContainer">
		<div id="rankingTitleBox">
			<h1>카드랭킹</h1>
			<p>카드 실시간 인기순위</p>
		</div>
		<div id="tabBtnContainer">
			<input type="radio" id="totalRanking" checked="checked">
			<label for="totalRanking">통합</label>
			<input type="radio" id="companyRanking">
			<label for="companyRanking">카드사별</label>
			<input type="radio" id="rewordRanking">
			<label for="rewordRanking">혜택별</label>
			<input type="radio" id="feeRanking">
			<label for="feeRanking">실적/회비별</label>
		</div>
		<div id="changAjaxContainer">
			
		</div>
	</div>
	<footer>
		<div id="leftContainer">
			<p>상담사 고객님의 로그인은 아래 버튼을 클릭하세요</p>
			<a href="ManagerLogin.do">상담원/관리자 전용</a>
		</div>
		<div id="rightContainer">
			<p>서울 강남구 강남대로78길 8 한국빌딩 4F, 8F &nbsp&nbsp&nbsp 제작자 : 김성식 &nbsp&nbsp&nbsp 문의 : kss950708@naver.com </p>
		</div>
	</footer>

	<script type="text/javascript" src="./js/jquery.js"></script>
	<script type="text/javascript">
		$('#goTestBtn').on('click',function(){
			window.location.href = "SearchCardTest.do"
			});
			
	
		var typingBool = false;
		var typingIdx = 0;

		function showcardMessageBox() {
		  $("#cardMessageBox").fadeIn(); // 나타내기
		}

		var typingTxt = [];

		$(".typing-txt").each(function() {
		  typingTxt.push($(this).text().split("")); // 한글자씩 자른 후 배열에 추가
		});

		if (typingBool == false) {
		  typingBool = true;
		  var tyInt = setInterval(typing, 10); // 반복동작, 타이핑 속도제어 
		}

		function typing() {
		  if (typingIdx < typingTxt.length) {
		    var currentTxt = typingTxt[typingIdx]; // 현재 처리중인 텍스트 배열

		    if (currentTxt.length > 0) {
		      $(".typing").append(currentTxt[0]); // 한글자씩 이어준다.
		      currentTxt.splice(0, 1); // 처리된 글자 삭제
		    } else {
		      typingIdx++; // 다음 텍스트 배열로 이동
		      $(".typing").append("<br>"); // 줄바꿈 처리
		    }
		  } else {
		    clearInterval(tyInt);
		    showcardMessageBox();
		  }
		}

		// 이미지 슬라이드 관련 변수
		var index = 0;
		var bannerContents = document.querySelectorAll('.bannerContents');

		// 함수를 통해 이미지와 코멘트를 변경
		function changeImageAndComment() {
			bannerContents.forEach(function(content, i) {
				if (i === index) {
					content.style.display = 'block'; // 현재 인덱스에 해당하는 요소 보이기
				} else {
					content.style.display = 'none'; // 나머지 요소 숨기기
				}
			});

			index = (index + 1) % bannerContents.length;
		}

		// 초기 상태 설정
		bannerContents.forEach(function(content, i) {
			if (i === 0) {
				content.style.display = 'block'; // 첫 번째 요소만 보이기
			} else {
				content.style.display = 'none'; // 나머지 요소 숨기기
			}
		});

		// 3초마다 이미지와 코멘트 변경
		setInterval(changeImageAndComment, 3000);

		$(document).ready(function() {
			$("#goSearchMyCard").on('click', function(event) {
				var scrollTo = 3000;
				event.preventDefault();
				$('html, body').animate({
					scrollTop : scrollTo
				}, 300);
			});
		});
		
		 $('#totalRanking').on('click', function(event) {
			    event.preventDefault();

			    var cachedData = $('#changAjaxContainer').data('totalRankingCachedData');
			    if (cachedData) {
			      $('#changAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'TotalRanking.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changAjaxContainer').html(response).show();
			          $('#changAjaxContainer').data('totalRankingCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		 
		 $('#companyRanking').on('click', function(event) {
			    event.preventDefault();

			    var cachedData = $('#changAjaxContainer').data('companyRankingCachedData');
			    if (cachedData) {
			      $('#changAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'CompanyRanking.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changAjaxContainer').html(response).show();
			          $('#changAjaxContainer').data('companyRankingCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		 
		 $('#rewordRanking').on('click', function(event) {
			    event.preventDefault();

			    var cachedData = $('#changAjaxContainer').data('rewordRankingCachedData');
			    if (cachedData) {
			      $('#changAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'RewordRanking.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changAjaxContainer').html(response).show();
			          $('#changAjaxContainer').data('rewordRankingCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		 
		 $('#feeRanking').on('click', function(event) {
			    event.preventDefault();

			    var cachedData = $('#changAjaxContainer').data('feeRankingCachedData');
			    if (cachedData) {
			      $('#changAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'FeeRanking.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changAjaxContainer').html(response).show();
			          $('#changAjaxContainer').data('feeRankingCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		 
		 
 		   $(document).ready(function() {
		     var url = "TotalRanking.do";
		     
		     $.ajax({
		       url: url,
		       type: 'GET',
		       success: function(response) {
		         $('#changAjaxContainer').html(response).show();
		       },
		       error: function(xhr, status, error) {
		         console.error(error);
		       }
		     });
		   });
 
		   
	</script>
</body>
</html>