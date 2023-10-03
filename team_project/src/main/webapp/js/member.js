// 아이디 체크
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

// 회원 탈퇴 확인
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

// 주소 api (input)
function goPopup(){
	var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,addrDetail){
		document.form.roadFullAddr.value = roadFullAddr;
		/**
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		document.form.emdNo.value = emdNo;
		**/
		
}

$(function(){
    $("#button3").click(function(){
        var confirmation = confirm('인증 번호를 이메일로 전송합니다.');
        if (confirmation) {
            var email = $("#email").val();
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

$(function() {
    $("#button4").on("click", function() {
        var email = $("#email").val();
        var userInputKey = $("#userInputKey").val();

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