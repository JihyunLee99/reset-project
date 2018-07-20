<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${goRoot}js/jquery-1.12.4.js"></script>
<script src="${goRoot}js/bootstrap.min.js"></script>
<link href="${goRoot}css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot}css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot}css/main.css" rel="stylesheet">
<script src="${goRoot}js/ser.js"></script>
<script src="${goRoot}js/sign.js"></script>
<title>Normol LoginView</title>
<script type="text/javascript">
<!-- TODO: [kss] -비밀번호 / 성별 에러- 에러 발생 고쳐야됨 -->
$(function(){
    addFormEvent();
    
	$("#form").submit(function(e){
         e.preventDefault();
    	var result = submitCheck();
		if(result){
			if($("#password").length>0){
				var pw= $("#password").val();
				pw = $("#password").val(SHA256(pw));
				console.log(pw);
			}
			var data =$('#form').serialize();
			console.log(data);
/* 			$.post(".",data,function(output){
				if(output.result==200){
					window.location.href=ouput.url;
				}else{
					alert("알수 없는 이유로 회원가입이 실패하였습니다. 잠시후 다시 이용해주세요");
				}
			});// end $.post */
		}// end if
	});// end submit event
});
</script>
</head>
<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                    <img src="${goRoot}imgs/header_logo.png">
                </div>
                <div class="menu_login">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="search">검색</label>
                            <input type="text" class="form-control input_box" placeholder="검색">
                        </div>
                        <button type="submit" class="btn send_btn"><span class="main_font">검색</span></button>
                        <a href="${goRoot}login/" class="btn send_btn"><span class="main_font">로그인</span></a>
                        <a href="${goRoot}sign/" class="btn send_btn"><span class="main_font">회원가입</span></a>
                    </form>
                </div>
                <div class="menu_bar">
                    <ul class="nav">
                      <li class="current"><a href="index.html">홈</a></li>
                      <li><a href="${goRoot}about.html">랭킹</a></li>
                      <li class="top-menu"><a href="javascript:{}">화플</a>
                          <ul class="sub-menu">
                              <li><a href="${goRoot}scaffolding.html">Scaffolding</a></li>
                              <li><a href="${goRoot}typography.html">Typography</a></li>
                              <li><a href="${goRoot}shortcodes.html">Shortcodes</a></li>
                              <li><a href="${goRoot}tables.html">Tables</a></li>
                          </ul>
                      </li>
                      <li class="top-menu"><a href="javascript:{}">이벤트</a>
                           <ul class="sub-menu">
                              <li><a href="${goRoot}portfolio_2columns.html">2 Columns</a></li>
                              <li><a href="${goRoot}portfolio_3columns.html">3 Columns</a></li>
                              <li><a href="${goRoot}portfolio_4columns.html">4 Columns</a></li>
                          </ul>
                      </li>                                  
                      <li class="top-menu"><a href="javascript:{}">리뷰</a>
                           <ul class="sub-menu">
                              <li><a href="${goRoot}blog.html">Blog with right sidebar</a></li>
                              <li><a href="${goRoot}blog_post.html">Blog post</a></li>
                          </ul>
                      </li>
                      <li><a href="${goRoot}contacts.html">문의</a></li>
                    </ul>
                </div>
             </nav>                
             
        </div>    
    </div>
    <!--//header-->    
     <style type="text/css">
     .form-size{
     	max-width: 85%;
     	margin :10px auto; 
     }
     </style>
     	
    <!-- main contents -->
    <div class="page_container">
	<form action="./" method="post" id="form" class="form-size">
		<div class="form-group"> 
			<label for="email" class="">이메일</label>		
			<input type="email" name="email" id="email" class="form-control" value="${login_email }" placeholder="이메일입력"/>
		</div>
		<div class="form-group">
			<label for="nick">nick</label>		
			<input type="text" name="nick" id="nick" class="form-control" value="" placeholder="닉네임 입력"/>
		</div>
		<c:if test="${login_route eq 'normal' }">
		<div class="form-group">
			<label for="password">password</label>		
			<input type="password" name="password" id="password" class="form-control" placeholder="영소대문자,숫자 포함. 10자이상"/>
		</div>
		<div class="form-group">
			<label for="pwchk">password확인</label>		
			<input type="password" id="pwchk" class="form-control"/>
		</div>
		</c:if>
		<div class="form-group">
			<label for="phone">연락처</label>		
			<input type="text" name="phone" id="phone" class="form-control" placeholder="-를 제외한 숫자만 입력"/>
		</div>
		<div class="form-group">
			<label for="gender">성별</label>		
 			<input type="radio" name="gender" id="gender_1" class="form-control" value="남성" /><label for="gender_1">남성</label><br>
 			<input type="radio" name="gender" id="gender_2" class="form-control" value="여성" checked/><label for="gender_2">여성</label><br>
		</div>
		<div class="form-group">
			<label for="age">age</label>		
			<input type="number" name="age" id="age" class="form-control" value="30"/>
		</div>
		<div class="form-group">
			<label>피부타입</label>		
 			<input type="radio" name="skin" id="skin_1" class="form-control" value="지성" checked/><label for="skin_1">지성</label><br>
 			<input type="radio" name="skin" id="skin_2" class="form-control" value="건성" /><label for="skin_2">건성</label><br>
 			<input type="radio" name="skin" id="skin_3" class="form-control" value="민감성"/><label for="skin_3">민감성</label><br>
  		</div>
  		<input type="hidden" name="join_route" value="${login_route}" />
		<input type="hidden" name="user_type"value="일반" />
		<input type="hidden" name="cart" value=";"/>
		<input type="hidden" name="exp" value="0"/>
		<div role="group" class="btn-group">
			<button type="submit" class="btn btn-danger">입력</button>
			<button type="reset" class="btn btn-default">취소</button>
		</div>
	</form>
       
    </div>
    <!-- //main contents -->

    <!--footer-->
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="imgs/footer_logo.png" alt="" /></a></div>
                        <div class="copyright">&copy; 2020 Jessica White. Professional Fashion Photography. All Rights Reserved.</div>                        
                    </div>
                    <div class="footer_R">
                        <div class="fright">
                            <form action="#" method="post">
                                <input class="inp_search" name="name" type="text" value="   Search the Site" onfocus="if (this.value == 'Search the Site') this.value = '';" onblur="if (this.value == '') this.value = 'Search the Site';" />
                            </form>
                        </div>
                        <div class="footer_menu">
                            <ul class="nav">
                                <li><a href="index.html" class="current">홈</a></li>
                                <li><a href="about.html">랭킹</a></li>
                                <li><a href="scaffolding.html">화플</a></li>
                                <li><a href="portfolio_2columns.html">이벤트</a></li>
                                <li><a href="blog.html">리뷰</a></li>
                                <li><a href="contacts.html">문의</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//footer-->    
</body>
</html>
