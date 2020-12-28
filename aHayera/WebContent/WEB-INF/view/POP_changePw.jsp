<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pop_changepw</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>HAYERA!</title>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link href="css/bootstrap.css" rel="stylesheet" />



<script src="/aHayera/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<!-- validate 유효성  -->
<script src="/aHayera/js/jquery.validate.min.js" type="text/javascript"></script>

<!--송채은 css-->
<link rel="stylesheet" type="text/css" href="css/mypage_util.css">
<link rel="stylesheet" type="text/css" href="css/mypage_modify.css">

<!-- ↓ 장바구니 화살표 아이콘 -->
  <!-- ↓ 장바구니 화살표 아이콘 -->
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">


<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="css/ct-navbar.css" rel="stylesheet" />

<!-- Optional - Adds useful class to manipulate icon font display -->
<link rel="stylesheet" href="css/pe-icon-7-stroke_helper.css">


<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>
<script
	src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

<!-- 제이쿼리 순서 중요 먼저 있어야 아래를 읽을 수가 있다. -->
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>

<!-- mypage 절대 경로 -->
<script src="js/mypageAddr.js"></script>

<script src="js/bootstrap.js" type="text/javascript"></script>
​
<script src="js/ct-navbar.js"></script>



<style>

/* KOSMO : 장바구니 CSS */
.table {
	width: 750px;
	text-align: center;
}

  .cartEachQty {
            /* 장바구니 수량 칸 너비 */
            padding-left: 10px;
            padding-right: 10px;
          }



</style>



<script type="text/javascript">

$(function(){
 

    $.validator.addMethod("regex", function(value, element, regexpr) {   //validate 시작함수
      if( regexpr.test(value) ){
         
         return true;
      
      }else{
      
         return false;
      }

   }, "Please enter a valid pasword.");
    
     
     
    $('#frm').validate({
        rules: {
         
          password_new:{
             required:true,
             minlength:8,
             regex : /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
          },
          password_new_ch:{
             equalTo: "#password_new",
             required:true
             
          }
          },
     
      messages:{
         
         password_new:{
            regex:"문자,숫자, 특수문자로 입력해주세요.",
            required:"필수 입력사항입니다.",
            minlength : "8자리 이상 입력하세요."
            
         },
         password_new_ch:{
            equalTo : "새비밀번호와 일치하지 않습니다",
            required:"필수 입력사항입니다."
         },
  
      }
   });
   
   
   
   $('#password').focusout(function () {
      
      
       $.ajax({
          url:"before_pw.do",
          contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
          success : function (before_pw) {
             
             if($('#password').val()!= before_pw){
                $('#password').val("");     //비밀번호가 맞지 않는 경우 초기화 해줌
                alert("현재 비밀번호를 입력하세요");
                
             }   else{
                alert("성공");
             }   
         },
         err : function (err) {
            console.log(err)
         }
       })   

   }) //현재 비밀번호 확인
 
   $('#password_new').focusout(function(){
       var password_new = $('#password_new').val();
   
      console.log($('#password_new').val().length);
      
     if($('#password_new').val().length < 8 ) {
      
     //   alert("8이하면 걍 삭제되줄수 없니?")
        $('#password_new').val(""); 
           
        return; 
       
        } 

   }) //8이하인 경우 삭제 됨
   
    $('#password_new_ch').focusout(function(){
       var password_new = $('#password_new').val();
       var password_new_ch = $('#password_new_ch').val();

     if(password_new!=password_new_ch) {
 
		alert("새비밀번호를 확인하세요") 
		
       $('#password_new').val(""); 
       $('#password_new_ch').val(""); 
       
       return; 
       
       }
    })	//새비번과 새비번확인 

   $('#last_btn').click(function () {
      
      $.ajax({
         url:"change_pop.do",
         contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
         data: {
            'password_new': $('#password_new').val(),
            'password_new_ch' : $('#password_new_ch').val()
         },
         success : function (result) { //1
           
        	alert(result+"성공");
            window.close()
            
         },
         err : function (err) {
            console.log(err)
         }
            
      })
         
      
   })//새 비밀번호 비교 확인

    
      $('#no_pw_btn').click(function () {
         
         //alert("취소")
         window.close()
         
      })
      
      
})


</script>
</head>


<body>

	<div id="navbar-full">
		<div id="navbar">
			<!-- navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange -->
			​
			<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand navbar-brand-logo" href="main.jsp">
							<div class="logo">
								<img src="./images/logo_only_transparent_small.png">
							</div>
							<div class="brand">HAYERA</div>
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						​
						<ul class="nav navbar-nav navbar-center">
							<!--  모이스처, 선크림 삭제 -->
						</ul>
						​
 				<ul class="nav navbar-nav navbar-right">

                <!-- KOSMO : NAVBAR에 카테고리 추가 시 사용 -->
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle">
                    <i class="pe-7s-shopbag" id="cartSizeIcon">
                      <span class="label" id="cartSize"></span>
                    </i>
                    <p>장바구니</p>
                  </a>
                  <ul class="dropdown-menu">
                    <table class="main_cart">
                      <!-- 장바구니 동적 테이블 자리 -->
                    </table>
                    <div class="panel panel-info">
                      <div class="panel-heading">
                        <h3 class="panel-title">총 결제금액</h3>
                      </div>
                      <div class="panel-body">
                        <span id="cartSumPrice"></span> 원 &emsp;&emsp;
                        <!-- 버튼에 결제창으로 가는 이벤트 부여 -->
                        <button type="button" class="btn btn-primary" onclick="clickGoFromCart()">바로 결제</button>
                      </div>
                    </div>
                  </ul>

                </li>

                <li class="dropdown">
                  <!-- mainAfterLogin 에만 해당 -->
                  <a href="#" class="dropdown-toggle">
                    <i class="pe-7s-user"></i>
                    <p>내 계정 <b class="caret"></b></p>
                  </a>
                  <ul class="dropdown-menu">

         			<%--  <li><a href="mypage.do?customer_id=${sessionscope.login}">마이페이지</a></li>
                    <li><a href="orderhistory.do">주문 내역</a></li>  --%>
                    <li><a href="logout.do">로그아웃</a></li>
                  </ul>
                </li>
              </ul>

            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->

        </nav>

        <div class="blurred-container">
          <div class="img-src" style="background-image: url('images/main_background_top.png')"></div>
        </div>
      </div><!--  end navbar -->

    </div> <!-- end menu-dropdown -->

   <div class="main">
      <div class="container tim-container category_main"
         style="max-width: 300px; padding-top: 20px">
   
            <form id="frm"  method="get" action="updateMypage.do">
               <table>
                  <p class="costomer">
                  <div class="wrap-input100 validate-input"
                     data-validate="Repeat Password is required">
                     <span class="label-input100">현재 비밀번호</span>
                     <input class="input100" name="password"  type="password" id='password' password/>
                     <span class="focus-input100"></span>
                  </div>
                  <div class="wrap-input100 validate-input"
                     data-validate="Name is required">
                     <span class="label-input100">새 비밀번호</span>
                     <input class="input100" name="password_new" id="password_new" type="password" password_new/>
                     <span class="focus-input100"></span>
                  </div>
                  
                  <div class="wrap-input100 validate-input"
                     data-validate="Name is required">
                     <span class="label-input100">새 비밀번호 확인</span>
                     <input class="input100" name="password_new_ch" id="password_new_ch" type="password" password_new_ch />               
                     <span class="focus-input100"></span>
                  </div>
                  
                  
                  
                  </p>
               </table>
            </form>

<!-- 현재 비밀번호 <input name="password"  type="text" id='password'/><br/>
새 비밀번호 <input name="password_new" id="password_new" type="text"/><br/>
새 비밀번호 확인 <input name="password_new_ch" id="password_new_ch" type="text"/><br/> -->
<br>
<br>
<br>

<input type="button" id="last_btn" value="변경">
<input type="button" id="no_pw_btn" value="취소">





</body>
</html>