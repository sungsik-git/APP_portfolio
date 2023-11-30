<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">

#answerContainer {
margin-top:20px;
position:relative;
  width: 100%;
  height: 80%;
  
}


#answerTable {
  width: 100%;
  height: 100%;
  border-collapse: collapse;
}

#answerTable th,
#answerTable td {
  padding: 4px;
  border-bottom: 1px solid #ddd;
  text-align: left;
}

#answerTable th {
  width: 30%;
  text-align: center;
}

#answerTable td {
  width: 70%;
  max-height: 60px;
  overflow: auto;
}
textarea {
	resize: none;
	width: 100%;
	height: 80%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}
input[type=submit]{
	position:relative;
	margin:3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color:white;
	border-radius: 4px;
}


</style>
</head>
<body>
	<div id="answerContainer">
		<c:set var="dto" value="${inqirydto }"/>
		<table id="answerTable">
			<tr>
				<th>내용</th>
				<td><textarea name="answer"></textarea>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" value="${dto.num }" name="num">
					<input type="submit" value="답변등록">
				</td>			
			</tr>
		</table>
	</div>	
	<script src="./webapp/js/jquery.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
    $('body').on('click', 'input[type="submit"]', function(e) {
        e.preventDefault();
        
        var answer = $('textarea[name="answer"]').val();
        var num = $('input[name="num"]').val();

        $.ajax({
            url: 'insertAnswerOK.do',
            type: 'POST',
            data: { "answer": answer, "num": num },
            dataType: 'text',
            success: function(response) {
                alert("답변을 등록하였습니다.");
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });
});

</script>
</body>
</html>