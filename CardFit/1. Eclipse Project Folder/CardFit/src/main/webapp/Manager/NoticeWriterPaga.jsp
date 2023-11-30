<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <style type="text/css">
	#writerContainer{
		position: relative;
		top:3vh;
		width:80%;
		margin:0 auto;
	}
	#writerContainer input[type=text]{
	width: 85%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

#writerContainer input[type=submit] {
	position: relative;
	margin: 2vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
}
form p{
	display: inline-block;
}

#emphasis{
	border: 1px solid #DADADB;
	padding: 100px;
	border-radius: 4px;
}
  </style>
</head>
<body>
	<div id="writerContainer">
		<form action="insertNotice.do" method="post">
			<input type="text" name="title" placeholder="공지사항의 제목을 입력하세요">
			<p>중요공지<input type="checkbox" name="emphasis" id="emphasis"><p>
			<textarea id="summernote" name="editordata"></textarea>
			<input type="submit" value="등록">
		</form>
	</div>
	<script>
    $(document).ready(function() {
        $('#summernote').summernote({
  		  height: 350,
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '공지사항 내용을 입력해주세요'	//placeholder 설정
  		  });
    });
  </script>
</body>
</html>