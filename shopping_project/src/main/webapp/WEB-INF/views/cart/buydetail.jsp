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
<script type="text/javascript">
	$(function() {
		$("#select_count").on('blur', function() {
			var count = $(this).val();
			var price = $("#price").val();
			var opt = $(".opt_select").val();
			
			
			if (count*price >= 30000) {
				var shipping = '무료배송';
				var finalPrice = count*price;
			} else {
				var shipping = 2500;
				var finalPrice = (count*price) + shipping;
			}
			
			var str = '';
			
			str += '<p><label>수량 : </label><span>&nbsp;' + count + '</span>&nbsp;&nbsp;&nbsp;';	
			
			if (opt != 'S' && opt != 'M' && opt != 'L') {
				str += '<lable></lable>';
			} else {
				str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
			}
			
			str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
			str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
			str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
			str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
			
			$(".selected_option").html(str);
		});
		
		var userid = $("#userid").val();
		var productId = $("#productId").val();
		$('#cartMove').on('click', function() {
			var count = $("#select_count").val();
			var opt = $(".opt_select").val();
			location.href = "/cart/update?userid="+userid+"&productId="+productId+"&selected_Opt="+opt+"&order_Qty="+count;
		})
	});
	
	
	
	
	

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
	
	<div class="container" style="width: 70%">
		<form action="/order/orderForm" method="post">
		<input type="hidden" value="${result.userid}" id="userid" name="userid">
		<div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${productInfo.productName}</h1>
			<input type="hidden" value="${productInfo.productId}" id="productId" name="productId">
		</div>
		<div class="row" style="float: left; text-align: center; width:35%;">
			<img alt="productPhoto" src="https://github.com/AhnBy/shopping_project/blob/master/${productInfo.filename}?raw=true/" width="150%">
		</div>

		<div class="row productInfo" style="width: 40%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${productInfo.productName}</span><br><small>${productInfo.productInfo}</small></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${productInfo.price}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${productInfo.price}" id="price">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
				<p>도서산간지역 배송비 5000원 / 3만원 이상 결제시 무료배송</p>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>적립금 : </label><span><fmt:parseNumber var="test" value="${productInfo.price / 100}" integerOnly="true"/> ${test}&nbsp;원</span>
			</div>

			<c:choose>
				<c:when test="${productInfo.productDist != 'acc' && productInfo.productDist != 'bag'}">
					<div class="form-horizontal" style="text-align: left;">
						<label>옵션 : </label> 
						<select class="form-control opt_select" name="selected_Opt">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>		
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : </label> 
				<select class="form-control" id="select_count" name="order_Qty">
				<c:forEach begin="1" end="${productInfo.stock}" var="count">
					<option>${count}</option></c:forEach>
				</select>
			</div>	
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
					<button type="submit" class="btn btn-default btn-order">주문하기</button>
					<button type="button" id="cartMove" class="btn btn-default btn-cart">수정 후 장바구니</button>
				</div>
			</div>
			<hr>	
		</div>
		</form>
	</div>
	
</body>
</html>