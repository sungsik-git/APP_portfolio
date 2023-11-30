<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 카드 찾기 테스트</title>
<link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
body{
	width: 1920px;
 overflow:scroll;overflow-x:hidden;
}

.chat-container {
	position: relative;
	top: 15vh;
	max-width: 800px;
	margin: 0px auto;
	border: 1px solid #0042EC;
	border-radius: 5px;
	overflow: hidden;
}

.chat-header {
	background-color: #0042EC;
	padding: 15px 10px;
	color: white;
	margin-bottom: 10px;
}

.chat-header h1 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

.chat-messages {
	padding: 10px;
	height: 450px;
	overflow-y: scroll;
}

.message {
	position: relative;
	display: none; /* 메시지 숨김 */
	width: 100%;
	margin-bottom: 25px;
}

.received {
	position: relative;
	width: 100%;
}

.received .content {
	background-color: #f2f2f2;
	border-radius: 8px;
	padding: 8px 12px;
	margin-bottom : 15px;
}

.send {
	position: relative;
	width: 40%;
	right: -60%;
}

.send .content {
	position:relative;
	display:block;
	background-color: #e2f2ff;
	border-radius: 8px;
	padding: 8px 12px;
}

.r_time, .s_time {
	width: 10%;
	position: relative;
	font-size: 10px;
	color: gray;
	margin-bottom: 0;
	top: 5px;
	left: 5px;
}

.s_time{
	width: 10%;
	position: relative;
	font-size: 10px;
	color: gray;
	margin-bottom: 0;
	top: 38px;
	left: -20%;
	
}


.answer {
	width: 100%;
	border-top: #f5f5f5;
	text-align: center;
}

.answer button {
	position: relative;
	width: 70%;
	padding: 5px;
	background-color: white;
	color: #99B3F7;
	border: 2px solid #99B3F7;
	border-radius: 20px;
	cursor: pointer;
	margin: 2px auto;
	font-size: 16px;
}

.answer button:hover {
	background-color: #0042EC;
	color: white;
	border: 2px solid #0042EC;
}

.chat-messages::-webkit-scrollbar {
	display: none; /* 크롬, 사파리, 오페라, 엣지 */
}

#searchCardResult{
	text-decoration: none;
	padding: 10px 5px;
	background-color: #0042EC;
	color: white;
	position: relative;
	top: 10px;
	width:30%;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="backgroundImg"></div>
	<div class="chat-container">
		<div class="chat-header"><i class="fa-solid fa-arrow-left" style="color: #ffffff;" id="backBtn"></i> &nbsp&nbsp&nbsp 카드핏</div>
		<div class="chat-messages">
			<div class="message received group1">
				<span class="content">일어났어? </span>
				<span class="r_time">AM 07:30</span>
			</div>
			<div class="message received group1">
				<span class="content">어제 먼저 잠들었네, 늦게잤어?</span> 
				<span class="r_time">AM 07:31</span>
			</div>
			<div class="message send group2">
				<span class="s_time">AM 07:32</span>
				<span class="content" id="send1"></span>
			</div>
			<div class="message received group2">
				<span class="content">나는 나갈 준비 거의 다 했어! </span>
				<span class="r_time">AM 07:53</span>
			</div>
			<div class="message received group2">
				<span class="content">오늘 아침도 진짜 사람많다.. 역시 출근시간인가.. </span>
				<span class="r_time">AM 07:57</span>
			</div>
			<div class="message send group3">
				<span class="s_time">AM 08:02</span>
				<span class="content" id="send2"></span>
			</div>
			<div class="message received group3">
				<span class="content">아침 안 먹었더니 의자에 앉자마자 배고픈거 실화야? </span>
				<span class="r_time">AM 08:43</span>
			</div>
			<div class="message received group3">
				<span class="content">아 일 시작하기전에 점심 뭐먹을지 찾아봐야겠다 ㅋㅋ 너는 점심에 뭐 먹을꺼야? </span>
				<span class="r_time">AM 08:44</span>
			</div>
			<div class="message received group3">
				<span class="content">나 방금 배에서 소리난거 과장님이 들었잖아 ㅋㅋㅋ 창피해</span>
				<span class="r_time">AM 08:46</span>
			</div>
			<div class="message send group3">
				<span class="s_time">AM 08:52</span>
				<span class="content">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span>
			</div>
			<div class="message send group4">
				<span class="s_time">AM 08:53</span>
				<span class="content" id="send3"></span>
			</div>
			<div class="message received group4">
				<span class="content">오전에 정신없었네 점심 먹었어?</span>
				<span class="r_time">PM 12:35</span>
			</div>
			<div class="message received group4">
				<span class="content">이번에 우리회사에서 멤버십 하는데 만 원 내고 한 달에 10만원 쓰면 2만원 페이백 해주는데 어때?</span>
				<span class="r_time">PM 12:38</span>
			</div>
			<div class="message send group5">
				<span class="s_time">PM 12:43</span>
				<span class="content">더워져서 밖에 밥먹으러 가는것도 쉽지않다 ㅠㅠ</span>
			</div>
			<div class="message send group5">
				<span class="s_time">PM 12:44</span>
				<span class="content" id="send4"></span>
			</div>
			<div class="message received group5">
				<span class="content">후.. 상사한테 완전 깨졌다.. </span>
				<span class="r_time">PM 3:54</span>
			</div>
			<div class="message received group5">
				<span class="content">스트레스 받아... ㅠㅠ 이 스트레스를 뭘로 풀어야할까?</span>
				<span class="r_time">PM 3:38</span>
			</div>
			<div class="message send group6">
				<span class="s_time">PM 4:11</span>
				<span class="content">어쩌다가 ㅠㅠ 너무 속상하겠다</span>
			</div>
			<div class="message send group6">
				<span class="s_time">PM 4:12</span>
				<span class="content" id="send5"></span>
			</div>
			<div class="message received group6">
				<span class="content">여름 휴가 생각하면서 멘탈관리해야지</span>
				<span class="r_time">PM 4:28</span>
			</div>
			<div class="message received group6">
				<span class="content">너는 여름 휴가때 뭐하려고?</span>
				<span class="r_time">PM 4:29</span>
			</div>
			<div class="message send group7">
				<span class="s_time">PM 4:55</span>
				<span class="content" id="send6"></span>
			</div>
			<div class="message received group7">
				<span class="content">놀 생각에 벌써 설렌다ㅋㅋㅋ 노는 생각하니까 좀 풀리네</span>
				<span class="r_time">PM 5:42</span>
			</div>
			<div class="message received group7">
				<span class="content">곧 퇴근이다! 저녁은 어떻게 하게?</span>
				<span class="r_time">PM 5:43</span>
			</div>
			<div class="message send group8">
				<span class="s_time">PM 5:52</span>
				<span class="content" id="send7"></span>
			</div>
			<div class="message received group8">
				<span class="content">저녁먹고 빨래하고, 설거지하고, 청소기 돌리니까 하루 끝났네..</span>
				<span class="r_time">PM 9:43</span>
			</div>
			<div class="message received group8">
				<span class="content">회사에서는 오늘 집가면 일찍잘거라고 다짐했는데</span>
				<span class="r_time">PM 9:44</span>
			</div>
			<div class="message received group8">
				<span class="content">내 저녁은 지금 시작이지! 너는 저녁에 뭐해?</span>
				<span class="r_time">PM 9:45</span>
			</div>
			<div class="message send group9">
				<span class="s_time">PM 9:47</span>
				<span class="content">아니 미쳤어 벌써 10시 다된거야? 이게 말이 돼?</span>
			</div>
			<div class="message send group9">
				<span class="s_time">PM 9:48</span>
				<span class="content" id="send8"></span>
			</div>
			<div class="message received group9">
				<span class="content">그래도 나름 알차게 보냈는데?</span>
				<span class="r_time">PM 11:17</span>
			</div>
			<div class="message received group9">
				<span class="content">나는 이제 슬슬 씻고 잘 준비해야겠다! 오늘 하루도 고생했어!</span>
				<span class="r_time">PM 11:18</span>
			</div>
			<div class="message received group9">
				<span class="content">안온한 밤 되길 바랄께! 잘자!</span>
				<span class="r_time">PM 11:19</span>
			</div>
			<div class="message send group9">
				<span class="s_time">PM 11:25</span>
				<span class="content">너도 잘자!! 굿나잇</span>
			</div>
		</div>

		<div class="message received answer" id="answer1">
			<form id="answerForm" action="" method="post">
				<button type="button" value="20~60">응... 일어났어 이제 출근준비해야지</button>
				<button type="button" value="10~20">어제 숙제하느라 늦게잤어ㅠㅠ 5분만 더 잘래</button>
				<button type="button" value="20~30">오늘 교수님한테 아프다고 하고 가지말까</button>
				<button type="button" value="10~50">어제 게임하느라 늦게 잤어 ㅋㅋ 좀 더 자야지</button>
				<button type="button" value="30~70">벌써 일어나서 가족들 아침 차려놨지~^^..</button>
			</form>
		</div>
		<div class="message received answer" id="answer2">
			<form id="answerForm" action="" method="post">
				<button type="button" value="대중교통">버스/지하철은 진짜 지옥이야 ㅠㅠ</button>
				<button type="button" value="차량점검">내가 태워다줄게 집 앞에서 전화하면 나와!</button>
				<button type="button" value="택시">하하..나는 늦어서 택시불렀어</button>
				<button type="button" value="공과금/관리비">이 시간에 집에 있는게 얼마나 행복한지 몰라</button>
				<button type="button" value="자전거">너도 자전거로 다녀! 생각보다 한적해!</button>
			</form>
		</div>
		<div class="message received answer" id="answer3">
			<form id="answerForm" action="" method="post">
				<button type="button" value="편의점">나 그냥 대충 편의점에서 먹으려고 저녁에 맛있는 거 먹어야지!</button>
				<button type="button" value="베이커리">햄버거나 샌드위치 같은 빵이나 먹으려고!</button>
				<button type="button" value="오프라인쇼핑">나 요즘 요리에 취미생겨서 집에서 도시락 싸오잖아 ㅋㅋ</button>
				<button type="button" value="온라인쇼핑몰">체중관리하느라 다이어트 도시락이랑 닭가슴살 먹어야해 ㅠㅜ</button>
				<button type="button" value="음식점">한식으로 든든하게 먹어야 오후에 소처럼 일하지!</button>
			</form>
		</div>
		<div class="message received answer" id="answer4">
			<form id="answerForm" action="" method="post">
				<button type="button" value="999999">오 진짜? 너무 좋은데? 나도 가입하고싶다!</button>
				<button type="button" value="0">복잡하구 나는 그런거 잘 못 챙겨서 맨날 손해보더라고 ㅠㅠ</button>
			</form>
		</div>
		<div class="message received answer" id="answer5">
			<form id="answerForm" action="" method="post">
				<button type="button" value="고속도로통행료">노래 틀어놓고 드라이브하는게 제일이야!!</button>
				<button type="button" value="OTT">방에 틀어박혀서 밀린드라마 보면 힐링돼 ㅠㅠ</button>
				<button type="button" value="배달앱">매운게 최고야! 우리집으로 와 닭발 시켜둘게!</button>
				<button type="button" value="반려동물">집에서 기다리는 강아지/고양이를 보면 화가 싹 풀려!</button>
				<button type="button" value="명품">사고싶다고 생각만 했던 것 들을 사면 기분이 좋아지지</button>
			</form>
		</div>
		<div class="message received answer" id="answer6">
			<form id="answerForm" action="" method="post">
				<button type="button" value="항공">이번에 코로나 종식기념 해외여행!</button>
				<button type="button" value="반려동물">우리집 강아지/고양이랑 시간좀 보내려구!</button>
				<button type="button" value="차량">그냥 바람쐬러 가까운데 나갔다오려구 차가 많이 밀리려나..?</button>
				<button type="button" value="호텔">호캉스가 짱이야.. 푹 쉬다가 와야지</button>
				<button type="button" value="OTT">밀린 드라마랑 보려고 했던 영화 다봐야지!!</button>
			</form>
		</div>
		<div class="message received answer" id="answer7">
			<form id="answerForm" action="" method="post">
				<button type="button" value="오프라인쇼핑">주말에 장봐둔 걸로 대충 만들어먹게ㅋㅋ 빨리 집가고싶다..</button>
				<button type="button" value="배달앱">다 귀찮아서 배달시켜 먹으려고! 너도 올래?</button>
				<button type="button" value="온라인쇼핑">쿠팡에 주문한 음식들이 냉동고에 한가득이야 ㅋㅋ</button>
				<button type="button" value="베이커리">저녁은 간단하게 빵으로!</button>
			</form>
		</div>
		<div class="message received answer" id="answer8">
			<form id="answerForm" action="" method="post">
				<button type="button" value="공과금/관리비">나도 집 청소하고 밀린 빨래하고.. 하루가 끝났잖아 ㅠㅠ</button>
				<button type="button" value="유튜브프리미엄">가족들이랑 밥먹고 시체처럼 누워서 휴대폰만 보는중 ㅋㅋㅋ</button>
				<button type="button" value="반려동물">밥먹고 댕댕이랑 산책다녀왔어!</button>
				<button type="button" value="게임">지금 게임중!! 끝나면 연락할게!</button>
				<button type="button" value="온라인쇼핑">아이쇼핑 했더니 시간이 이렇게 된지도 몰랐네.. 또 질러버렸잖아</button>
			</form>
		</div>
		<div class="message received answer" id="answer9">
			<a href="#" id="searchCardResult">결과 보러가기</a>
		</div>
	</div>
	<script type="text/javascript" src="./js/jquery.js"></script>
<script>
	function handleMessage(groupNo, delay, onCompleted) {
		let index = 0;
		let messages = document.querySelectorAll('.chat-messages .group' + groupNo);

		function showMessage() {
			if (index < messages.length) {
				messages[index].style.display = 'block';
				messages[index].scrollIntoView({
					behavior: 'smooth',
					block: 'end'
				});
				index++;
				setTimeout(showMessage, delay);
			} else {
				onCompleted();
			}
		}

		showMessage();
	}



	// handle messages and answers
	handleMessage(1, 100, function () {
		document.getElementById('answer1').style.display = 'block';

		const answerButtons1 = document.querySelectorAll('#answer1 button');
		answerButtons1.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(1, 2, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons2 = document.querySelectorAll('#answer2 button');
		answerButtons2.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(2, 3, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons3 = document.querySelectorAll('#answer3 button');
		answerButtons3.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(3, 4, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons4 = document.querySelectorAll('#answer4 button');
		answerButtons4.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(4, 5, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons5 = document.querySelectorAll('#answer5 button');
		answerButtons5.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(5, 6, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons6 = document.querySelectorAll('#answer6 button');
		answerButtons6.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(6, 7, event); // 수정된 부분: event 추가
			});
		});
		const answerButtons7 = document.querySelectorAll('#answer7 button');
		answerButtons7.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(7, 8, event); // 수정된 부분: event 추가
			});
		});

		const answerButtons8 = document.querySelectorAll('#answer8 button');
		answerButtons8.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(8, 9, event); // 수정된 부분: event 추가
			});
		});
		const answerButtons9 = document.querySelectorAll('#answer9 button');
		answerButtons9.forEach(function (button) {
			button.addEventListener('click', function (event) {
				handleAnswerClick(9, 9, event); // 수정된 부분: event 추가
			});
		});
	});



	const data = [];

	function handleAnswerClick(answerGroupId, contentGroupId, event) {
	  const selectedButton = event.target; // 클릭된 버튼 요소 가져오기
	  const buttonValue = selectedButton.getAttribute('value'); // 버튼 요소의 value 속성 가져오기

	  document.getElementById('answer' + answerGroupId).style.display = 'none';
	  handleMessage(contentGroupId, 100, function () {
	    document.getElementById('answer' + (answerGroupId + 1)).style.display = 'block';
	  });

	  const sendContentId = 'send' + answerGroupId;
	  document.getElementById(sendContentId).innerText = selectedButton.innerText;

	  // 배열에 button의 value 추가
	  data.push(buttonValue);
	}

	function sendData(controllerURL, data) {
	  // 클라이언트 측에서 커맨드로 넘긴 값 확인
	  console.log('Command Values:', data);

	  // 서버로 데이터 전송
	  $.ajax({
	    url: controllerURL,
	    type: 'POST',
	    data: {
	      'data': data
	    }, // 데이터를 쿼리 문자열로 직렬화
	    traditional: true, // 데이터 형식 설정
	    success: function (response) {
	      console.log('Server Response:', response);
	      window.location.href="SearchCardResult.do";
	    },
	    error: function (error) {
	      console.log('Error:', error);
	    },
	  });
	}

	$('#searchCardResult').on('click', function () {
	  const controllerURL = 'searchCard.do'; // 실제 컨트롤러 URL로 변경
	  sendData(controllerURL, data);
	});

	$('#backBtn').on('click', function(){
		history.back();
	})
</script>

</body>
</html>