<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>자세히 알아보기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/info_detail.css">
</head>
<body>
	<table class="detail_table">
		<tr>
			<th>구분</th>
			<td class="short_txt">${cultureDetail.realmName }</td>
			<th style="width: 45px;">행사명</th>
			<td colspan="3">${cultureDetail.title }</td>
		</tr>
		<tr>
			<th>지역</th>
			<td class="short_txt">${cultureDetail.area }</td>
			<th>장소</th>
			<td>${cultureDetail.place }</td>
			<th>기간</th>
			<td>${cultureDetail.startDate }~${cultureDetail.endDate }</td>
		</tr>
		<tr>
			<th style="width: 53px;">전화번호</th>
			<td class="short_txt" style="width: 100px">${cultureDetail.phone }</td>
			<th>가격</th>
			<td colspan="3">${cultureDetail.price }</td>
		</tr>
		<tr>
			<td colspan="6"><a href="${cultureDetail.url }" target="_blank">
			<div class="culture_detail" width="100%">${cultureDetail.contents }</div></a></td>
		</tr>
	</table>
</body>
</html>