<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/product/list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>
	<c:choose>
	<c:when
		test="${result.userid == 'admin'}">
		<c:set var="str">관리자 페이지 입니다.</c:set>
	</c:when>
	<c:when
		test="${result.userid != null}">
		<c:set var='str'>안녕하세요  ${result.userid} 님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
	</c:choose>
	<!--상단메뉴-->
	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/main?userid=${result.userid}">Shop</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="/main?userid=${result.userid}">Home</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Product <span class="caret"></span></a>
							<ul class="dropdown-menu" id="pmenu">
								<li><a href="/product/list?productDist=1&userid=${result.userid}">OUTER</a></li>
								<li><a href="/product/list?productDist=2&userid=${result.userid}">TOP</a></li>
								<li><a href="/product/list?productDist=3&userid=${result.userid}">BOTTOM</a></li>
							</ul>
						</li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">community <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/member/myPage?userid=${result.userid}">Mypage</a></li>
							<li><a href="#">Review</a></li>
							<li><a href="/notice/list">Notice</a></li>
							<li><a href="/chat">문의하기</a></li>
						</ul>
					</li>
					<li><a id="grade" style="color: white;"><span class="glyphicon glyphicon-grain"></span>${str}</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${result.userid == null}">
							<li><a href="/member/join"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<li><a href="/member/loginForm"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:when>
						<c:when
							test="${result.userid == 'admin'}">
							<li><a href="/product/insert?userid=${result.userid}"><span class="glyphicon glyphicon-plus-sign"></span> 상품등록</a></li>
							<li><a href="/admin/productList?userid=${result.userid}"><span class="glyphicon glyphicon-list"></span> 상품목록</a></li>
							<li><a href="/admin/memberList?userid=${result.userid}"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
							<li><a href="/member/logout" onclick="return confirm('로그아웃 하시겠습니까?');"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/cart/mycart?userid=${result.userid}"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
							<li><a href="/member/updateForm?userid=${result.userid}"><span class="glyphicon glyphicon-edit"></span> 회원수정</a></li>
							<li><a href="/member/logout" onclick="return confirm('로그아웃 하시겠습니까?');"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
	<div class="logo">
		<h1 style="text-align: center; padding: 30px 0px;" >Hello World</h1>
	</div>

	<div class="container">
		<c:choose>   
			<c:when test="${empty productList}">
				<div class="row">
					<h2>상품 준비중 입니다.</h2> 
					<p><img src="${pageContext.request.contextPath}/resources/img/default.jpg" class="img-thumbnail"  width="236" height="306"></p>
				</div>
			</c:when>
			<c:otherwise>
				<c:set var="list" value="${productList}"/>
				<div class="row">
					<c:forEach var="dto" begin="0" end="3" items="${productList}">
						<div class="col-sm-3 image-box">
							<a href="/product/buydetail?productId=${dto.productId}&userid=${result.userid}">
							<p><img src="https://github.com/AhnBy/shopping_project/blob/master/${dto.filename}?raw=true/" class="image-thumbnail" width="236px" height="306px"></p></a>
							<p>${dto.productName }<br><b>${dto.price} 원</b></p>
						</div>
					</c:forEach>
				</div>
				<br><br>
				<div class="row">
					<c:forEach var="dto" begin="4" end="7" items="${productList}">
						<div class="col-sm-3 image-box">
							<a href="/product/buydetail?productId=${dto.productId}&userid=${result.userid}">
							<p><img src="https://github.com/AhnBy/shopping_project/blob/master/${dto.filename}?raw=true/" class="image-thumbnail" width="236px" height="306px"></p></a>
							<p>${dto.productName }<br><b>${dto.price} 원</b></p>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		<br><br>
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/product/list?userid=${result.userid}&productDist=${productDist}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b><input type="button" value="${p }"></b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/product/list?userid=${result.userid}&productDist=${productDist}&nowPage=${p }&cntPerPage=${paging.cntPerPage}"> <input type="button" value="${p }"></a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/product/list?userid=${result.userid}&productDist=${productDist}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		<br><br><br><br><br><br>
	</div>
</body>
</html>