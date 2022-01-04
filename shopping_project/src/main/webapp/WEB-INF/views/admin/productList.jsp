<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
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
		var userid = $("#userid").val();
		location.href="/admin/productList?userid="+userid+"&nowPage=${paging.nowPage}&cntPerPage="+sel;
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
							<li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
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
		<h2>상품 목록</h2>
		<form class="form-inline" action="/admin/productList" method="post">
			<div class="form-group">
				<select class="form-control" name="searchOption" id="search">
					<option value="product_dist" <c:if test="${searchOption eq 'product_dist' }">selected</c:if>>상품분류(OUTER:1,TOP:2,BOTTOM:3)</option>
					<option value="product_name" <c:if test="${searchOption eq 'product_name' }">selected</c:if>>상품명</option>
					<option value="product_id" <c:if test="${searchOption eq 'product_id' }">selected</c:if>>상품번호</option>
					<option value="all" <c:if test="${searchOption eq 'all' }">selected</c:if> >전체출력</option>       
				</select>
			</div>
			<input type="hidden" name="userid" id="userid" value="${result.userid}">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어" name="keyword" value="${keyword}">
			</div>
		    <button type="submit" class="btn btn-default" id="searchGo" >검색</button>
		    <button type="button" class="btn btn-default" onclick="location.href='/product/insert?userid=${result.userid}'">등록</button>
		</form>
		<table class="table table-striped">
		    <thead>
			    <tr>
				    <th>번호</th>
				    <th>상품이미지</th>
				    <th>상품명</th>
				    <th>가격</th>
				    <th>등록날짜</th>
				    <th>재고</th>
				    <th>수정/삭제/이미지수정</th>
			    </tr>
		    </thead>
			<tbody>
				<c:choose>   
					<c:when test="${empty productList}">
					<tr><td colspan="6">등록된 상품이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
						</div>
						<c:forEach var="dto" items="${productList}"> 
							<tr>
								<td>${dto.productId}</td>
								<td><img src="https://github.com/AhnBy/shopping_project/blob/master/img/${dto.filename}?raw=true/"  class="img-rounded" width="100px" height="100px"></td>
								<td><a href="/product/detail?productId=${dto.productId}&userid=${result.userid}">${dto.productName}</a></td>
								<td>${dto.price}</td>
								<td>${dto.regDate}</td>
								<td>${dto.stock}</td>
								<td>
								<a href="/product/updateForm?productId=${dto.productId}&userid=${result.userid}"><span class="glyphicon glyphicon-edit"></span></a>/
								<a href="/product/delete?productId=${dto.productId}&userid=${result.userid}" onclick="return confirm('상품을 삭제하시겠습니까?');"><span class="glyphicon glyphicon-trash"></span></a>/
								<a href="/product/updateFileForm?productId=${dto.productId}&userid=${result.userid}"><span class="glyphicon glyphicon-picture"></span></a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br><br>
    	<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/admin/productList?userid=${result.userid}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b><input type="button" value="${p }"></b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/admin/productList?userid=${result.userid}&nowPage=${p }&cntPerPage=${paging.cntPerPage}"> <input type="button" value="${p }"></a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/admin/productList?userid=${result.userid}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		<br><br><br><br><br><br>
	</div>
	
</body> 
</html>