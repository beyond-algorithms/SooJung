<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css">
<!-- Main Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-6">
			<div class="weather">
				<div class="weather_header">
					<h5>오늘 서울의 날씨는?</h5>
					<a class="more" href="/info/weather?code1=1100000000&code2=seoul&code3=seoul,kr">>> 다른지역</a>
				</div>
				<div class="weather_info">

					<table class="state-group">
						<tr>
							<td class="weather_img">
								<div class="set set_text">
									<c:choose>
										<c:when test="${icon eq '01d' || icon eq '01n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/sun.png">
										</c:when>
										<c:when test="${icon eq '02d' || icon eq '02n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/cloud1.png">
										</c:when>
										<c:when test="${icon eq '03d' || icon eq '03n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/cloud2.png">
										</c:when>
										<c:when test="${icon eq '04d' || icon eq '04n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/cloud3.png">
										</c:when>
										<c:when test="${icon eq '09d' || icon eq '09n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/rain.png">
										</c:when>
										<c:when test="${icon eq '10d' || icon eq '10n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/rain.png">
										</c:when>
										<c:when test="${icon eq '11d' || icon eq '11n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/thunderstorm.png">
										</c:when>
										<c:when test="${icon eq '13d' || icon eq '13n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/snow.png">
										</c:when>
										<c:when test="${icon eq '50d' || icon eq '50n'}">
											<img class="state"
												src="${pageContext.request.contextPath}/img/weather/mist.png">
										</c:when>
									</c:choose>
									<br> <span class="statetxt">${weatherState }</span>
								</div>
							</td>
							<td>
								<div class="day">
									<ul class="temperature">
										<li><span class="current"><em
												class="degree_code full">${temp }</em>˚</span>
										<li><span class="day_low"><em class="degree_code">${temp_min }</em>˚</span>
											<span class="slash"> / </span> <span class="day_high"><em
												class="degree_code">${temp_max }</em>˚</span></li>
									</ul>
								</div>
							</td>
						</tr>
					</table>

				</div>
			</div>
			<div class="culture">
				<div class="culture_header">
					<h5>공연정보</h5>
					<a class="more" href="/info/culture?page=1">>> 더 보기</a>
				</div>

				<div class="culture_info">
					<table class="table table-hover">
						<c:choose>
							<c:when test="${fn:length(cultureBoardList) > 0}">
								<c:forEach items="${cultureBoardList}" var="culture" begin="0"
									end="6" step="1">
									<tr>
										<td class="culture_region">${culture.area}</td>
										<td class="culture_category">${culture.realmName}</td>
										<td class="culture_name"><a href="javascript:;"
											onclick="window.open('/info/culture/detail?seq=${culture.seq}', 'detail', 'width=700 height=680 top=300')">${culture.title}</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="board">
				<div class="board_header">
					<h5>전체 게시판</h5>
					<a class="more" href="/board/list/all">>> 더 보기</a>
				</div>
				<div class="board_info">
					<table class="table table-hover">
						<c:forEach items="${boardList}" var="board" begin="0" end="6"
							step="1">
							<tr>
								<td class="board_category">${board.board_category}</td>
								<td class="board_title"style="text-align: left"><a
									href="/board/read?contentIdx=${board.board_idx}">${board.board_title}</a></td>
								<td class="board_id">${board.board_writer}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="goodplace">
				<div class="place_header">
					<h5>이번 주말 어디로 놀러갈까?</h5>
					<a class="more" href="/place/list">>> 더 보기</a>
				</div>
				<div class="place_info">
					<c:forEach items="${placeBoardList}" var="place" begin="0" end="7"
						step="1">
						<div class="portfolio-item">
							<div class="card h-100" style="border: 0px">
								<a href="/place/read?contentIdx=${place.place_idx}"><img
									class="card-img-top"
									src="${pageContext.request.contextPath}/${place.img_path}"
									alt=""></a>
								<div class="card-body">
									<h6 class="card-title">
										<a href="/place/read?contentIdx=${place.place_idx}">${place.place_name}</a>
									</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Footer -->
<%@include file="footer.jsp"%>