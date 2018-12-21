<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/./css/register.css">
<!--회원가입-->
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function checkz() {
		var getName = RegExp(/^[가-힣]+$/);
		var getCheck = RegExp(/^[a-z0-9]{4,12}$/);

		if ($("#user_name").val() == "") {
			alert("이름을 입력해주세요");
			$("#user_name").focus();
			return false;
		}
		//이름 유효성
		if (!getName.test($("#user_name").val())) {
			alert("이름은 한글로 입력해주세요");
			$("#user_name").val("");
			$("#user_name").focus();
			return false;
		}

		//아이디 공백 확인
		if ($("#user_id").val() == "") {
			alert("아이디 입력해주세요");
			$("#user_id").focus();
			return false;
		}

		//아이디 유효성 검사
		if (!getCheck.test($("#user_id").val())) {
			alert("ID는 영어소문자와 숫자를 이용하여 4~12자로 입력해주세요");
			$("#user_id").val("");
			$("#user_id").focus();
			return false;
		}

		if ($("#user_nickname").val() == "") {
			alert("닉네임을 입력해주세요");
			$("#user_nickname").focus();
			return false;
		}
		//비밀번호 공백 확인
		if ($("#user_password").val() == "") {
			alert("패스워드를 입력해주세요");
			$("#user_password").focus();
			return false;
		}
		//비밀번호
		if (!getCheck.test($("#user_password").val())) {
			alert("패스워드는 영어소문자와 숫자를 이용하여 4~12자로 입력해주세요");
			$("#user_password").val("");
			$("#user_password").focus();
			return false;
		}

		//아이디랑 비밀번호랑 같은지
		if ($("#user_id").val() == ($("#user_password").val())) {
			alert("비밀번호가 ID와 동일하면 안됩니다");
			$("#user_password").val("");
			$("#user_password").focus();
		}

		//비밀번호 똑같은지
		if ($("#user_password").val() != ($("#user_cpassword").val())) {
			alert("비밀번호가 서로 일치하지않습니다.");
			$("#user_password").val("");
			$("#user_cpassword").val("");
			$("#user_password").focus();
			return false;
		}
		return true;
	}
</script>
<div class="container">
      <div class="row">
        <div class="login-wrap">
          <div class="login-html">
            <h5>JOIN</h5>
              <div class="login-form">
                <div class="sign-up-htmm">
                  <form onsubmit="return checkz()" method="post" action="/register">
                  <div class="group">
                    <label for="user_name" class="label">이름</label> <input
                      id="user_name" type="text" name="user_name" class="input">
                  </div>
                  <div class="group">
                    <label for="user_id" class="label">아이디</label> <input id="user_id"
                      name="user_id" type="text" class="input">
                  </div>
                  <div class="group">
                    <label for="user_nickname" class="label">닉네임</label> <input
                      id="user_nickname" name="user_nickname" type="text" class="input">
                  </div>
                  <div class="group">
                    <label for="user_password" class="label">비밀번호</label> <input
                      id="user_password" name="user_password" type="password"
                      class="input">
                  </div>
                  <div class="group">
                    <label for="user_cpassword" class="label">비밀번호 확인</label> <input
                      id="user_cpassword" type="password" class="input">
                  </div>
                  <div class="gender" align="center">
                    <label class="radio-inline"> <input type="radio"
                      name="user_sex" id="gw" value="f" /> <label for="gw">여성</label>
                    </label> <label class="radio-inline"> <input type="radio"
                      name="user_sex" id="gm" value="m" /> 남성
                    </label>
                  </div>
                  <div class="group">
                    <input type="submit" class="button" value="가입하기" id="signUpSubmit">
                  </div>
                  <div class="registerr"><a class="register_link" href="/login">아이디가 이미 있으신가요?</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<script>
	var msg = "${msg}";
	if (msg === "REGISTERED") {
		alert("회원가입이 완료되었습니다. 로그인해주세요~");
	} else if (msg == "FAILURE") {
		alert("아이디와 비밀번호를 확인해주세요.");
	}
</script>

<%@include file="footer.jsp"%>