<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="${pageContext.request.contextPath}/css/place.css"
	rel="stylesheet">

<div class="container">

	<!-- Page Heading -->
	<h1 class="my-4">
		장소추천 <small>아이와 함께 어디갈까?</small>
	</h1>
	<form id="checkPlaceForm" method="post" action="/place/list/search">
		<div class="checkplace">
			필요한 편의시설이 있으신가요?
			<table class="checktable">
				<tr>
					<td><input type="checkbox" name="searchItem"
						value="place_feeding"> 수유실</td>
					<td><input type="checkbox" name="searchItem"
						value="place_diaper"> 기저귀 교환대</td>
					<td><input type="checkbox" name="searchItem"
						value="place_stroller"> 유모차 대여</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="searchItem"
						value="place_smove"> 유모차 여유공간</td>
					<td><input type="checkbox" name="searchItem"
						value="place_chair"> 아기의자</td>
					<td><input type="checkbox" name="searchItem"
						value="place_play"> 놀이시설</td>
					<td class="tablebtn"><button type="submit"
							class="btn btn-default">확인</button></td>
				</tr>
			</table>
		</div>
	</form>
	<div class="row" style="margin-top: 24px;">
	<c:choose>
		<c:when test="${fn:length(placeBoardList) > 0}">
			<c:forEach items="${placeBoardList}" var="place">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="/place/read?contentIdx=${place.place_idx}"><img
							class="card-img-top"
							src="${pageContext.request.contextPath}/${place.img_path}" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="/place/read?contentIdx=${place.place_idx}">${place.place_name}</a>
							</h4>
							<c:choose>
								<c:when test="${fn:length(place.place_intro) > 100}">
									<p class="card-text">${fn:substring(place.place_intro,0,100)}...</p>
									<div class="icon-table">
										<table class="faciltiestable">
											<tr>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_feeding eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/feeding.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/nofeeding.png">
														</c:otherwise>
													</c:choose></td>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_diaper eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/diaper.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/nodiaper.png">
														</c:otherwise>
													</c:choose></td>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_stroller eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/stroller.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/nostroller.png">
														</c:otherwise>
													</c:choose></td>
											</tr>
											<tr>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_smove eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/width.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/nowidth.png">
														</c:otherwise>
													</c:choose></td>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_chair eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/childseat.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/nochildseat.png">
														</c:otherwise>
													</c:choose></td>
												<td class="icon_set"><c:choose>
														<c:when test="${place.place_play eq 'O'}">
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/slide.png">
														</c:when>
														<c:otherwise>
															<img class="facilties"
																src="${pageContext.request.contextPath}/img/convenient facilities/noslide.png">
														</c:otherwise>
													</c:choose></td>
											</tr>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<p class="card-text">${place.place_intro}</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>조회된 결과가 없습니다.</c:otherwise>
	</c:choose>
</div>
</div>



<!-- /.row -->
<!-- /.container -->


<%@include file="../footer.jsp"%>