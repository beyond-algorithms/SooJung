<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css">
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
			<!-- Main content -->
			<section class="content-container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h5 class="box-title">게시글 목록</h5>
						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th class="category" style="width: 12%">분류</th>
										<th class="title"style="width: 43%">제목</th>
										<th class="writer"style="width: 14.5%">작성자</th>
										<th class="date" style="width: 23.2%">작성시간</th>
										<th class="count" style="width: 5.8%">조회</th>
									</tr>
									<c:forEach items="${boards}" var="board">
										<tr>
											<td class="category">${board.board_category}</td>
											<td class="board_title" style="text-align: left"><a
												href="/board/read?contentIdx=${board.board_idx}">${board.board_title}</a></td>
											<td class="board_writer">${board.board_writer }</td>
											<td class="board_date"><fmt:formatDate value="${board.board_datetime}"
													pattern="yyyy-MM-dd a HH:mm" /></td>
											<td class="board_count"><span class="badge bg-red">${board.board_hit}</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
				
						<div class="box-footer">
							<div align="right" class="pull-right">
								<button type="button" class="btn btn-success btn-flat"
									id="writeBtn" onclick="javascript:location.href='/board/write'">
									<i class="fa fa-pencil"></i> 글쓰기
								</button>
							</div>
							<div class="text-center">
								<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.prev }">
										<li><a href="?page=${pageMaker.startPage -1 }">이전</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
										var="idx">
										<li class="page-item"><c:choose>
												<c:when test="${pageMaker.criteria.page == idx}">
													<a class="pagination selected" href="?page=${idx }">${idx }</a>
												</c:when>
												<c:otherwise>
													<a class="pagination" href="?page=${idx }">${idx }</a>
												</c:otherwise>
											</c:choose></li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<li><a href="?page=${pageMaker.endPage + 1 }">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
	</div>
</div>
<!-- /.content-wrapper -->
<%@include file="../footer.jsp"%>