<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/./css/login.css">

<script type="text/javascript">
	alert("아이디와 비밀번호를 확인해주세요.");
	self.location = "/login";
</script>

<%@include file="footer.jsp"%>