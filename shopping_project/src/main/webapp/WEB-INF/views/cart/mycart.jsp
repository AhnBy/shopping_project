<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
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
	
	<c:set value="${cartMap.cartList}" var="cartlist"/>
	<c:set value="${cartMap.productList}" var="productList"/>
		
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">장바구니</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th style="text-align: center;">가격</th>
						<th style="text-align: center;">수량</th>
						<th style="text-align: center;">옵션</th>
						<th style="text-align: center;">구매/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:choose><c:when test="${productList != null}">
					<c:forEach items="${productList}" var="vo" varStatus="status">
						<tr>
							<td><img alt="thumbnail" src="https://github.com/AhnBy/shopping_project/blob/master/${vo.filename}?raw=true/" width="100px" height="100px"></td>
							<td>${vo.productName}<br>${vo.productInfo}</td>
							<td><fmt:formatNumber type="number" value="${vo.price}"/>&nbsp;원</td>
							<c:forEach items="${cartlist}" var="co" varStatus="statis">
							<td>${co.cartQty}</td>
							<td>${co.cartOpt}</td>							
								<td> <button type="button" onclick="location='/order/orderForm?userid=${result.userid}&productId=${vo.productId}&order_Qty=${co.cartQty}&selected_Opt=${co.cartOpt}'">구매</button><br><br>
									<button type="button" onclick="location='/cart/delete?userid=${result.userid}&productId=${vo.productId}'">삭제</button> </td>
							</c:forEach>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="6"><h3>장바구니에 내역이 없습니다.</h3></td></tr>
					</c:otherwise></c:choose>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
			<button class="btn btn-default" onclick="location='/main?userid=${result.userid}'">메인페이지로 이동</button>
			<button class="btn btn-default" onclick="history.back();">쇼핑을 계속하기</button>
		</div>

	</div>
</body>
</html>