<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/board_write.css">
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
		<div class="col-lg-9">
		<!-- Main content -->
		<section class="content container-fluid">

			<div class="col-lg-12">
				<form role="form" id="writeForm" method="post"
					action="${path}/board/modify?contentIdx=${content.board_idx}">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h4 class="box-title">게시글 작성 </h4>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label for="category">카테고리</label> <select class="form-control"
									id="board_category" name="board_category">
									<option value='자유게시판'>자유게시판</option>
									<option value='요리'>요리</option>
									<option value='병원/약국'>병원/약국</option>
									<option value='어린이집/유치원'>어린이집/유치원</option>
									<option value='임신/출산'>임신/출산</option>
								</select>
							</div>
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="board_title" name="board_title" placeholder="제목을 입력해주세요" value="${content.board_title }">
								</div>
								<div class="form-group">
									<label for="content">내용</label>
									<textarea class="form-control" id="board_content"
										name="board_content" rows="17" placeholder="내용을 입력해주세요"
										style="resize: none;">${content.board_content }</textarea>
								</div>
						</div>
						<div class="box-footer">
							<div class="pull-right">
								<button type="reset" class="btn btn-warning">
									<i class="fa fa-reply"></i>초기화
								</button>
								<button type="submit" class="btn btn-success">
									<i class="fa fa-save"></i> 저장
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
		<!-- /.content -->
	</div>
	</div>
	<!-- Content Wrapper. Contains page content -->
	
	<!-- /.content-wrapper -->
</div>
<br>

<%@include file="../footer.jsp"%>