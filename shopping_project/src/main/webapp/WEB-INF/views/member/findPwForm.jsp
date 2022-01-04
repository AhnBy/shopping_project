<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdForm</title>
<style type="text/css">
  	#need{color:red;}
</style>
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
		<h2 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h2>
		
	  <form class="form-horizontal" name = 'frm' action="findPw" method="post" onsubmit="return inCheck(this)">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="userid">아이디</label>
	      
	      <div class="col-sm-3">          
	        <input type="text" class="form-control" id="userid" placeholder="Enter id" name="userid">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">이름</label>
	      
	      <div class="col-sm-3">          
	        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
	      </div>
	    </div>
	   <div class="form-group">
	      <label class="control-label col-sm-2" for="tel">전화번호</label>
	      <div class="col-sm-4">          
	        <input type="text" class="form-control" id="tel" placeholder="Enter tel"  name="tel">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-5">
	        <button type="submit" class="btn btn-default">확인하기</button>
	      </div>
	    </div>
	</form>
	<form class="form-horizontal" name = 'frm2' action="updatePw" method="post" onsubmit="return updatePw(this)">
	    <div class="form-group"> 
	    	<div class="col-sm-offset-2 col-sm-5">
			    <c:if test="${check ==1}">
			    	<script>
			    		opener.document.frm.userid.value = "";
			    		opener.document.frm.name.value = "";
			    		opener.document.frm.tel.value = "";
			    	</script>
			    	<label>일치하는 정보가 존재하지 않습니다.</label>
			    </c:if>
			</div>
		</div>
		<c:if test="${check ==0}">
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-5">
			    	<label>비밀번호를 변경해주세요.</label><br>
			    	<input type="hidden" value="${userid}" name="userid">
			    </div>
			 </div>
			 <div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-4">          
					<input type="password" class="form-control" id="userpw" placeholder="Enter passwd"  name="userpw">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd">비밀번호 확인</label>
				<div class="col-sm-4">          
					<input type="password" class="form-control" id="repasswd" placeholder="Enter repasswd"  name="repasswd">
				</div>
			</div>
			<div class="form-group">        
	      		<div class="col-sm-offset-2 col-sm-5">
					<button class="btn btn-default" type="submit">변경하기</button>
				</div>
			</div>
		</c:if>
	  </form>
	  <script type="text/javascript">
		function updatePw(){
			if(document.frm2.userpw.value==""){
				alert("비밀번호를 입력해주세요.");
				document.frm2.userpw.focus();
				return false;
			} else if(document.frm2.userpw.value != document.frm2.repasswd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.frm2.repasswd.focus();
				return false;
			} else {
				var check = confirm("확인을 누르시면 비밀번호 변경 후 로그인창으로 이동합니다.")
				if(check == true){
					document.frm2.submit();					
				}else{
					return false;
				}
			}
		}
	</script>
	<br><br>
	</div>
</body>
</html>