<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<!-- css 절대경로 -->
<link href="http://localhost:8082/MariaMVCBoard/admin/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/modernizr.custom.97074.js"></script>
</head>
<body class="sb-nav-fixed">
	<!-- Header Include1 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" id="">
		<jsp:include page="header1.jsp" />
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<!-- Header Include2 -->
				<div class="sb-sidenav-menu" id="">
					<jsp:include page="header2.jsp" />
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Notice</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">
							DataTables is a third party plugin that is used to generate the
							demo table below. For more information about DataTables, please
							visit the <a target="_blank" href="https://datatables.net/">official
								DataTables documentation</a> .
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>Number</th>
										<th>Title</th>
										<th>Name</th>
										<th>Views</th>
										<th>Date</th>
										<th>File</th>
										<th>다운로드</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty boardLists }">
											<tr>
												<td align="center">등록된 게시물이 없습니다^^</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${boardLists }" var="row" varStatus="loop">
												<tr>
													<td>${row.idx }</td>
													<td><a
														href="<%=request.getContextPath()%>/mynotice/view_notice.do?idx=${row.idx }">${row.title }</a>
													</td>
													<td>${row.name }</td>
													<td>${row.viewcount }</td>
													<td>${row.postdate }</td>
													<td>${row.ofile }</td>
													<td><c:if test="${not empty row.ofile }">
															<!-- 다운로드는 같은 파일 사용 -->
															<a
																href="../myboard/download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">
																[Down]</a>
														</c:if></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>

								</tbody>
							</table>
						</div>
					</div>
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='../mynotice/write_notice.do'">글쓰기</button>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<!-- 절대경로 -->
	<script src="http://localhost:8082/MariaMVCBoard/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<!-- 절대경로 -->
	<script
		src="http://localhost:8082/MariaMVCBoard/admin/js/datatables-simple-demo.js"></script>
</body>
</html>
