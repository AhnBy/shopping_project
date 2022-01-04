<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script type="text/JavaScript">
 $(function() {
	 CKEDITOR.replace('productInfo'); // <TEXTAREA>태그 id 값
	 });

 function checkIn(f){
     if (f.productName.value == ""){
             alert("상품명을 입력하세요");
             f.productName.focus()
             return false;
     }
     if (f.price.value == ""){
             alert("가격을 입력하세요");
             f.price.focus();
             return false;
     }
     if (CKEDITOR.instances['productInfo'].getData() == '') {
         window.alert('내용을 입력해 주세요.');
         CKEDITOR.instances['productInfo'].focus();
         return false;
     }
     if (f.stock.value == ""){
             alert("재고를 입력하세요");
             f.stock.focus();
             return false;
     }
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
		<h1 class="col-sm-offset-2 col-sm-10">상품 수정</h1>
		<form class="form-horizontal" 
		      action="update"
		      method="post"
		      onsubmit="return checkIn(this)">
		    <input type="hidden" name="userid" value="${result.userid}">
			<input type="hidden" name="productId" value="${productInfo.productId}">
			<div class="form-group">
				<label class="control-label col-sm-2" for="productDist">상품분류</label>
				<div class="col-sm-6">
				    <select class="form-control" name="productDist">
				        <option value="1" <c:if test= "${productInfo.productDist==1}"> selected </c:if>>OUTER</option>
						<option value="2" <c:if test= "${productInfo.productDist==2}"> selected </c:if>>TOP</option>
						<option value="3" <c:if test= "${productInfo.productDist==3}"> selected </c:if>>BOTTOM</option>
				    </select>
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="productName">상품명</label>
				<div class="col-sm-8">
				    <input type="text" name="productName" id="productName" class="form-control" value="${productInfo.productName }">
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="price">가격</label>
				<div class="col-sm-8">
				    <input type="text" name="price" id="price" class="form-control" value="${productInfo.price }">
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="productInfo">상세정보</label>
				<div class="col-sm-8">
				  <textarea rows="12" cols="7" id="productInfo" name="productInfo" class="form-control">${productInfo.productInfo }</textarea>
				</div>
			</div>
			<div class="form-group">
			<label class="control-label col-sm-2" for="stock">재고</label>
				<div class="col-sm-6">
				    <input type="text" name="stock" id="stock" class="form-control" value="${productInfo.stock }">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn">수정</button>
				<button type="button" class="btn" onclick="location='/admin/productList?userid=${result.userid}'">취소</button>
				</div>
			</div>
		</form>
	</div>
</body> 
</html> 