<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<link href="${pageContext.request.contextPath}/css/post.css"
	rel="stylesheet">


	<!-- Post Content -->
	<div class="container">
		<!-- Latest Posts -->
		
		<div class="container">
			<main class="col-lg-8">
			<div class="post-single">
				<div class="post-thumbnail">
					<img src="${pageContext.request.contextPath}/${content.img_path}" alt="..." class="img-fluid">
				</div>
				<div class="post-details">
					<h2>${content.place_name }</h2>
					<div class="post-body">
						<img class="icon" src="${pageContext.request.contextPath}/img/info.png"> <strong>
							기본정보</strong>
						<p class="lead">
							주소: ${content.place_addr }<br> 이용시간: ${content.place_time }<br>
							전화번호: ${content.place_call }
						</p>
						<br> <img class="icon" src="${pageContext.request.contextPath}/img/location.png"> <strong>
							장소소개</strong>
						<p class="lead">${content.place_intro }</p>
						<br> <img class="icon" src="${pageContext.request.contextPath}/img/stroller.png"> <strong>
							이동정보</strong>
						<p class="lead">${content.place_move }</p>
						<br> <img class="icon" src="${pageContext.request.contextPath}/img/kids.png"> <strong>편의시설</strong>
						<p class="lead">
							${content.place_feeding } 수유실<br> 
							${content.place_diaper } 기저귀교환대<br>
							${content.place_stroller } 유모차 대여<br>
							${content.place_smove } 유모차 여유공간<br>
							${content.place_chair } 아기의자<br>
							${content.place_play } 놀이시설<br>
						</p>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<br>

<%@include file="../footer.jsp" %>