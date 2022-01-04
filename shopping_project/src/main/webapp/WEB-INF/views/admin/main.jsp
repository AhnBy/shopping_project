<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMain</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style>
		*{margin: 0; padding: 0; text-decoration: none; list-style: none;}
        .myframe{
            width: 1170px; height: 306px;

            overflow: hidden;

            position: relative;

            margin: 0 auto;
        }

        .myframe>ul{width: calc(262.5px*13);}

        .myframe li{float: left; }

        .myframe>ul::after{content: ""; clear: both ;display: block;}

        #image{width: 262.5px; height: 306px; object-fit: cover; display: block; margin-right: 30px}
        .main{border: 1px solid black; padding: 10px; width: 528px; margin: 0 auto;}
        h1{text-align: center;}
        #prev{position: relative; bottom: 0;}
        #next{position: relative; bottom: 0;}
        
        
</style>
<script>
	$(function slideShow(){
        $(".myframe>ul").animate(
            {"margin-left":"-292.5px"},
            2000,
            function(){
                $(".myframe>ul").css("margin-left","0px")
                $(".myframe>ul").append($(this).children().eq(0))
                
            }
        )
        setTimeout(slideShow, 1000);
	})
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
							<li><a href="/admin/memberList"><span class="glyphicon glyphicon-list"></span> 회원목록</a></li>
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

	<div class="nav">
		<p>nav</p>
	</div>

	<div class="container">
		<div class="row">
				<div class="col-sm-3 myframe">
					<ul>
						<c:forEach var="dto" begin="0" end="${fn:length(productList)}" items="${productList}">
							<li>
								<a href="/product/buydetail?productId=${dto.productId}&userid=${result.userid}" >
								<p><img src="https://github.com/AhnBy/shopping_project/blob/master/${dto.filename}?raw=true/" id="image" class="image-thumbnail" ></p></a>
								
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<br><br><br><br><br>
		<div class="row">
			<div class="col">
				<table>
					<tbody>
						<tr>
							<td width="900px">
								<h3>Hello World</h3>
								<p>
								<br>
								<b>1004-1004</b> <br>
								평일 오전 11:00 ~ 오후 4:00 / 점심시간 오후 12:00 ~ 오후 1:00 <br>
								토 / 일 / 공휴일 휴무 <br>
								상호: Hello World 대표:안병철<br>
								주소:03425 서울시 은평구 구산동<br>
								개인정보관리책임자:안병철 이메일:qudcjf0701@naver.com <br>
								사업자 등록번호:111-22-33333 <br>
								</p>
							</td>
							<td>
								<h3>공지사항</h3>
								<p>
								<br>
								1. 안녕하세요. Hello World 관리자 입니다.<br>
								2. 금주 행사 상품 안내<br>
								3. 배송 안내<br>
								4. 2022년 휴무 안내<br>
								5. 교환 및 환불 안내사항<br>
								6. 이벤트 안내<br>
								7. 이벤트 당첨자 안내<br>
								</p>
								
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	
</body>
</html>