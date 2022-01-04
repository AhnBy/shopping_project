<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
  	#need{color:red;}
	#idcheck,#emailcheck{color : red;}
</style>
<script type="text/javascript">
	function idCheck(userid){
		if(userid==''){
		alert("아이디를 입력하세요");
		document.frm.userid.focus();
		}else{
			var url = "idcheck";
			var param = "userid="+userid;
			$.get(url, param, function(data, textStatus) {
				$("#idcheck").text(data.str);
				}
			)
		}
	} 
	function emailCheck(email){
		if(email==''){
			alert("email를 입력하세요");
			document.frm.email.focus();
		}else{
			var url = "emailcheck";
			url += "?email="+email;
		    $.get(url, function(data, textStatus) {
				$("#emailcheck").text(data.str);
				}
			)
		}
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
<script type="text/javascript">
function inCheck(f){
	if(f.userid.value.length==0){
		alert("아이디를 입력하세요");
		f.userid.focus();
		return false;
	}
	if(f.userpw.value.length==0){
		alert("비번을 입력하세요");
		f.userpw.focus();
		return false;
	}
	if(f.repasswd.value.length==0){
		alert("비번확인을 입력하세요");
		f.repasswd.focus();
		return false;
	}
	if(f.userpw.value != f.repasswd.value){
		alert("비번과 비번확인이 일치하지 않습니다.");
		f.userpw.value="";
		f.repasswd.value="";
		f.userpw.focus();
		return false;
	}
	if(f.name.value.length==0){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.tel.value.length==0){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
}
</script>
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
	
	<h2 class="col-sm-offset-2 col-sm-10">회원가입</h2>
	<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 필수입력사항)</label>
	  <form class="form-horizontal" 
	        action="join"
	        method="post"
	        name = 'frm'
	        onsubmit="return inCheck(this)">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="id"><span id="need">*</span>아이디</label>
	      <div class="col-sm-3">          
	        <input type="text" class="form-control" id="userid" placeholder="Enter id" 
	        name="userid">
	      </div>
	      <button type="button" class="btn btn-default col-sm-2"
	      onclick="idCheck(document.frm.userid.value)">ID 중복확인</button>
	      <div id="idcheck"></div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="passwd"><span id="need">*</span>비밀번호</label>
	      <div class="col-sm-4">          
	        <input type="password" class="form-control" id="userpw" 
	        placeholder="Enter passwd"  name="userpw">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="repasswd"><span id="need">*</span>비밀번호 확인</label>
	      <div class="col-sm-4">          
	        <input type="password" class="form-control" id="repasswd" 
	        placeholder="Enter repasswd"  name="repasswd">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="mname"><span id="need">*</span>이름</label>
	      <div class="col-sm-4">          
	        <input type="text" class="form-control" id="name" 
	        placeholder="Enter 이름"  name="name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="birth">생년월일</label>
	      <div class="col-sm-4">          
	        <input type="date" class="form-control" id="birth" name="birthDate">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="tel"><span id="need">*</span>전화번호</label>
	      <div class="col-sm-4">          
	        <input type="text" class="form-control" id="tel" 
	        placeholder="Enter 전화번호"  name="tel">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email"><span id="need">*</span>이메일</label>
	      <div class="col-sm-3">          
	        <input type="email" class="form-control" id="email" 
	        placeholder="Enter email"  name="email">
	      </div>
	      
	      <button type="button" class="btn btn-default col-sm-2"
	      onclick="emailCheck(document.frm.email.value)">Email 중복확인</button>
	      <div id="emailcheck"></div>
	      
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
	      <div class="col-sm-1">          
	        <input type="text" class="form-control" 
	         name="zipcode" id="sample6_postcode" placeholder="우편번호">
	      </div>
	      
	      <button type="button" class="btn btn-default col-sm-2"
	      onclick="sample6_execDaumPostcode()">주소검색</button>
	      
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="sample6_address">주소</label>
	      <div class="col-sm-6">          
	        <input type="text" class="form-control" id="sample6_address" placeholder="주소" 
	         name="address1">
	        <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" 
	         name="address2">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-5">
	        <button type="submit" class="btn btn-default">등록</button>
	        <button type="reset" class="btn btn-default">취소</button>
	      </div>
	    </div>
	  </form>
	<br><br>
	</div>
</body>
</html>