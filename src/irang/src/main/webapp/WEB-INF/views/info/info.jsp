<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>생활정보</title>

<link href="${pageContext.request.contextPath}/css/info.css"
	rel="stylesheet" type="text/css">

<!--페이지네이션 플러그인 테스트-->

</head>

<body>
	<!-- Navigation -->
	<%@include file="../header.jsp"%>

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
				<h5>공연·전시정보</h5>
				<div class="container"></div>
				<div class="tblList offlineList" style="">
					<table>
						<colgroup>
							<col width="25px">
							<col width="40px">
							<col width="60px">
							<col width="100px">
							<col width="110px">
							<col width="70px">
						</colgroup>
						<thead>
							<tr>
								<div id="map" class="map"></div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7f06ec008bac9e90ed910f9f9278264"></script>
								<script>
									var mapContainer = document.getElementById('map');
									var mapOption = {
										center: new daum.maps.LatLng(37.5, 126.9),
										level: 2
									};
									
									var map = new daum.maps.Map(mapContainer, mapOption);
									var marker = new daum.maps.Marker({
										position: null
									})
									
									function panTo(x, y) {
										
									    marker.setMap(null);
									    
									    y = parseFloat(y);
									    x = parseFloat(x);
									    
									    var latLon = new daum.maps.LatLng(y, x);
									    marker = new daum.maps.Marker({
									    	position: latLon
									    })
									    
									    map.panTo(latLon);
									    marker.setMap(map);
									}        
														
								</script>
							</tr>
							<tr>
								<th class="smallone" scope="col">지역</th>
								<th class="smallone" scope="col">구분</th>
								<th scope="col">장소</th>
								<th scope="col">기간</th>
								<th scope="col">행사</th>
								<th scope="col">상세정보</th>
							</tr>
						</thead>
						<tbody class="list">
							<c:choose>
								<c:when test="${fn:length(cultureBoardList) > 0}">
									<c:forEach items="${cultureBoardList}" var="culture">
										<tr>
											<td class="smallone" nowrap>${culture.area}</td>
											<td class="smallone" nowrap>${culture.realmName}</td>
											<td nowrap>${culture.place}</td>
											<td nowrap>${culture.startDate}~ ${culture.endDate}</td>
											<td nowrap=""><a href="javascript:;"
												onclick="panTo(${culture.gpsX }, ${culture.gpsY });">
													${culture.title}</a></td>
											<td><a href="javascript:;" onclick="window.open('/info/culture/detail?seq=${culture.seq}', 'detail', 'width=780 height=680 top=300')">자세히보기</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="pagination" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only">Previous</span>
					</a></li>
					<c:forEach begin="1" end="10" step="1" var="i">
						<li class="page-item">
							<c:choose>
								<c:when test="${i == curPage}">
									<a class="pagination selected" href="?page=${i }">${i }</a></c:when>
								<c:otherwise>
									<a class="pagination" href="?page=${i }">${i }</a></c:otherwise>
							</c:choose>
						</li>
					</c:forEach>

					<li class="page-item"><a class="pagination" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp"%>