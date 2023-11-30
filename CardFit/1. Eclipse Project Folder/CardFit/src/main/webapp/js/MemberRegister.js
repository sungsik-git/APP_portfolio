	/*nextBtn1 활성화 */
    const conditionsBox = document.getElementById("conditionsBox");
    const identificationBox = document.getElementById("identificationBox");
    function is_checked(){
        const box1 = document.getElementById("box1");
        const box2 = document.getElementById("box2");
        let is_box1 = box1.checked;
        let is_box2 = box2.checked;
        const nextBtn1 = document.getElementById("nextBtn1");

 
        let change = function(){
                conditionsBox.style.display="none";
                identificationBox.style.display="block";
                }


        if(is_box1 == true && is_box2 == true){
            nextBtn1.style.backgroundColor = "#012E40";
            nextBtn1.style.color="white";
            nextBtn1.style.cursor="pointer";
            nextBtn1.addEventListener("click", change)
            }else{
            nextBtn1.style.backgroundColor = "#e4e4e4";
            nextBtn1.style.color="#012E40";
            nextBtn1.style.cursor="default";
            $("#nextBtn1").attr("disabled ");
        }
    }
    
    const nextBtn2 = document.getElementById("nextBtn2");
    const registerForm = document.getElementById("registerForm");
    nextBtn2.addEventListener("click", function(){
        identificationBox.style.display= "none";
        registerForm.style.display="block"
    })

    
    /* id체크 */
				$('#id').on('focusout', function(){
			let id = $('#id').val();

			$.ajax({
				url : "idCheck.do",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type:  "post",			// HTTP 요청방식 (get/post)
				data: {"id": id},			// HTTP 요청과 함께 서버로 보낼 데이터
				dataType: 'text',		// 서버에서 보내줄 데이터의 타입
				// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
				success: function(result){
					if(result == 0){
						$("#idCheckMsg").html("이미 존재하는 아이디 입니다.");
					} else if(result == 1){
						$("#idCheckMsg").html("사용할 수 있는 아이디 입니다.");
					} else{
						console.log("error");
					}
				},
				error:function(){
					alert("서버요청실패");
				}
			})
		});


const pw1 = document.querySelector("#pw");
const pw2 = document.querySelector("#pwCheck");
const checkPWMsg = document.querySelector("#checkPWMsg");

console.lon(pw1);
console.log(pw2);

function checkPW(){
	if(pw1 != pw2){
		checkPWMsg.innerHTML="비밀번호가 일치하지 않습니다.";
	}else{
	checkPWMsg.innerHTML="비밀번호가 일치합니다.";
	}
}

