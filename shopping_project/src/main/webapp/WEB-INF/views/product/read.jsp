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
<script src="/resources/js/read.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".uploadedList").on('click', '.delbtn', function(event) {
			var isOK = confirm("수정버튼이나 되돌아가기 버튼과 관계없이 첨부파일이 삭제됩니다.");
			if (isOK) {
				
				var that = $(this);
				
				$.ajax({
					type : 'post',
					url : '/deleteFile',
					data : {
						filename : that.attr("data-src")
					},
					dataType : 'text',
					success : function(result) {
						
						if (result =="O") {
							
							that.parent().parent().parent().remove();
							
							$.ajax({
								type : 'post',
								url : '/board/deleteFile',
								data : {
									filename : that.attr("data-src")
								},
								dataType : 'text',
								success : function(result) {
									alert(result);
								}
							});
							
						} else {
							alert("삭제실패");
						}
					}
				});
			} 
		});
		
		$.getJSON(""/admin/product/getAttaches/" + productId, function(result) {
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);

			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});
		});

		$("#btn_product_update").click(function(){
			
			var str = '';
			$(".delbtn").each(function(index) {
				
				var data = $(this).attr("data-src");
				str += '<input type="hidden" value="' + data + '" name="files[' + index + ']">';
			});
			
			$("form").append(str);

			$("form").submit();
		});
		
		$(".btn_productDist").on('click', function(event) {
			event.preventDefault();
			var productDist = $("#productDist option:selected").val();
			$("input[name='productDist']").val(productDist);
		});
		
		$("#btn_product_back").click(function(event) {
			event.preventDefault();
			history.back();
		});
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
	
	<div class="container admin_container">
		<div class="row">
			<h1 class="jumbotron" style="text-align: center; margin: 50px 0;">${productInfo.productId}</h1>
			<div class="form-group hidden-xs" id="fileDrop">
				<label>추가로 업로드 할 파일을 드랍하세요.</label>	
					<div class="fileDrop"></div>
					<ul class="clearfix uploadedList col-xs-12"></ul>
			</div>
			<div class="form-group productInfo">
				<form action="/product/updateForm?productId=${productInfo.productId}&userid=${result.userid}" method="post">
					<div>
						<label>상품 ID</label> <input name="productId" value="${productInfo.productId}" class="form-control productId" readonly>
					</div>
					<div>
						<label>상품명</label> <input name="productName" value="${productInfo.productName}" class="form-control" required>
					</div>
					<div>
						<label>상품가격</label> <input name="price" value="${productInfo.price}" class="form-control" required>
					</div>
					<div>
						<label>상품분류</label>
						<div class="form-inline">
							<select class="form-control" id="productDist">
								<option value="outer">1. 외투</option>
								<option value="top">2. 상의</option>
								<option value="bottom">3. 하의</option>
							</select>
							<button class="btn btn-default btn_productDist">입력</button>
							<input name="productDist" value="${productInfo.productDist}"
								class="form-control" readonly>
						</div>
					</div>
					<div>
						<label>재고</label> <input name="stock" value="${productInfo.stock}" class="form-control" required>
					</div>
					<div>
						<label>상품정보</label> <input name="productInfo" value="${productInfo.productInfo}" class="form-control" required>
					</div>
					<div>
						<label>상품 등록일</label> <input value="${productInfo.regDate}" class="form-control" readonly>
					</div>
					<div>
						<label>최종 수정일</label> <input value="${productInfo.updateDate}" class="form-control" readonly>
					</div>
					<div class="btns">
						<button class="btn btn-default" id="btn_product_update">상품정보 수정</button>
						<button class="btn btn-default" id="btn_product_back">상품 정보 페이지로 돌아가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>