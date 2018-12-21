<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css">
<link href="${pageContext.request.contextPath}/css/weather.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<!-- Post Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h5 class="my-4">카테고리</h5>
			<div class="list-group">
				<a href="/info/culture?page=1" class="list-group-item">공연·전시정보</a> <a
					href="/info/weather?code1=1100000000&code2=seoul&code3=seoul,kr"
					class="list-group-item">날씨</a>
			</div>
		</div>
		<!-- Content Wrapper. Contains page content -->
		<div class="col-lg-9">
			<br>
			<h5>
				<span class="day">${todayDate }</span> 오늘의 날씨는
			</h5>
			<br>
			<table class="regionset">
				<tr>
					<th class="region">지역</th>
					<td>
						<ul class="region-list" id="region-list">
							<li class="region"
								<c:out value="${curPage eq 'seoul' ? 'style=font-weight:bold;' : '' }"/>>
								<a
								href="/info/weather?code1=1100000000&code2=seoul&code3=seoul,kr"
								id="seoul">서울・인천・경기</a>
							</li>

							<li class="region"
								<c:out value="${curPage eq 'chuncheon' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4211000000&code2=chuncheon&code3=chuncheon,kr"
								id="youngW">강원영서</a></li>
							<li class="region"
								<c:out value="${curPage eq 'okcheon' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4215000000&code2=okcheon&code3=ogcheongun,kr"
								id="youngE">강원영동</a></li>
							<li class="region"
								<c:out value="${curPage eq 'daejeon' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4400000000&code2=daejeon&code3=daejeon,kr"
								id="youngW">대전・세종・충남</a></li>
							<li class="region"
								<c:out value="${curPage eq 'cheongju' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4300000000&code2=cheongju&code3=cheongju,kr"
								id="chungN">충북</a></li>
							<li class="region"
								<c:out value="${curPage eq 'gwangju' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4600000000&code2=gwangju&code3=gwangju,kr"
								id="gwangju">광주・전남</a></li>
							<li class="region"
								<c:out value="${curPage eq 'jeonju' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4500000000&code2=jeonju&code3=jeonju,kr"
								id="jeonN)">전북</a></li>
							<li class="region"
								<c:out value="${curPage eq 'daegu' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4700000000&code2=daegu&code3=daegu,kr"
								id="daegu">대구・경북</a></li>
							<li class="region"
								<c:out value="${curPage eq 'busan' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=4800000000&code2=busan&code3=busan,kr"
								id="busan">부산・울산・경남</a></li>
							<li class="region"
								<c:out value="${curPage eq 'jeju' ? 'style=font-weight:bold' : '' }"/>><a
								href="/info/weather?code1=5000000000&code2=jeju&code3=jeju,kr"
								id="jeju">제주</a></li>
						</ul>
					</td>
				</tr>
			</table>
			<div class="notice">
				<i class="fas fa-info-circle"></i> 서비스 기간이 아닐 때는 --로 표시 됩니다
			</div>
			<table class="state-group">
				<tr>
					<td>
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
										class="degree_code">${temp_max }</em>˚</span> <span class="day_feel">
										체감 <em class="degree_code">${sensorytem }</em>˚
								</span></li>
							</ul>
						</div>
					</td>
					<td>
						<div class="description">
							<ul class="description_list">
								<li class="finedust">미세먼지 
									<span class="level2">
										<c:choose>
											<c:when test="${finedust ne '--'}">
												<fmt:parseNumber var="fd" value="${fineDust}" />
												<c:if test="${fineDust >= 0 and fineDust < 30}">좋음</c:if>
												<c:if test="${fineDust >= 30 and fineDust < 80}">보통</c:if>
												<c:if test="${fineDust >= 80 and fineDust < 150}">나쁨</c:if>
												<c:if test="${fineDust >= 151 and 300}">매우나쁨</c:if>
											</c:when>
											<c:otherwise> </c:otherwise>
										</c:choose>

									 	<em>${fineDust }</em></span>,
									초미세먼지 
									<span class="level3">
										<c:choose>
											<c:when test="${ultraFineDust >= 0 and ultraFineDust <= 50}">좋음</c:when>
											<c:when test="${ultraFineDust > 50 and ultraFineDust <=100}">보통</c:when>
											<c:when test="${ultraFineDust > 150 and ultraFineDust <= 200}">나쁨</c:when>
											<c:when test="${ultraFineDust > 200 and ultraFineDust <= 300}">매우나쁨</c:when>
											<c:when test="${ultraFineDust>300 and ultraFineDust<600}">위험</c:when>
											<c:otherwise> </c:otherwise>
										</c:choose> 
										<em>${ultraFineDust }</em></span>
								</li>
								<li class="uvfood">자외선지수 
									<span class="level2">
										<c:choose>
												<c:when test="${ultrav ne '--'}">
													<fmt:parseNumber var="uv" value="${ultrav}"  />
														<c:if test="uv>=0 and uv<=2">낮음</c:if>
														<c:if test="uv>2 and uv<=5">보통</c:if>
														<c:if test="uv>5 and uv<=7">높음</c:if>
														<c:if test="uv>7 and uv<=10">매우높음</c:if>
														<c:if test="uv>11 and uv<20">위험</c:if>
													</c:when>
												<c:otherwise> </c:otherwise>
										</c:choose>
										<em>${ultrav }</em></span>,
									식중독지수 
									<span class="level2">
										<c:choose>
											<c:when test="${fsn ne '--'}">
												<c:if test="${fsn >= 0 and fsn < 55}">관심</c:if>
												<c:if test="${fsn >= 55 and fsn <=70}">주의</c:if>
												<c:if test="${fsn >= 71 and fsn <=85}">경고</c:if>
												<c:if test="${fsn >= 86 and fsn <200}">매우나쁨</c:if>
											</c:when>
											<c:otherwise> </c:otherwise>
										</c:choose> 
										<em>${fsn }</em></span>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<%@include file="../footer.jsp"%>