<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.login-form {
	margin: 120px 0px 130px 0px;
}

.form-floating input:focus {
	border: 2px solid #ffffff;
	box-shadow: 0 0 5px #ffffff;
}

.id-pw-find {
	text-align: center;
	margin: 40px 10px;
	font-size: small;
}

.btn.btn-primary.w-100.py-2 {
	border: 0;
	border-radius: 0;
}

.container_bottom {
	width: 500px;
	padding: 30px;
	margin: 40px auto;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="sign-in.css" rel="stylesheet">
</head>

<body>
	<form action="login" method="post" name="logincheck" class="login-form">
		<div class="container_bottom">
			<p style="font-size: 23px;">
				<strong>로그인</strong>
			</p>
			<div class="form-floating">
				<input class="form-control" type="text" name="userId" id="inputId"
					value="${rememberedUserId}"> <input class="form-control"
					type="password" name="password" id="inputPw">
			</div>

			<div style="font-size: small; margin-top: 10px; margin-bottom: 10px;">
				<input type="checkbox" class="custom-control-nput" id="customCheck"
					name="customCheck" ${checked} />&nbsp; 로그인 정보 기억하기 <a
					href="pw-searchForm" style="float: right;">비밀번호 찾기 &nbsp;</a><a
					href="id-searchForm" style="float: right;">아이디 찾기 /&nbsp;</a>
			</div>

			<div class="login_bottom" style="margin-top: 10px;">

				<button class="btn btn-primary w-100 py-2" type="submit"
					style="background-color: #e28b3a;" id="loginBtn">로그인</button>
				<button class="btn btn-primary w-100 py-2"  type="button"
					onclick="redirectToKakaoLogin()" 
					style="background-color: #f6eddf; color: #463528;">카카오로
					시작하기</button>
			</div>

			<div class="id-pw-find">
				<hr>
				<br> <span style="font-size: small;">사용중이신 SNS로 간편하게
					로그인하세요!</span> &nbsp; &nbsp; &nbsp; <a
					href="https://kauth.kakao.com/oauth/authorize?client_id=앱키를 입력하세요&redirect_uri=uri를 입력하세요&response_type=code">
					<img alt="카카오 로그인" src="/dog/image/kakao.png"
					style="margin-bottom: 5px;" height="30"> &nbsp;
				</a> <a
					href="https://nid.naver.com/oauth2.0/authorize?client_id=앱키를 입력하세요&redirect_uri=uri를 입력하세요&response_type=code">
					<img alt="네이버 로그인" src="/dog/image/naver.png" height="30">
				</a>
			</div>
		</div>
	</form>

	<script type="text/javascript">
	
	<c:if test="${loginFailed==true}">
	alert('회원정보가 일치하지 않습니다.');
	</c:if>
	<c:if test="${mailSent==true}">
	alert('회원님의 비밀번호를 메일로 발송하였습니다.');
	</c:if>
	
		function redirectToKakaoLogin() {
			window.location.href = "https://kauth.kakao.com/oauth/authorize?client_id=앱키를 입력하세요&redirect_uri=uri를 입력하세요&response_type=code";
		}

		$(document)
				.ready(
						function() {
							var rememberedUserId = getCookie("rememberedUserId");

							if (rememberedUserId) {
								$("input[name='customCheck']").prop('checked',
										true);
							}

							$('#loginBtn')
									.click(
											function() {
												var id = $('#inputId').val();
												var customCheck = $(
														'#customCheck').is(
														':checked');

												if ($('#customCheck').is(
														':checked')) {
													document.cookie = "rememberedUserId="
															+ id
															+ "; expires="
															+ new Date(
																	new Date()
																			.getTime()
																			+ 30
																			* 24
																			* 60
																			* 60
																			* 1000)
																	.toUTCString();


												} else {
													document.cookie = "rememberedUserId=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
												}

												// AJAX 

													$
															.ajax({
																type : 'post',
																url : '${pageContext.request.contextPath}/',
																data : {
																	user_id : id,
																	user_pw : pw,
																	remember_userId : customCheck,
																},
																success : function(
																		data) {
																	console
																			.log(data);
																}
															});

											});
						});

		function getCookie(name) {
			var value = "; " + document.cookie;
			var parts = value.split("; " + name + "=");
			if (parts.length === 2) {
				return parts.pop().split(";").shift();
			}
		}
	</script>
</body>
</html>
