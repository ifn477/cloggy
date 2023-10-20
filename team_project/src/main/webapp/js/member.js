/* 아이디 체크 */
$(function(){
    $("#button1").click(function(){
        var userId = $("#userId").val();
        
        if (!userId) {
        alert("공백 입력 불가");
        }
        else{
        $.ajax({
            type: "post",
            async: true,
            url: "idcheck",
            data: {"userId": userId},
            success: function(result) {
                if (result == "ok") {
                    alert("사용가능 ID");
                } else {
                    alert("사용중인 ID");
                }
            },
            error: function() {
                alert("에러");
            }
        });
        }
    });
});

/* 회원 탈퇴 확인 */
$(document).ready(function() {
		$("#button2").click(function() {
			var confirmation = confirm('탈퇴 하시겠습니까?\n'+'회원님의 모든 정보가 삭제됩니다.');
			if (confirmation) {
	            var userId = $(this).data("userid");
				window.location.href = "member-deleteSelf?userId=" + userId;
			}
			else{
				window.location.href = "main";
			}
		});
});

/* 주소 input */
function goPopup(){
	var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		document.memberincheck.roadFullAddr.value = roadFullAddr;
}

/* 주소 inputself */
function goPopupself(){
	var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		document.memberincheckself.roadFullAddr.value = roadFullAddr;
}


/* 메일 전송 */
$(function(){
    $("#button3").click(function(){

        var confirmation = confirm('인증 번호를 이메일로 전송합니다.');
        if (confirmation) {
		var email = $("#email").val();
		console.log(email);
            $.ajax({
                url: "mail-send",
                method: "POST",
                data: { email: email },
                success: function(data) {
                        alert("메일 전송 성공! 인증 번호를 확인하세요.");
                },
                error: function(error) {
                    alert("메일 전송 실패! 다시 시도해주세요.");
                }
            });
        }
        else {
            console.log("Email sending canceled");
        }
    });
});

/* 메일, 비밀번호 인증 */
$(function() {
    $("#button4").on("click", function() {
        var email = $("#email").val();
        var userInputKey = $("#userInputKey").val();

        if (!userInputKey) {
            alert("인증번호를 입력하세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "verifyKey",
            data: {
                email: email,
                userInputKey: userInputKey
            },
            success: function(result) {
                if (result) {
                    alert("인증 성공! 회원 가입을 계속 진행하세요.");
                    $("#button4").prop("disabled", true);
                } else {
                    alert("인증 실패! 인증번호를 확인하세요.");
                }
            },
            error: function(xhr, status, error) {
                alert("에러");
            }
        });
    });
    
    $("#form").submit(function(event) {
        if (!$("#button4").prop("disabled")) {
            event.preventDefault();
            alert("메일 인증이 완료되어야 합니다.");
        }
    });
});

/* 내정보 수정 */
$(document).ready(function() {
    $("#button5").click(function() {
        var userId = $(this).data("userid");
        window.location.href = "member-modifySelfForm?userId=" + userId;
    });
});

/* 비밀번호 중복 검사 */
function checkPassword() {
    var password = document.getElementById("password").value;
    var passwordcheck = document.getElementById("passwordcheck").value;

    if (password !== passwordcheck) {
        alert("비밀번호가 일치하지 않습니다.");
        document.getElementById("passwordcheck").value = "";
    } else {
        alert("비밀번호가 일치합니다.");
    }
}

/* 약관 동의 */
function openTermsPopup1() {
    window.open('member-terms1', '약관 내용(필수)', 'width=600,height=400');
}

function openTermsPopup2() {
    window.open('member-terms2', '약관 내용(선택)', 'width=600,height=400');
}
function closePopup() {
    window.close();
}
/* 약관 동의 체크박스 */
function checkAllTerms() {
    var checkAll = document.getElementById('checktermsall').checked;
    document.getElementById('checkterms1').checked = checkAll;
    document.getElementById('checkterms2').checked = checkAll;
}
