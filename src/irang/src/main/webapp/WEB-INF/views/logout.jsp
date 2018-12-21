<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/./css/login.css">

<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	self.location = "/";
</script>

<%@include file="footer.jsp"%>