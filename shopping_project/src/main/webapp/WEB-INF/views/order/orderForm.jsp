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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var userid = $("#userid").val();
		var productId = $("#productId").val();
		
		$("input[name='cal_info']").click(function() {
			
			var qty = $(".order_Qty").val();
			var price = $("#productprice").val();
			var del_fee = "2500";
			
			var amount = price * qty;
			
			if (amount < 30000) {	
				totalAmount = Number(amount) + Number(del_fee);
				$("#price").html(amount);
				$("#del_fee").html(del_fee);
				$("#totalprice").html(totalAmount);
				$("#amount").val(totalAmount);
			} else {
				totalAmount = amount;
				$("#price").html(totalAmount);
				$("#del_fee").html(0);
				$("#totalprice").html(totalAmount);
				$("#amount").val(totalAmount);
			}

		});
	});
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } else {
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
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
		<form action="/order/insert" method="post">
		<c:set value="${productInfo}" var="dto"/>
		<c:set value="2500" var="del_fee"/>
		<div class="row qnas" style="text-align: center;">
			<h1 class="page-header">주문하기</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th style="text-align: center;">가격</th>
						<th style="text-align: center;">수량</th>
						<th style="text-align: center;">옵션</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><img src="https://github.com/AhnBy/shopping_project/blob/master/img/${dto.filename}?raw=true/" width="100px" height="100px">
							<input type="hidden" value="${dto.filename}" name="filename">
							<input type="hidden" value="${dto.productId}" name="productId" id="productId">
							</td>
							<td>${dto.productName}<br>${dto.productInfo}
								<input type="hidden" value="${dto.productName}" name="productName">
								<input type="hidden" value="${dto.productInfo}" name="productInfo">
								<input type="hidden" value="${dto.productDist}" name="productDist">
							</td>
							<td><fmt:formatNumber type="number" value="${dto.price}"/>&nbsp;원
							<input type="hidden" value="${dto.price}" id="productprice" name="price"></td>
							<td><select name="orderQty" class="form-control order_Qty">
									<option value="${order_Qty}" >${order_Qty}</option>
								<c:forEach begin="1" end="${dto.stock > 5 ? 5 : dto.stock}" var="stock">
									<option value="${stock}" >${stock}</option>
								</c:forEach>
							</select>
							</td>
							<td><c:choose>
									<c:when
										test="${dto.productDist != 'acc' && dto.productDist != 'bag'}">
										<div class="form-horizontal" style="text-align: left;">
											<c:choose>
											<c:when test="${selected_Opt == 'S'}">
												<select class="form-control" name="selectedOpt">
													<option value="S">S</option>
													<option value="M">M</option>
													<option value="L">L</option>
												</select>
											</c:when>
											<c:when test="${selected_Opt == 'M'}">
												<select class="form-control" name="selectedOpt">
													<option value="M">M</option>
													<option value="L">L</option>
													<option value="S">S</option>
												</select>
											</c:when>
											<c:when test="${selected_Opt == 'L'}">
												<select class="form-control" name="selectedOpt">
													<option value="L">L</option>
													<option value="S">S</option>
													<option value="M">M</option>
												</select>
											</c:when>
											</c:choose>
										</div>
									</c:when>
									<c:otherwise><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></c:otherwise>
								</c:choose></td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row" style="text-align: center; margin: 80px 0;">
		<c:set value="${result}" var="vo"/>
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</h4>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-10">
						<input class="form-control" id="inputId" placeholder="ID" name="userid" value="${vo.userid}" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<input class="form-control" id="name" placeholder="Name" name="name" value="${vo.name}">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputAdd" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" id="sample6_postcode" name="zipcode" value="${vo.zipcode}">&nbsp;
						<input type="button" class="btn btn-default btn-sm" id="searchAdd" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="sample6_address" name="address1" value="${vo.address1}">
						<input class="form-control" type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="${vo.address2}">
					</div>
				</div>				
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="${vo.email}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="inputTel" placeholder="Tel" name="tel" value="${vo.tel}">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">배송 메세지</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="deliver_msg" placeholder="배송 메세지" name="deliverMsg">
					</div>
				</div>				
			</div>
		</div><!-- class=row -->
		
			<div class="row" style="text-align: center; margin: 80px 0;">
				<h1 class="page-header">결제수단 확인</h1>
				<div style="text-align: center;">
					<input type="radio" name="cal_info" value="transfer"><label style="margin-right: 50px;">&nbsp;계좌이체</label>
					<input type="radio" name="cal_info" value="no_bankingBook"><label style="margin-right: 50px;">&nbsp;무통장 입금</label>
					<input type="radio" name="cal_info" value="tel_billing"><label style="margin-right: 50px;">&nbsp;핸드폰 결제</label>
					<input type="radio" name="cal_info" value="card"><label>&nbsp;카드 결제</label>
				</div>
				<hr>
				<div class="row" style="text-align: center; margin: 50px 0;">
					<label>상품가격 :&nbsp; <span id="price"></span>&nbsp;원</label>
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					<label>배송비 :&nbsp;<span id="del_fee"></span>&nbsp;원
					</label>
					<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
					<label style="font-size: 1.5em;">총 결제금액 : <span id="totalprice"></span>&nbsp;원
					<input type="hidden" id="amount" name="totalAmount">
					</label>
				</div>
				<div>
					<button class="btn btn-default cal-btn" type="submit">결제하기</button>
					<button class="btn btn-default back_btn" onclick="history.back();">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>