<%@page import="org.apache.ibatis.reflection.SystemMetaObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
               <meta charset="utf-8" />
               <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

               <!-- 타이틀 바 -->
               <link rel="shortcut icon" type="image/x-icon" href="images/logo_only_transparent_small.png">
               <title>상세페이지</title>

               <link href="css/bootstrap.css" rel="stylesheet" />
               <link href="css/hayera.css" rel="stylesheet" />
               <!-- ↓ 장바구니 화살표 아이콘 -->
               <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">

               <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
               <link href="css/ct-navbar.css" rel="stylesheet" />

               <script src="js/jquery-1.10.2.js" type="text/javascript"></script>


               <script src="js/bootstrap.js" type="text/javascript"></script>
               <script src="js/ct-navbar.js"></script>

               <!-- 하예라 전용 JS Files   -->
               <script src="./js/hayera.js"></script>
               <link href="css/hayera.css" rel="stylesheet" />

               <!--     Font Awesome     -->
               <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
               <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
               <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

               <!-- 아이콘 https://material.io/resources/icons/?style=baseline -->
               <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
               <style>
.fa-heart {
	color: #F74933;
}
.space-100 {
	height: 100px;
	display: block;
}
.prettyprint {
	background-color: #ffffff;
	border: 1px solid #999;
	margin-top: 20px;
	padding: 20px;
	text-align: left;
}
.atv, .str {
	color: #05AE0E;
}
.tag, .pln, .kwd {
	color: #3472F7;
}
.atn {
	color: #2C93FF;
}
.pln {
	color: #333;
}
.com {
	color: #999;
}
/* KOSMO : 장바구니 CSS */
.table {
	width: 750px;
	text-align: center;
}
.panel-body {
	float: right;
}
/* 여기까지 */
.detail-radio-filter {
	list-style: none;
	float: right;
}
.detail-filter {
	float: left;
	display: list-item;
}
/* 바로결제버튼 */
.detail_button {
	-moz-box-shadow: inset 0px 0px 15px 3px #23395e;
	-webkit-box-shadow: inset 0px 0px 15px 3px #23395e;
	box-shadow: inset 0px 0px 15px 3px #23395e;
	background-color: #2e466e;
	-webkit-border-top-left-radius: 0px;
	-moz-border-radius-topleft: 0px;
	border-top-left-radius: 0px;
	-webkit-border-top-right-radius: 0px;
	-moz-border-radius-topright: 0px;
	border-top-right-radius: 0px;
	-webkit-border-bottom-right-radius: 0px;
	-moz-border-radius-bottomright: 0px;
	border-bottom-right-radius: 0px;
	-webkit-border-bottom-left-radius: 0px;
	-moz-border-radius-bottomleft: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0;
	border: 1px solid #1f2f47;
	display: inline-block;
	color: #ffffff;
	font-family: Times New Roman;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 50px;
	line-height: 50px;
	width: 160px;
	text-decoration: none;
	text-align: center;
	text-shadow: 0px 1px 0px #263666;
}
.baguni_button:hover {
	background-color: #415989;
}
.baguni_button:active {
	position: relative;
	top: 1px;
}
/* 장바구니 버튼 */
.baguni_button {
	background-color: white;
	border: 1px solid #125288;
	display: inline-block;
	color: #040f78;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 50px;
	line-height: 50px;
	width: 160px;
	text-decoration: none;
	text-align: center;
}
.baguni_button:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6
		), color-stop(1, #ffffff));
	background: -moz-linear-gradient(center top, #f6f6f6 5%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6',
		endColorstr='#ffffff');
	background-color: #f6f6f6;
}
.baguni_button:active {
	position: relative;
	top: 1px;
}

/* li 앞 . 삭제 */
.detail-review-list {
	list-style: none;
}
.btnqna, .writeqna {
	border-radius: 50px;
	color: #fff;
	background-color: #084A83;
	font-family: 'Calibri';
	font-weight: bold;
	width: 150px;
} 
.cartEachQty {
	/* 장바구니 수량 칸 너비 */
	padding-left: 10px;
	padding-right: 10px;
}
.btn btn-cartPay{
	background-color: #125288;
}

</style>
               <title>상세페이지</title>
               <script type="text/javascript">
                  // Jquery 시작
                  $(document).ready(function () {
                	 $("#cartSumPrice").text("0");
                     refreshCart(); // 장바구니 가져오기 (반복 부분에 이 함수 사용) 
                     // 장바구니 #countUp 버튼
                     $(document).on('click', '#countUp', function () {
                        var qty = $(this).parent().parent('tr').find('.cartEachQty');
                        qty.text(parseInt(qty.text()) + 1);
                        var info = {
                           prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
                           each_qty: qty.text()
                        }
                        $.ajax({
                           type: 'post',
                           data: info,
                           url: 'editCart.do',
                           dataType: 'json',
                           contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                           success: function () {
                              refreshCart(); // 장바구니 다시 가져오기
                           },
                           error: function (err) {
                              console.log(err);
                           }
                        }); // --- end of $.ajax 장바구니 #countUp 버튼
                     }); // --- end of 장바구니 #countUp 버튼
                     $(document).on('click', '#countDown', function () {
                        var qty = $(this).parent().parent('tr').find('.cartEachQty');
                        if (qty.text() == 1) {
                           alert("최소 수량은 1개입니다.");
                        }
                        else {
                           qty.text(parseInt(qty.text()) - 1);
                           var info = {
                              prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
                              each_qty: qty.text()
                           }
                           $.ajax({
                              type: 'post',
                              data: info,
                              url: 'editCart.do',
                              dataType: 'json',
                              contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                              success: function () {
                                 refreshCart(); // 장바구니 다시 가져오기
                              },
                              error: function (err) {
                                 console.log(err);
                              }
                           }); // --- end of $.ajax 장바구니 #countDown 버튼
                        }
                     }); // --- end of 장바구니 #countDown 버튼
                     $(document).on('click', '#cartRemove', function () {
                    	
                        var info = {
                           prod_no: $(this).parent().parent('tr').find('td:nth-child(1)').text(),
                           remove: 'yes'
                        }
                        $.ajax({
                           type: 'post',
                           data: info,
                           url: 'editCart.do',
                           dataType: 'json',
                           contentType: 'application/x-www-form-urlencoded;charset=utf-8',
                           success: function () {
                              refreshCart(); // 장바구니 다시 가져오기
                           },
                           error: function (err) {
                              console.log(err);
                           }
                        }); // --- end of $.ajax 장바구니 #cartRemove 버튼
                     }); // --- end of 장바구니 #cartRemove 버튼
                     // 장바구니 클릭하면 열려진 상태 유지하기. 다시 누르면 or 메인화면 다른 구역 클릭하면 닫히기
                     $('li.dropdown a').on('click', function (event) {
                        $(this).parent().toggleClass('open');
                     });
                     $('body').on('click', function (e) {
                        if (!$('li.dropdown').is(e.target)
                           && $('li.dropdown').has(e.target).length === 0
                           && $('.open').has(e.target).length === 0
                        ) {
                           $('li.dropdown').removeClass('open');
                        }
                     });
                     
                  	// 장바구니 내 바로결제 버튼 클릭 시 --> 주문결제 페이지로 이동
                     $("#clickGoFromCart").click(function () {
                     	var id = '<%=(String)session.getAttribute("login")%>';
                     	if (id == 'null') {
                             window.location.href = "login.do";
                           } else if($("#cartSumPrice").text()!="0"){
                             	window.location.href = "orderFromCart.do";
                           } else{
                        	  		alert("장바구니에 상품이 없습니다.");
               					return;
                           }
                         });
                  }); // --- end of jquery document ready
                  // 바로 결제하기 클릭 시
                  function clickGopay() {
                     var id = '<%=(String)session.getAttribute("login")%>'
                     if (id == 'null') {
                    	 window.location.href = "login.do";
                     } else {
                        var form = document.goodsCountform;
                        form.submit();
                     }
                  }
                  // '장바구니 추가' 클릭 시
                  function addCart() {
                     var info = {
                        prod_no: ${ productSelected.prod_no },
                        each_qty: $('#spinner').val()
                  }
                  $.ajax({
                     type: "POST",
                     data: info,
                     dataType: "json",
                     url: "addCart.do",
                     contentType: 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
                     success: function (data) {
                        refreshCart(); // 장바구니 가져오기
                     },
                     error: function (err) {
                        alert("에러가 발생했습니다: productDetail.jsp --- 카트 상품 추가 에러");
                     }
                  });
                  }
               </script>

            </head>

            <body>
               <div id="navbar-full">
                  <div id="navbar">
                     <!--    
        navbar-default can be changed with navbar-ct-blue navbar-ct-azzure navbar-ct-red navbar-ct-green navbar-ct-orange  
        -->

                     <nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
                        <div class="container">
                           <!-- Brand and toggle get grouped for better mobile display -->
                           <div class="navbar-header">
                              <button type="button" class="navbar-toggle" data-toggle="collapse"
                                 data-target="#bs-example-navbar-collapse-1">
                                 <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span>
                              </button>
                              <a class="navbar-brand navbar-brand-logo" href="main.jsp">
                                 <div class="logo">
                                    <img src="./images/logo_only_transparent_small.png">
                                 </div>
                                 <div class="brand">HAYERA</div>
                              </a>
                           </div>
                           <!-- Collect the nav links, forms, and other content for toggling -->
                           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                              <ul class="nav navbar-nav navbar-center">
                                 <li><a href="category.do?category=모이스처라이저"> <i class="pe-7s-drop"> </i>
                                       <p>모이스처라이저</p>
                                    </a></li>
                                 <li><a href="category.do?category=선크림"> <i class="pe-7s-sun"> </i>
                                       <p>선크림</p>
                                    </a></li>
                              </ul>

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
                                          <tr>
                                             <th>선택</th>
                                             <th>이미지</th>
                                             <th>상품명</th>
                                             <th>수량</th>
                                             <th>가격</th>
                                             <th>합계</th>
                                             <th>삭제</th>
                                          </tr>

                                          <!-- ajax 활용한 동적 테이블 들어오는 자리. -->
                                       </table>
                                       <div class="panel panel-info">
                                          <div class="panel-heading">
                                             <h3 class="panel-title">총 결제금액</h3>
                                          </div>
                                          <div class="panel-body">
                                             <span id="cartSumPrice"></span> 원 &emsp;&emsp;
                                             <!-- 버튼에 결제창으로 가는 이벤트 부여 -->
                                             <button type="button" class="btn btn-cartPay"
                                                id="clickGoFromCart">바로
                                                결제</button>
                                          </div>
                                       </div>
                                    </ul>
                                 </li>
                                 <!-- 로그인 세션이 존재하지 않으면 -->
                                 <c:if test="${login eq null}">
                                    <li>
                                       <!-- 로그인 클릭 시 login.jsp로 이동. 로그인 화면이 팝업 형태인데 화면 전환이 조금 어색한 상태 -->
                                       <a href="login.do">
                                          <i class="pe-7s-user"></i>
                                          <p>로그인</p>
                                       </a>
                                    </li>
                                 </c:if>

                                 <!-- 로그인 세션이 존재하면 -->
                                 <c:if test="${login ne null}">
                                    <li class="dropdown">
                                       <a href="#" class="dropdown-toggle">
                                          <i class="pe-7s-user"></i>
                                          <p>내 계정 <b class="caretHayera"></b></p>
                                       </a>
                                       <ul class="dropdown-menu">
                                          <!-- mainAfterLogin 에만 해당 -->
                                          <li><a href="mypage.do?customer_id=${sessionScope.login}">개인정보수정</a></li>
                                          <li><a href="orderHistory.do">주문 내역</a></li>
                                          <li><a href="logout.do">로그아웃</a></li>
                                       </ul>
                                    </li>
                                 </c:if>
                              </ul>

                           </div>
                           <!-- /.navbar-collapse -->
                        </div>
                        <!-- /.container-fluid -->

                     </nav>

                  </div>
                  <!--  end navbar -->

               </div>
               <!-- end menu-dropdown -->
               <div style="clear: both;"></div>
               <div class="main">
                  <div class="container tim-container category_main" style="max-width: 800px; padding-top: 20px">
                     <br> <br> <br> <br> <br>

                     <div class='detail_product'>
                        <div class="detail_product-img">
                           <img src="/aHayera/resources/upload/${productSelected.img_url }">
                        </div>
                        <div class="detail-product-list">
                           <div class="detail-product-product_name" >
                              ${productSelected.prod_name }
                           </div>
                           <div class="detail_product-brand">${productSelected.brand }</div>
                           
                           <c:set var="rating" value="${productSelected.avg_rating}"/>
                           
                           <div class="item-reviewno"><img src="./images/star_${rating}.png"><span>${productSelected.avg_rating}</span></div>
                           <c:set var="discount_price" value="${productSelected.discount_price}"/>
                           <c:choose>
                           		<c:when test="${discount_price eq 0}">
                           			<span class="detail-product-price"><fmt:formatNumber value="${productSelected.price}" pattern="#,###" /></span>원
                           		</c:when>
                           		<c:otherwise>
                           			<span class="detail-product_discoint_price"><fmt:formatNumber value="${productSelected.discount_price}" pattern="#,###" /></span>원<br>
                           			<span class="detail-product-price-del"><del><fmt:formatNumber value="${productSelected.price}" pattern="#,###" />원</del></span>
                           		</c:otherwise>	
                           </c:choose>
                           
                           
                           <div class="detail-product-volume_price">
                              ${productSelected.capacity }ml<br />
                           </div>
                           
                           <div>
                              <form
                                 action="goOrderFromProductDetail.do?customer_id=${sessionScope.login}&prod_no=${productSelected.prod_no}"
                                 name="goodsCountform" method="post">
                                 <table class="detail-info-table">
                                    <tbody>
                                       <tr class="detail-table-info">
                                          <th class="info__th" width="50px"><span class="detail-head">설명</span></th>
                                          <td class="info__td">

                                             <!-- DB 추가 필요 -->
                                             <div class="info__description" style="font-family: 'Calibri'; font-size: 16px">
                                             	${productSelected.product_explain}<br/>
                                                
                                             </div>
                                             
                                          </td>
                                       </tr>
                                         <hr/>
                                       <tr class="detail-table-count"> 
                                      
                                          <th class="info__th" width="50px" ><span class="detail-head" >수량</span></th>
                                          <td class="info__td">
                                             <div class="countcheck">
                                                <button type="button" id='countdown' class="btn btn-primary btn-xs"
                                                   onclick="change(-1)" style="background-color: #125288;">
                                                   <span class="glyphicon glyphicon-minus"></span>
                                                </button>
                                                <input id="spinner" type="text" value="1" name="goodsCount" style="text-align: center; width: 30px; border: none;"/>
                                                <button type="button" id='countup' class="btn btn-primary btn-xs"
                                                   onclick="change(1)" style="background-color: #125288;">
                                                   <span class="glyphicon glyphicon-plus"></span>
                                                </button>
                                             </div>
                                          </td>
                                       </tr>
                                       <!---->
                                    </tbody>
                                 </table>
                              </form>
                              <hr/>
                              <div>
                               <a href="#"  class='baguni_button'><input class= 'baguni_button' type="button" value="장바구니 추가" onclick="addCart()"></a>
                               <a href="#" class="detail_button"><input class='detail_button' type="button" value="바로 결제하기" onclick="clickGopay()"></a>
                              </div>

                           </div>

                        </div>

                     </div>
                     <!-- end of detail-product -->
                     <br>
                     <div style="clear: both;"></div>
                     <br> <br> <br>
                     <div class='detail-board'>
                        <div class='detail-board-list'>
                           <div class="detail-child">
                              <a><span id='productexplain'>상품정보</span></a>
                           </div>
                           <div class="detail-child">
                              <a><span id='reviewboard' style="width: 500px">리뷰</span></a>
                           </div>
                           <div class="detail-child">
                              <a><span id='qnaboard'>문의</span></a>
                           </div>
                        </div>
                        <br>
                        <div style="clear: both;"></div>
                        <article class="detail-boardmenu">
                           <div class="detail-board-content">
                              <div class="detail-review-filter">
                                 <ul class="detail-radio-filter" role="radiogroup">
                                    <li class="detail-filter" role="presentation">
                                       <div class='orderbyy' id="recent" aria-checked="true">최신순 |</div> 
                                    </li>
                                    <li class="detail-filter" role="presentation">
                                       <div class='orderbyy' id="highrate" aria-checked="false"> 평점 높은순</div>
                                    </li>

                                 </ul>
                              </div>
                              <div style="clear: both;"></div>
                           </div>
                           <div id="appendgo">
                              <div id="reviewstart">

                              </div>
                           </div>
                        </article>
                        <article class="detail-boardmenu-qna">
                           <input type="button" value="문의하기" class="writeqna" id="writeqna" style="float: right; height: 30px">
                           <br />

                           <c:forEach items="${qnaList }" var="qna">
                              <ul>
                                 <div style='float:left; width:40px; height:50px;'>
                                    <i class="material-icons"
                                       style='position: relative; top: 20%; left: 20%; height:50px;'>face </i>
                                 </div>
                                 <li><span style='font-size: 18px;'> ${qna.contents }</span>
                                    <br />
                                    ${qna.customer_id } | ${qna.qnaday}
                                 </li>
                              </ul>
                              <c:if test="${empty qna.reply_contents}">
                              	<div style="color: #999; padding-left: 80px"> 답변 예정입니다</div>
                              </c:if>
                                 <c:if test="${not empty qna.reply_contents}">
                             <ul>
                                  <li style="list-style: none; padding-left: 70px">
                                  <img alt="" src="/aHayera/images/point.jpg" style="width:30px; height: 30px;">
                                  <img alt="" src="/aHayera/images/adminicon.svg" style="width:20px; height: 20px;">
                                  
                                  ${qna.reply_contents }
                                    <br />
                                   <span style="padding-left: 50px"> ${qna.replyday }</span>
                                 </li>
                              </ul>
                              </c:if>
                              <hr />
                           </c:forEach>

                           <div id='taappend'>
                              <textarea id="taqna" rows="" cols="" style="width:770px; height:80px; "
                                 placeholder="문의사항을 적어주세요:)"></textarea>
                              <div style="clear: both; padding-bottom: 20px;""></div>
            	  			<input type="button" class="btnqna" id="btnqna" value="작성완료" style="text-align: center; float: right; cursor:pointer;">
                              </div>
                        </article>
                        <article class="detail-product-explain">
                           <div>
                              <img src=${productSelected.explain_url} style="max-width:100%; height:auto;">
                           </div>
                        </article>
                     </div>
                     <br /> <br />
                     <p class="text-right legal-info">
                        HAYERA 하예라 서울특별시 금천구 가산디지털2로 123 월드메르디앙벤처센터<br> 대표: 김영권 외 3명 /
                        사업자등록번호: 111-11-11111 / 개인정보관리자: 지우빈 <br> 메일: admin@hayera.com
                        / Copyright &copy;2020 hayera
                  </div>
                  <!-- end container -->
               </div>
               <!-- end main -->
               <script type="text/javascript">
                  // 수량 변경
                  function change(num) {
                     var x = $('#spinner').val();
                     var y = Number(x) + num;
                     if (x == 1) $('#spinner').val(1);
                     $('#spinner').val(y);
                     // 수량에 1 이상만 들어올 수 있게
                     if (y < 1) {
                        alert("한 개 이상 가능합니다.");
                        $("#spinner").val(1);
                     }
                  } // end of change(num)
                  //qna게시판 눌렀을 때 qna로 
                  $('#qnaboard').click(function () {
                	 
                	
                     $('.detail-boardmenu').hide();
                     $('.detail-boardmenu-qna').show();
                     $('#taappend').hide();
                     $('.detail-product-explain').hide();
                  });
                  //상품 정보 눌렀을 때 상품정보로
                  $('#productexplain').click(function () {
                     $('.detail-boardmenu').hide();
                     $('.detail-boardmenu-qna').hide();
                     $('.detail-product-explain').show();
                  })
                  //review게시판 눌렀을 때 review로
                  $('#reviewboard').click(function () {
                     $('.detail-boardmenu-qna').hide();
                     $('.detail-product-explain').hide();
                     $('.detail-boardmenu').show();
                  });
                  $('#writeqna').hover(
                		  function () {
                	  $(this).css({
                		  'background-color': 'white', 
                		  'border-color' : '#084A83',
                		  'color' : '#084A83'
                	  }) },
                	  function (){
                		  $(this).css({
                    		  'background-color': '#084A83', 
                    		  'border-color' : '#084A83',
                    		  'color' : 'white'
                    	  })
                	  }
                	  
                  )
                  //처음화면은 review
                  $(function () {
                     $('.detail-boardmenu').hide();
                     $('.detail-boardmenu-qna').hide();
                     //리뷰 먼저 띄우기
                     $.ajax({
                        url: "highrate.do?orderby=writeday",
                        data: { 'prod_no': ${ productSelected.prod_no }},
                     dataType : "json",
                     success: function (list) {
                        $('#appendgo').empty();
                        for (i = 0; i < list.length; i++) {
                           //$('#reviewstart').empty();
                           $('#appendgo').append(
                              '<ul>' +
                              '<li class="detail-review-list">' +
                              '<div class="list-item">' +
                              '<span style="float:right" id="writeday">·' + list[i].writeday + ' 전</span>' +
                              '<div class="user-info">' +
                              '<div style="float:left; width:40px; height:50px;">' +
                              '<i class="material-icons" style="position: relative; top: 20%; left: 20%; height:50px;">face </i>' +
                              '</div>' +
                              '<div class="reviewgogo" style="float:left">' +
                              '<span id="customer_id" style="font-size:20px">' + list[i].customer_id + '</span>' +
                              '<span id="gender">·' + list[i].gender + '</span>' +
                              '<span id="skintype">·' + list[i].skintype + '</span>' +
                              '<br>' +
                              '<span id="rate">  <img src="/aHayera/images/star_' + list[i].rate + '.png"></span>' +
                              '</div>' +
                              '</div>' +
                              '<div style="clear: both; padding-bottom: 20px;""></div>' +
                              '<p class="contents" style="padding-left: 50px">' + list[i].contents + '</p>' +
                              '</div>' +
                              '</li>' +
                              '</ul>' +
                              '</div>'+
                              '<hr/>'
                           )
                        }
                     },
                     err: function (err) { console.log(err) }
         })
                  

                  })

                  //평점 높은 순
                  $('#highrate').click(function () {
                     $.ajax({
                        url: "highrate.do?orderby=rate desc",
                        //contentType : 'application/x-www-form-urlencoded;charset=utf-8', // 한글처리
                        data: { 'prod_no': ${ productSelected.prod_no }},
                     dataType : "json",
                     success: function (list) {

                        $('#appendgo').empty();
                        for (i = 0; i < list.length; i++) {

                           $('#appendgo').append(

                              '<ul>' +
                              '<li class="detail-review-list">' +
                              '<div class="list-item">' +
                              '<span style="float:right" id="writeday">·' + list[i].writeday + ' 전</span>' +
                              '<div class="user-info">' +
                              '<div style="float:left; width:40px; height:50px;">' +
                              '<i class="material-icons" style="position: relative; top: 20%; left: 20%; height:50px;">face </i>' +
                              '</div>' +
                              '<div class="reviewgogo" style="float:left">' +
                              '<span id="customer_id" style="font-size:20px">' + list[i].customer_id + '</span>' +
                              '<span id="gender">·' + list[i].gender + '</span>' +
                              '<span id="skintype">·' + list[i].skintype + '</span>' +
                              '<br>' +
                              '<span id="rate">  <img src="/aHayera/images/star_' + list[i].rate + '.png"></span>' +
                              '</div>' +
                              '</div>' +
                              '<div style="clear: both; padding-bottom: 20px;""></div>' +
                              '<p class="contents" style="padding-left: 50px">' + list[i].contents + '</p>' +
                              '</div>' +
                              '</li>' +
                              '</ul>' +
                              '</div>'+
                              '<hr/>'
                           )
                        }
                     },
                     err: function (err) { console.log(err) }
         })
      })
                  //최신순
                  $('#recent').click(function () {
                	  
                     $.ajax({
                        url: "highrate.do?orderby=writeday",
                        data: { 'prod_no': ${ productSelected.prod_no }},
                     dataType : "json",
                     success: function (list) {
                        $('#appendgo').empty();
                        for (i = 0; i < list.length; i++) {
                           //$('#reviewstart').empty();
                           $('#appendgo').append(
                              '<ul>' +
                              '<li class="detail-review-list">' +
                              '<div class="list-item">' +
                              '<span style="float:right" id="writeday">·' + list[i].writeday + ' 전</span>' +
                              '<div class="user-info">' +
                              '<div style="float:left; width:40px; height:50px;">' +
                              '<i class="material-icons" style="position: relative; top: 20%; left: 20%; height:50px;">face </i>' +
                              '</div>' +
                              '<div class="reviewgogo" style="float:left">' +
                              '<span id="customer_id" style="font-size:20px">' + list[i].customer_id + '</span>' +
                              '<span id="gender">·' + list[i].gender + '</span>' +
                              '<span id="skintype">·' + list[i].skintype + '</span>' +
                              '<br>' +
                              '<span id="rate">  <img src="/aHayera/images/star_' + list[i].rate + '.png"></span>' +
                              '</div>' +
                              '</div>' +
                              '<div style="clear: both; padding-bottom: 20px;""></div>' +
                              '<p class="contents" style="padding-left: 50px">' + list[i].contents + '</p>' +
                              '</div>' +
                              '</li>' +
                              '</ul>' +
                              '</div>'+
                              '<hr/>'
                           )
                        }
                     },
                     err: function (err) { console.log(err) }
         })
         
      })
                  //문의하기 버튼 눌렀을 때 로그인 여부 확인
                  $('#writeqna').click(function () {
                     var id = '<%=(String)session.getAttribute("login")%>'
                     if (id == 'null') {

                        location.href = "login.do";
                     } else {
                        $('#taappend').show();

                     }
                  })
                  //문의 작성완료 버튼눌렀을때
                  $('#btnqna').click(function () {
                     $.ajax({
                        data: {
                           'contents': $('#taqna').val(),
                           'prod_no': ${ productSelected.prod_no }},
                     url : "qnawrite.do",
                     success: function (result) {
                        alert("작성이 완료되었습니다")
                        location.href = 'productSelected.do?prod_no=' + ${ productSelected.prod_no } +''
                        $('#taqna').val("");
                     },
                     err : function (err) {
                        console.log(err);
                     }
			
		})
	})



               </script>
            </body>


            </html>