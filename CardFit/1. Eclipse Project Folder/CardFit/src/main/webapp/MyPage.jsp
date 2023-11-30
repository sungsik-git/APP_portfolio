<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style>
body{
	width: 1920px;
	 overflow:scroll;overflow-x:hidden;
	
}
article {
	position: relative;
	height: 69.8vh;
	width: 100%;
}
section {
	position: relative;
	width: 75.5%;
	height: 69.9vh;
	float: right;
}
.issuingContainer{
	position: relative;
    width: 1170px;
    height: 204px;
    border: 2px #DADADB solid;
    background-color: white;
    margin: 0 auto;
    box-shadow: 0px 5px 1px #DADADB;
    left: -100px;
}
.issuingContainer p{
	position:relative;
	color: #5F5F61;
	top:20px;
	left:30px;
	font-size:18;
	font-weight: 700;
}
#issuingEmptuImg{
	position: relative;
	width: 170px;
	height: 110px;
	border: dashed 2px black;
	box-shadow: -5px 5px 1px #99B3F7;
	float: left;
	margin-left: 15vw;
}
#issuingCardImg{
	position: relative;
	max-width: 170px;
	max-height: 150px;
	float: left;
	margin-left: 350px;
}
#goIssuance{
	position:relative;
	display: block;
	top: 60px;
	left: 250px;
}
#issuingComents{
	position: relative;
}
#issuingComents p{
	position: relative;
	top: 60px;
	font-size: 18px;
	font-weight: 600;
}
#issuingComents h1{
position:relative;
	font-size: 32px;
	color:#5F5F61;
	top: 70px;
	left: 30px;
} 
#changeAjaxContainer{
	position: relative;
	width: 80%;
	top:7vh;
	margin: 0 auto;
	
}

footer {
	position: relative;
/* 	border: 2px green solid;
 */	height: 5vw;
}
</style>

</head>
<body>
    <c:import url="./element/Header/Header.jsp"/>
	<article>
		<c:import url="./element/MyPageMenu/MyPageMenu.jsp"/>
		<section>
			<c:choose>
				<c:when test="${empty issuanceInfo }">
					<div class="issuingContainer">
						<p>카드 발급 현황</p>
						<div id="issuingEmptuImg"></div>
						<div id="issuingComents">
							<h1>-<br>발급중인 카드가 없어요.</h1>
						</div>
					</div>
				</c:when>
				<c:when test="${not empty issuanceInfo }">
					<c:set value="${issuanceInfo[0] }" var="info"/>
					<div class="issuingContainer">
						<p>카드 발급 현황</p>
						<img alt="" src="./CardIMG/${info.img}" id="issuingCardImg">
						<div id="issuingComents">
							<p>${info.cardName}</p><br>
							<h1>발급중</h1>
							<c:if test="${fn:length(issuanceInfo) >=2 }">
								<div id="goIssuance"><a class="issuanceMenu">발급중인 카드가 ${fn:length(issuanceInfo)-1  }건 더 있어요! 자세히 보러가기 click!</a></div>
							</c:if>
						</div>
					</div>
				</c:when>
			</c:choose>
		    <div id="changeAjaxContainer"></div>
		</section>
	</article>
	<script type="text/javascript" src="./js/jquery.js"></script>
	<script type="text/javascript">
	$(function() {
		  $('.issuanceMenu').on('click', function(event) {
		    event.preventDefault();
		    resetMenuColors(); // 모든 메뉴의 색상 초기화
		    $('#issuanceMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

		    var cachedData = $('#changeAjaxContainer').data('issuanceCachedData');
		    if (cachedData) {
		      $('#changeAjaxContainer').html(cachedData).show();
		    } else {
		      $.ajax({
		        url: 'MyPageIssuance.do',
		        type: 'GET',
		        dataType: 'html',
		        success: function(response) {
		          $('#changeAjaxContainer').html(response).show();
		          $('#changeAjaxContainer').data('issuanceCachedData', response);
		        },
		        error: function(xhr, status, error) {
		          console.error(error);
		        }
		      });
		    }
		  });
		  
		  $('#memberModifyMenu').on('click', function(event) {
		    event.preventDefault();
		    resetMenuColors(); // 모든 메뉴의 색상 초기화
		    $('#memberModifyMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

		    var cachedData = $('#changeAjaxContainer').data('modifyCachedData');
		    if (cachedData) {
		      $('#changeAjaxContainer').html(cachedData).show();
		    } else {
		      $.ajax({
		        url: 'MyPageModify.do',
		        type: 'GET',
		        dataType: 'html',
		        success: function(response) {
		          $('#changeAjaxContainer').html(response).show();
		          $('#changeAjaxContainer').data('modifyCachedData', response);
		        },
		        error: function(xhr, status, error) {
		          console.error(error);
		        }
		      });
		    }
		  });

		  
		  $('#changePWMenu').on('click', function(event) {
			    event.preventDefault();
			    resetMenuColors(); // 모든 메뉴의 색상 초기화
			    $('#changePWMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

			    var cachedData = $('#changeAjaxContainer').data('changePWCachedData');
			    if (cachedData) {
			      $('#changeAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'changePW.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changeAjaxContainer').html(response).show();
			          $('#changeAjaxContainer').data('changePWCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		  
		  $('#deleteInfoMenu').on('click', function(event) {
			    event.preventDefault();
			    resetMenuColors(); // 모든 메뉴의 색상 초기화
			    $('#deleteInfoMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

			    var cachedData = $('#changeAjaxContainer').data('deleteInfoCachedData');
			    if (cachedData) {
			      $('#changeAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'deleteInfo.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changeAjaxContainer').html(response).show();
			          $('#changeAjaxContainer').data('deleteInfoCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		  
		  $('#helpNoticeMenu').on('click', function(event) {
			    event.preventDefault();
			    resetMenuColors(); // 모든 메뉴의 색상 초기화
			    $('#helpNoticeMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

			    var cachedData = $('#changeAjaxContainer').data('noticeCachedData');
			    if (cachedData) {
			      $('#changeAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'HelpNotice.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changeAjaxContainer').html(response).show();
			          $('#changeAjaxContainer').data('noticeCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		  
		  $('#helpQNAMenu').on('click', function(event) {
			    event.preventDefault();
			    resetMenuColors(); // 모든 메뉴의 색상 초기화
			    $('#helpQNAMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

			    var cachedData = $('#changeAjaxContainer').data('QNACachedData');
			    if (cachedData) {
			      $('#changeAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'HelpQNA.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changeAjaxContainer').html(response).show();
			          $('#changeAjaxContainer').data('QNACachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		  
		  $('#helpDirectMenu').on('click', function(event) {
			    event.preventDefault();
			    resetMenuColors(); // 모든 메뉴의 색상 초기화
			    $('#helpDirectMenu').css("color", "#3368F0"); // 선택된 버튼의 색상 변경

			    var cachedData = $('#changeAjaxContainer').data('directCachedData');
			    if (cachedData) {
			      $('#changeAjaxContainer').html(cachedData).show();
			    } else {
			      $.ajax({
			        url: 'HelpDirect.do',
			        type: 'GET',
			        dataType: 'html',
			        success: function(response) {
			          $('#changeAjaxContainer').html(response).show();
			          $('#changeAjaxContainer').data('directCachedData', response);
			        },
			        error: function(xhr, status, error) {
			          console.error(error);
			        }
			      });
			    }
			  });
		  // 모든 메뉴의 색상을 초기화하는 함수
		  function resetMenuColors() {
		    $('#sideMenu ul li a').css("color", "#5F5F61");
		  }
		});

	
	</script>
</body>
</html>