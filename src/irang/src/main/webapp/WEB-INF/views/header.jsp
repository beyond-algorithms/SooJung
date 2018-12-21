<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>아이랑</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/clean-blog.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="${pageContext.request.contextPath}/js/clean-blog.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="/">아이랑</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          메뉴
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a class="nav-link" href="/">홈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/place/list">장소추천</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/info/culture?page=1">생활정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/board/list/all">게시판</a>
            </li>
            <c:if test="${not empty login}">
              <li class="nav-item">
                <a class="nav-link" href="/logout">로그아웃${user.user_id }</a>
              </li>
            </c:if>
            <c:if test="${empty login}">
              <li class="nav-item">
                <a class="nav-link" href="/login">로그인${user.user_id }</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/img/baby.jpg'); height: 300px; ">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
          </div>
        </div>
      </div>
    </header>