<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/./css/login.css">
<!--회원가입-->
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<!--페이지 안-->
<div class="container">
      <div class="row">
        <div class="login-wrap">
          <div class="login-html">
            <h5>LOGIN</h5>
              <div class="login-form">
              <form method="post" action="/loginPost">
                <div class="sign-in-htm">
                  <div class="group">
                    <label for="luser_id" class="label">아이디</label> <input
                      id="luser_id" name="user_id" type="text" class="input">
                  </div>
                  <div class="group">
                    <label for="luser_password" class="label">비밀번호</label> <input
                      id="luser_password" name="user_password" type="password"
                      class="input" data-type="password">
                  </div>
                  <div class="group">
                    <input id="check" type="checkbox" class="check" checked> <label
                      for="check" class="label"><span class="icon"></span> 아이디
                      저장</label>
                  </div>
                  <div class="group">
                    <input type="submit" class="button" value="로그인" id="loginSubmit">
                  </div>
                  <div class="registerr"><a class="register_link" href="/register">아이디가 없으신가요?</a>
                  </div>
                </div>
              </form>
            </div>
        </div>
      </div>
    </div>
<%@include file="footer.jsp"%>