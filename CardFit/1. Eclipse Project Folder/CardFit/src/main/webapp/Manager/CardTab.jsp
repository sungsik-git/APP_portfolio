<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./webapp/element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
/*모달창 공통 CSS 시작*/
a.button {
	position: relative;
	display: inline-block;
	padding: 10px 20px;
	text-decoration: none;
	color: #fff;
	background: #000;
	margin: 2px;
	right: 0;
}

a.button:hover {
	background: #d7d7d7;
	color: black;
}

#modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
}

.modal-con {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	max-width: 60%;
	min-height: 30%;
	background: #fff;
	z-index: 99999;
	box-shadow: gray 2px 2px;
}

.modal-con .title {
	font-size: 20px;
	padding: 7px;
	background: black;
	color: white;
}

.modal-con .con {
	font-size: 15px;
	line-height: 1.3;
	padding: 30px;
	padding-top: 10px;
}

.modal-con .close {
	display: block;
	position: absolute;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 3px solid #000;
	text-align: center;
	line-height: 30px;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	right: 10px;
	top: 5px;
}

input[name="modal_item"] {
	display: none;
}

.modal_content {
	width: 100%;
	display: none;
	padding: 10px 10px 0;
	clear: both;
}
/*모달창 공통 css 끝*/
/*카드등록 탭 시작*/
body{
	width:1920px;
	overflow: hidden;
}
#cardInsertContainer {
	position: relative;
	width: 38%;
	height: 780px;
	overflow-y: scroll;
	float: left;
	padding: 8px;
}

#insertCardTable {
	position: relative;
	width: 100%;
	height: 100%;
}

#insertCardTable tr th {
	width: 30%;
	padding-bottom: 4px;
	text-align: center;
}

#insertCardTable tr td {
	width: 35%;
	padding-bottom: 4px;
}

#showimg {
	width: 200px;
	height: 300px;
	text-align: center;
	overflow: hidden;
}

#showimg img{
	width: 80%;
}

#insertCardTable input[type=text], #insertCardTable input[type=password],
	#insertCardTable input[type=email], #insertCardTable select,
	#insertCardTable button {
	width: 80%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

#insertCardTable input[type=submit] {
	position: relative;
	margin: 2vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
}

#rightContainer {
	position: relative;
	width: 60%;
	float: right;
}

#cardCategory {
	position: relative;
	width: 80%;
	height: 180px;
	overflow-y: scroll;
}

#cardCategory>p {
	display: inline-block;
	position: relative;
	top: 2px;
	left: 6vw;
}

#cardListContainer {
	position: relative;
	width: 95%;
	height: 540px;
}

.insertCategoryModal tr td {
	padding: 3px;
}

.categoryTable {
	width: 100%;
	border-collapse: collapse;
	height: 20vh
}

.categoryTable th, .categoryTable td {
	text-align: center;
	border: 1px solid #ccc;
	font-size: 12px;
}

.categoryTable th {
	background-color: #f2f2f2;
	font-weight: bold;
	border-bottom: 1px solid black;
	border-style: double;
}


#addRowBtn {
	border: none;
	padding: 8px;
}
/*카드등록 탭 끝*/

/*카드리스트 탭 시작*/
#cardListTable {
	position: relative;
	width: 100%;
	font-size: 12px;
}

#cardListTable tr th {
	text-align: center;
	font-size: 12px;
}

#cardListTable tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 2px
}

#cardListTable input[type=checkbox] {
	padding: 8px;
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

#listDeleteBtn {
	position: relative;
	display: inline-block;
	border: none;
	float: right;
	padding: 4px;
	background-color: #FFC9C9;
	rigth: 5vw;
	border-radius: 4px;
}

#cardListTable tr td:nth-child(8), #cardListTable tr th:nth-child(8){
        width: 400px; /* 원하는 너비로 설정하세요 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 10px;
    }
</style>
</head>
<body>
	<c:import url="../ManagerPage.jsp" />
	<div id="cardInsertContainer">
		<%--데이터추가 모달 --%>
		<div class="con">
			<p>
				<img src="./source/svg/check.svg">기본정보 외 혜택은 '혜택 추가' 버튼을 눌러서
				추가해주세요
			</p>
			<form action="cardInsertOK.do" method="post"
				enctype="multipart/form-data">
				<table id="insertCardTable">
					<tr>
						<th>이미지</th>
						<td><input type="file" name="cardImg" id="cardImg"></td>
						<td rowspan="7"><div id="showimg">카드이미지 미리보기</div></td>
					</tr>
					<tr>
						<th>카드이름</th>
						<td><input type="text" name="name" placeholder="카드이름"
							required></td>
					</tr>
					<tr>
						<th>카드구분</th>
						<td>
							<select name="cardDivision">
								<option value="신용카드">신용카드</option>
								<option value="체크카드">체크카드</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>사용연령대</th>
						<td><select name="startAge" style="width:37.5%">
								<c:forEach begin="10" end="80" step="10" varStatus="status">
									<option value="${status.count *10}">${status.count * 10}</option>
								</c:forEach>
						</select> ~ <select name="endAge" style="width:37.5%">
								<c:forEach begin="10" end="80" step="10" varStatus="status">
									<option value="${status.count *10}">${status.count * 10}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>카드사</th>
						<td><select name="company">
								<c:forEach var="list" items="${companyList }">
									<option value="${list.name }">${list.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>국내 연회비</th>
						<td><input type="text" name="fee" placeholder="ex)20000"
							required></td>
					</tr>
					<tr>
						<th>해외 연회비</th>
						<td><input type="text" name="outfee" placeholder="ex)20000"
							required></td>
					</tr>
					<tr>
						<th>실적</th>
						<td><input type="text" name="record" placeholder="ex)200000"
							required></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="카드 등록"></td>
					</tr>
				</table>
			</form>
			<button id="addRowBtn">혜택 추가</button>
		</div>
	</div>
	<div id="rightContainer">
		<div id="cardCategory">
			<%--카테고리 데이터추가 모달 --%>
			<a href="javascript:openModal('modal2');" class="button modal-open">카테고리
				등록</a>
			<div class="modal-con modal2">
				<a href="javascript:;" class="close">X</a>
				<p class="title">카테고리 등록</p>
				<div class="con">
					<form action="insertLargeCategory.do" method="post">
						<table class="insertCategoryModal">
							<tr>
								<td colspan="2">
									<div class="noticeMsg">
										과도한 카테고리 생성은 <strong>이용에 불편함을 초래할 수 있습니다.</strong>
									</div>
								</td>
							</tr>
							<tr>
								<td>대분류</td>
								<td><input type="text" name="B_name" id="B_name"
									style="width: 329px"></td>
								<td><input type="submit" value="대분류 추가"
									id="insertLargeCategoryBtn"></td>
							</tr>
						</table>
					</form>
					<form action="insertSmallCategory.do" method="post">
						<table class="insertCategoryModal">
							<tr>
								<td>소분류</td>
								<td><select name="b_category" id="b_category">
										<c:forEach items="${LargeCategoryList }" var="list">
											<option value="${list.b_category }">${list.b_name }</option>
										</c:forEach>
								</select></td>
								<td><input type="text" name="s_name" id="s_name"></td>
								<td><input type="submit" value="소분류 추가"
									id="insertSmallCategoryBtn"></td>
							</tr>
						</table>
					</form>
					<div id="insertResultMsg"
						style="color: red; font-size: 0.7rem; font-weight: bold"></div>
				</div>
			</div>
			<p>카드 카테고리 관리</p>
			<table class="categoryTable">
				<tr>
					<th>대분류</th>
					<th>소분류</th>
				</tr>
				<c:forEach items="${LargeCategoryList}" var="largeCategory"
					varStatus="loop">
					<tr>
						<td>${largeCategory.b_name}</td>
						<td>${categoryList[loop.index - 1].s_name}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="cardListContainer">
			<p>카드리스트</p>
			<table id="cardListTable">
				<tr>
					<th></th>
					<th>카드이름</th>
					<th>사용연령대</th>
					<th>카드사</th>
					<th>국내 연회비</th>
					<th>해외 연회비</th>
					<th>실적</th>
					<th>혜택</th>
					<th>검색수</th>
					<th>발급수</th>
				</tr>
				<c:forEach var="list" items="${CardList }">
					<tr>
						<td><input type="checkbox" name="memberCheck"></td>
						<td>${list.name}</td>
						<td>${list.startAge}~${list.endAge }</td>
						<td>${list.company}</td>
						<td>${list.fee}</td>
						<td>${list.outfee}</td>
						<td>${list.record}</td>
						<td>${list.reword}</td>
						<td>${list.searchCnt}</td>
						<td>${list.issuanceNum}</td>
					</tr>
				</c:forEach>
			</table>
			<div id="pageBox">
				<c:set var="CardTabCurPage" value="${param.curPage }" />
				<c:if test="${CardTabCurPage eq null }">
					<c:set var="CardTabCurPage" value="0" />
				</c:if>
				<c:forEach var="i" begin="0" end="${totalPage}" step="1">
					<c:choose>
						<c:when test="${i eq CardTabCurPage}">
							<span class="page-link">${i+1}</span>
						</c:when>
						<c:when test="${i ne CardTabCurPage}">
							<a class="page-link">${i+1}</a>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
			<input type="button" value="카드삭제" id="listDeleteBtn">
		</div>
	</div>

	<script type="text/javascript" src="./webapp/js/jquery.js"></script>
	<script type="text/javascript">
		function openModal(modalname) {
			document.get
			$("#modal").fadeIn(300);
			$("." + modalname).fadeIn(300);
		}

		$("#modal, .close").on('click', function() {
			$("#modal").fadeOut(300);
			$(".modal-con").fadeOut(300);
		});

		//대분류 데이터추가 ajax
		$('#insertLargeCategoryBtn').on('click', function(event) {
			event.preventDefault(); // 기본 이벤트 동작 취소

			let B_name = $('#B_name').val();

			$.ajax({
				url : "insertLargeCategory.do",
				type : "POST",
				data : {
					"B_name" : B_name
				},
				dataType : "text",
				success : function(result) {
					if (result == 0) {
						$("#insertResultMsg").html("등록에 실패했습니다.");
					} else if (result == 1) {
						$("#insertResultMsg").html("등록에 성공했습니다.");
						location.reload();
					} else {
						console.log("error");
					}
				},
				error : function() {
					alert("서버 요청 실패");
				}
			});
		});

		//소분류 데이터 추가 ajax
		$('#insertSmallCategoryBtn').on('click', function(event) {
			event.preventDefault(); // 기본 이벤트 동작 취소

			let b_category = $('#b_category').val();
			let s_name = $('#s_name').val();

			$.ajax({
				url : "insertSmallCategory.do",
				type : "POST",
				data : {
					"b_category" : b_category,
					"s_name" : s_name
				},
				dataType : "text",
				success : function(result) {
					if (result == 0) {
						$("#insertResultMsg").html("등록에 실패했습니다.");
					} else if (result == 1) {
						$("#insertResultMsg").html("등록에 성공했습니다.");
						location.reload();
					} else {
						console.log("error");
					}
				},
				error : function() {
					alert("서버 요청 실패");
				}
			});
		});

	
		$(document)
				.ready(
						function() {
							var counter = 0; // 추가된 행의 카운터 변수

							$("#addRowBtn")
									.click(
											function() {
												if (counter <= 4) {
													// 새로운 행을 생성
													var newRow = $("<tr>");

													// 첫 번째 열(td)에 "혜택" 텍스트를 추가
													var firstCell = $("<th>")
															.text(
																	"혜택"
																			+ (counter + 1));
													newRow.append(firstCell);

													// 두 번째 열(td)에 select 요소와 input 요소를 추가
													var secondCell = $("<td colspan='2'>");

													var selectElement = $(
															"<select>")
															.attr(
																	"name",
																	"rewordCategory"
																			+ counter)
															.attr("style",
																	"width:49%;margin-right:5px;");
													<c:forEach items="${categoryList}" var="list">
													var optionElement = $(
															"<option>")
															.attr("value",
																	"${list.s_name}")
															.text(
																	"${list.s_name}");
													selectElement
															.append(optionElement);
													</c:forEach>
													secondCell
															.append(selectElement);

													var inputElement = $(
															"<input>")
															.attr("type",
																	"text")
															.attr(
																	"name",
																	"rewordRate"
																			+ counter)
															.attr(
																	"placeholder",
																	"ex)5%")
															.attr("style",
																	"width:39%; margin-right:5px;");
													secondCell
															.append(inputElement);

													var buttonElement = $(
															"<input>")
															.attr("type",
																	"button")
															.attr("id",
																	"rewordDeleteBtn")
															.attr("value", "-")
															.attr(
																	"style",
																	"width:8%; background-Color:#668ef4; padding:6px; border:none; border-radius:80px;");
													secondCell
															.append(buttonElement);

													newRow.append(secondCell);

													buttonElement
															.click(function() {
																$(this)
																		.closest(
																				"tr")
																		.remove(); // 가장 가까운 상위 <tr> 요소를 삭제
															});

													// 테이블에 새로운 행을 추가
													$(
															"#insertCardTable tr:last")
															.before(newRow);

													// 카운터 변수 증가
													counter++;
												} else {
													alert("혜택은 5개까지만 등록 가능합니다.");
													return;
												}
											});
						});

		$(document)
				.ready(
						function() {
							$('input[type="file"]')
									.on(
											'change',
											function(e) {
												var file = e.target.files[0];
												var reader = new FileReader();

												reader.onload = function(event) {
													$('#showimg')
															.html(
																	'<img src="' + event.target.result + '">');
												};

												reader.readAsDataURL(file);
											});
						});
		//페이징
		$(document).ready(function() {
			$('#cardListContainer').on('click', 'a.page-link', function(e) {
				e.preventDefault();
				var CardTabCurPage = parseInt($(this).text() - 1);
				var url = "CardTab.do?curPage=" + CardTabCurPage;

				$.ajax({
					url : url,
					data : {
						"curPage" : CardTabCurPage
					},
					type : 'GET',
					success : function(response) {
						$('body').html(response).show();
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			});
		});

		$("#listDeleteBtn").click(
				function() {
					var checkedValues = [];
					$("input[name='memberCheck']:checked").each(
							function() {
								checkedValues.push($(this).closest("tr").find(
										"td:eq(1)").text()); // 예시로 ID 값을 가져오도록 설정
							});

					if (checkedValues.length === 0) {
						alert("삭제할 데이터를 선택하세요.");
						return;
					}

					var url = "deleteCard.do?cardName=" + checkedValues;

					$.ajax({
						url : url,
						data : {
							"cardName" : checkedValues
						},
						type : 'POST',
						success : function(result) {
							alert(checkedValues + "삭제완료");
							window.location.reload();
						},
						error : function(xhr, status, error) {
							console.error(error);
						}
					});
				});
	</script>
</body>
</html>