// 아이디 공백 입력 불가
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


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록
		document.form.roadFullAddr.value = roadFullAddr;
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
		/** 2017년 2월 추가제공 **/
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
		/** 2017년 3월 추가제공 **/
		document.form.emdNo.value = emdNo;
		
}
