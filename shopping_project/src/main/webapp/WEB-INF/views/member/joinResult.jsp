<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinResult</title>
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
							<li><a href="/admin/create"><span class="glyphicon glyphicon-plus-sign"></span> 상품등록</a></li>
							<li><a href="/contents/list"><span class="glyphicon glyphicon-list"></span> 상품목록</a></li>
							<li><a href="/admin/list"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
							<li><a href="/member/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
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
		<div class="row">
			<h2 class="col-sm-offset-2 col-sm-10">내 정보 보기</h2>
			<form class="form-horizontal" name = 'frm' action="updateForm" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="userid">아이디</label>
					<div class="col-sm-3">          
						<input type="text" class="form-control" id="userid" value="${result.userid}" readonly="readonly" name="userid">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="mname">이름</label>
					<div class="col-sm-4">          
						<input type="text" class="form-control" id="name" value="${result.name}" readonly="readonly"  name="name">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="birth">생년월일</label>
					<div class="col-sm-4">          
						<input type="text" class="form-control" id="birth" name="birthDate" value="${result.birthDate}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="tel">전화번호</label>
					<div class="col-sm-4">          
						<input type="text" class="form-control" id="tel" value="${result.tel}" readonly="readonly"  name="tel">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">이메일</label>
					<div class="col-sm-3">          
						<input type="text" class="form-control" id="email" value="${result.email}" readonly="readonly"  name="email">
					</div>     
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
					<div class="col-sm-1">          
						<input type="text" class="form-control" name="zipcode" id="sample6_postcode" value="${result.zipcode}" readonly="readonly">
					</div>      
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="sample6_address">주소</label>
					<div class="col-sm-6">          
						<input type="text" class="form-control" id="sample6_address" value="${result.address1}" readonly="readonly" name="address1">
						<input type="text" class="form-control" id="sample6_detailAddress" value="${result.address2}" readonly="readonly" name="address2">
					</div>
				</div>
				<div class="form-group">        
					<div class="col-sm-offset-2 col-sm-5">
						<button type="submit" class="btn btn-default">회원정보 수정</button>
						<button type="button" class="btn btn-default" onclick="location='/main?userid=${result.userid}'">메인으로 돌아가기</button>
					</div>
				</div>
			</form>
			<form class="form-horizontal" action="deleteForm" method="post">
				<div class="form-group">  
					<div class="col-sm-offset-2 col-sm-5">
						<input type="hidden" name="userid" value="${result.userid}">
						<input type="hidden" name="userpw" value="${result.userpw}">
						<button type="submit" class="btn btn-default">회원 탈퇴하기</button>
					</div>
				</div>
			</form>
		</div>
		<br><br>
	
		<div class="row">
			<div class="form-group">
				<div class="row" style="text-align: center;">
					<h1 class="page-header" style="margin-bottom: 50px;">나의 주문 내역</h1>
					<table class="table table-hover"
						style="margin: auto; border-bottom: 1px solid #D5D5D5;">
						<thead>
							<tr>
								<th colspan="2" style="text-align: center;">상품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>옵션</th>
								<th>결제금액</th>
								<th>결제일</th>
								<th>배송현황</th>
							</tr>
						</thead>
						<tbody style="text-align: left;">
							<c:choose>
								<c:when test="${orderList == null}">
									<tr style="text-align: center;"><td colspan="8"><h3>주문 내역이 없습니다.</h3></td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${orderList}" var="dto">
										<tr>
											<td style="text-align: center;">
											<img alt="thumbnail" src="https://github.com/AhnBy/shopping_project/blob/master/img/${dto.fullname}?raw=true/" width="100px" height="100px"> 
												<input type="hidden" value="${dto.productId}" name="productId" id="productId">
											</td>
											<td>${dto.productName}<br>${dto.productInfo}</td>
											<td><fmt:formatNumber type="number"
													value="${dto.price}" />&nbsp;원</td>
											<td>${dto.orderQty}</td>
											<td>${dto.selectedOpt}</td>
											<td><fmt:formatNumber type="number"
													value="${dto.totalAmount}" />&nbsp;원</td>
											<td>${dto.billingDate}</td>
											<td>${dto.deliverSitu == 0 ? "배송준비중" : 
														dto.deliverSitu == 1 ? "배송중" : "배송완료"}</td>
											<c:choose>
												<c:when test="${dto.deliverSitu != 0}">
													<td>
														<button class="btn btn-default disable"
															disabled="disabled">주문취소</button>
														<br>
														<button class="btn btn-default disable"
															disabled="disabled">주문변경</button>
														<br>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														<button type="button" class="btn btn-default order_cancel"
															onclick="location='/order/delete?userid=${result.userid}&orderId=${dto.orderId}'">주문취소</button>
														<br>
														<button type="button" class="btn btn-default" onclick="location='/order/updateForm?userid=${result.userid}&orderId=${dto.orderId}'">주문변경</button>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>