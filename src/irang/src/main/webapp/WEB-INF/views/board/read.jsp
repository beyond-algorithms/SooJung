<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css">
<link href="${pageContext.request.contextPath}/css/board_read.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page Content -->
<div class="container">
	<div class="row">
		<div class="col-lg-3">
			<h5 class="my-4">카테고리</h5>
			<div class="list-group">
				<a href="/board/list/all" class="list-group-item">전체보기</a> <a
					href="/board/list/bulletin" class="list-group-item">자유게시판</a> <a
					href="/board/list/cook" class="list-group-item">요리</a> <a
					href="/board/list/treat" class="list-group-item">병원/약국</a> <a
					href="/board/list/kinder" class="list-group-item">어린이집/유치원</a> <a
					href="/board/list/preg" class="list-group-item">임신/출산</a>
			</div>
		</div>

		<!-- Content Wrapper. Contains page content -->
		<div class="col-lg-9">
			<h3>${content.board_category }</h3>
			<table class="table">
				<tr>
					<th class="board" scope="row">제목</th>
					<td class="board" colspan="5">${content.board_title }</td>
				</tr>
				<tr>
					<th class="board" scope="row">작성자</th>
					<td class="board" >${content.board_writer }</td>
					<th class="board" scope="row">조회수</th>
					<td class="board">${content.board_hit }</td>
					<th class="board" scope="row">날짜</th>
					<td class="board date" >${content.board_datetime }</td>
				</tr>
			</table>
			<div class="box-body">${content.board_content}</div>

			<ul class="wrap_order">
				<c:if test="${postContent.board_title ne '' && postContent ne null }">
					<li class="prev"><strong>다음</strong> <a
						href="/board/read?contentIdx=${postContent.board_idx}">${postContent.board_title }</a>
					</li>
				</c:if>
				<c:if test="${preContent.board_title ne '' && preContent ne null }">
					<li class="next"><strong>이전</strong> <a
						href="/board/read?contentIdx=${preContent.board_idx}">${preContent.board_title }</a>
					</li>
				</c:if>
			</ul>

			<div class="box-footer">
				<form role="form" method="post">
					<input type="hidden" name="articleNo" value="${content.board_idx}">
				</form>
				<button type="submit" class="btn btn-primary listBtn"
					onclick="javascript:location.href='/board/list/all';">
					<i class="fa fa-list"></i> 목록
				</button>
				<div class="pull-right">
					<button type="submit" class="btn btn-warning modBtn"
						onclick="javascript:location.href='/board/modify?contentIdx=${content.board_idx}'">
						<i class="fa fa-edit"></i> 수정
					</button>
					<button type="submit" class="btn btn-danger delBtn"
						onclick="javascript:location.href='/board/delete?contentIdx=${content.board_idx}'">
						<i class="fa fa-trash"></i> 삭제
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../footer.jsp"%>