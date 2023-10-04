
 /*회원가입 요휴성 검사*/
 
 $(function(){
	$("#button1").click(function(){
		var userId = $("#userId").val();
		$.ajax({
			type:"post",
			async:true,
			url:"idcheck",
			data:{"userId":userId},
			success:function(result){
				if(result=="ok"){
					alert("사용 가능한 ID입니다");
				}
				else{
					alert("이미 있는 ID입니다");
				}
			},	
			error:function(){
				alert("에러")
			}
		});
	});
});
 
 function memcheck() 
{
	var f = document.memberincheck;
	
		//--아이디 인증
		var cid = f.userId.value;
		var vid = /^[a-zA-Z0-9]+$/;
		if(cid=="" || cid==" ")
			{
				alert("ID를 입력해주세요");
				f.userId.select();
				return false;
			}
		if(!vid.test(cid))
			{
				alert("ID는 영문(대소문자),숫자만 입력가능합니다");
				f.userId.select();
				return false;
			}
		//--패스워드 인증
		var cpw = f.password.value;
		var vpw = /^[a-zA-Z0-9]+$/;
		if(cpw=="")
			{
				alert("패스워드를 입력해주세요");
				f.password.select();
				return false;
			}
		if(!vpw.test(cpw))
			{
				alert("패스워드는 영문과숫자만 입력가능합니다");
				f.password.select();
				return false;
			}
		//--이름 인증절차
		var cname = f.userName.value;
		var vname = /^[가-힣]+$/;
		if(cname=="" || cname==" ")
			{
				alert("이름을 입력해주세요");
				f.userName.select();
				return false;
			}
		
		if(!vname.test(cname)) 
			{
				alert("이름은 한글만 입력가능합니다");
				f.userName.select(); 
				return false;
			}
		
		var cgender = f.gender.value;
		var vgender = /^[\d]{3}-[\d]{4}-[\d]{4}$/;
		if(cgender=="")
			{
				alert("성별을 선택해주세요");
				f.gender.select();
				return false;
			}
		
		var cemail = f.email.value;
		var vemail = /^[A-Za-z0-9]*@[a-z]*\.[a-z]{2,3}$/;
		if(cemail=="")
			{
				alert("이메일을 입력해주세요");
				f.email.select();
				return false;
			}
		if(!vemail.test(cemail))
			{
				alert("잘못된 형식의 이메일입니다");
				f.email.select();
				return false;
			}

		var cphone = f.phone.value;
		var vphone = /^[\d]{3}-[\d]{4}-[\d]{4}$/;
		if(cphone=="")
			{
				alert("전화번호를 입력해주세요");
				f.phone.select();
				return false;
			}
		if(!vphone.test(cphone))
			{
				alert("010-****-**** 형식에 맞춰 작성해주세요");
				f.phone.select();
				return false;
			}
	f.submit();
}

/*상품등록 유효성 검사*/

function productcheck() 
{
	var f = document.productform;
	
		//--상품명 인증
		var cp_name = f.p_name.value;
		if(cp_name=="" || cp_name==" ")
			{
			alert("상품명을 입력해주세요");
			f.p_name.select();
			return false;
			}
		
		//--상품가격 인증 
		var cp_price = f.p_price.value;
		var vp_price = /^[\d]+$/;
		if(cp_price=="" || cp_price==" ")
			{
			alert("상품가격을 입력해주세요");
			f.p_price.select();
			return false;
			}
		if(!vp_price.test(cp_price))
			{
			alert("상품가격 숫자만 입력가능합니다");
			f.p_price.select();
			return false;
			}
		
		//--수량 인증 
		var cp_stock = f.p_stock.value;
		var vp_stock = /^[\d]+$/;
		if(cp_stock=="" || cp_stock==" ")
			{
			alert("수량을 입력해주세요");
			f.p_stock.select();
			return false;
			}
		if(!vp_stock.test(cp_stock))
			{
			alert("수량 숫자만 입력가능합니다");
			f.p_stock.select();
			return false;
			}
	f.submit();
}

/*로그인 공백방지 검사*/

 function check() 
{
	var f = document.logincheck;
		//--아이디
		var cid = f.userId.value;
		if(cid=="" || cid==" ")
			{
				alert("ID를 입력해주세요");
				f.userId.select();
				return false;
			}
		//--패스워드
		var cpw = f.password.value;
		if(cpw=="")
			{
				alert("패스워드를 입력해주세요");
				f.password.select();
				return false;
			}
	f.submit();
}
