<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; 

Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free Bootstrap Themes by Zerotheme dot com - Free Responsive Html5 Templates">
    <meta name="author" content="https://www.Zerotheme.com">
	
    <title>Hiking | Free Bootstrap Themes</title>
		<!-- 폰트어썸 cdn -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
			
		<!-- Bootstrap Core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		
		<!-- Custom CSS -->
		<link href="css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="css/lightbox.css">
		<link rel="stylesheet" href="fonts/stylesheet.css">
		
		<!-- Custom Fonts -->
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<!-- Owl Carousel Assets -->
		<link href="owl-carousel/owl.carousel.css" rel="stylesheet">
		<link href="owl-carousel/owl.theme.css" rel="stylesheet">
		
		<!-- jQuery and Modernizr-->
		<script src="js/jquery-2.1.1.js"></script>
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		    <script src="js/html5shiv.js"></script>
		    <script src="js/respond.min.js"></script>
		<![endif]-->

<style>
    div#popup{
        position: absolute; top:150px; left:850px; color:yellow;  
        width:400px; height: 400px; background-color:white; z-index: 999999;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px; height: 70px;
        padding:10px; color:black; 
        background-image: url('/images/fix.png');
        
    }
</style>
  <!-- 팝업을 위한 jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  
<script>
$(function() {
	//팝업창의 닫기 버튼을 클릭했을때...
    $('#closeBtn').click(function() {
    	//레이어 팝업창을 숨김처리한다.
        $('#popup').hide();
    	//하루동안 열지않음. 체크박스에 체크된 경우에만 value를 얻어온다.
        var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
    	//jQuery ajax() 함수를 통해 요청한다.
        $.ajax({
        	//요청할 서버의 url(경로)
            url : './PopupCookie.jsp',
            //전송방식
            type : 'get',
            //파라미터(요청시 전송할 값. 파라미터는 JSON형식으로 기술해야 한다.)
            data : {inactiveToday : chkVal},
            //콜백데이터의 형식 지정
            dataType : "text",
            //요청성공시 콜백함수
            success : function(resData) {
            	//콜백데이터는 매개변수 resData가 받는다.
            	if(resData){
            		console.log('있다');
            	}
            	else{
            		console.log('없다');	
            	}
            	//콜백 데이터가 있다면 화면을 새로고침 한다. F5를 누른것과 동일하다.
                if (resData != '') location.reload();
            }
        });
    });
});
</script>
</head>
<!--///////////////////////////////////////////////////////////////// HEADER /////////////////////////////////////// -->
<body class="index-page">
<%
	/* //단순히 텍스트를 10번 반복해서 출력한다.
    for (int i = 1; i <= 10; i++) {
        out.println("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
    } */
	
    if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 style="background-color: gray; height: 80px; padding-top: 30px" align="center">공지사항 팝업입니다.</h2>
        <br />
        <p style="color: black; padding-left: 20px" >6월 29일 ~ 7월 3일까지 서비스 중지 기간입니다.
        		<img style="padding-left: 100px; margin-top: 10px; height: 150px" src="./images/fix.png" alt=""  />
        
        </p>
        		<!-- <i class="fa-solid fa-screwdriver-wrench"></i> -->
        <div align="right">
        <form name="popFrm">
            <input type="checkbox" id="inactiveToday" value="1" />
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" />
        </form>
        </div>
    </div>
<%
    }
%>
	<!-- HEADER -->
	<div class="">
		<header class="main-header">
		<jsp:include page="header.jsp"/>
			<!-- Navigation -->
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<!-- Static Header -->
						<div class="header-text">
							<div class="text-left">
								<h1>The best attractions in the country</h1>
								<p>Going on holiday with family is much more fun than going alone. Therefore, to ensure that your and your family have the best experience, Indonesia is proud to provide many fun attractions.
									Let your kids run around in our exciting theme parks. Raft downriver for a thrilling experience unlike any other. These are just some examples of the many entertainments that Indonesia can offer you.</p>
								<a href="single.html" class="btn btn-primary btn-header1">Find Out More</a>
								<a href="#" class="btn btn-primary btn-header2">View Demo</a>
								<!-- Websocket Chating -->
								<a href="../15WebSocket/MultiChatMain.jsp" class="btn btn-primary btn-header2">Chat</a>
							</div>
						</div><!-- /header-text -->
					</div>
					<div class="col-md-7 pull-right">
						<!-- 서양 아저씨 사진  -->
						<!-- <img style="margin-top: 60px;" src="images/header-man.png" class="img-responsive" alt=""> -->
					</div>
				</div>
			</div>
		</header>
	</div>
	<!-- HEADER END -->
	<!-- /Section: intro -->
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content">
		<!-- ////////////Content Box 01 -->
		<section class="box-content box-1 box-style-1">
			<div class="container">
				<div class="row">
					<div class="heading">
						
						<h1 class="title">General Information</h1>
						<hr class="line">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-sm-3 col-md-6 ">
						<div class="box-item">
							<div class="wrap-icon">
								<div class="hexagon">
									<div class="hexagon-inner">
										<div class="hexagon-inner-content">
											<!-- <i class="fa-solid fa-gopuram"></i> -->
											<i class="fa fa-calendar fa-3x"></i>
										</div>
									</div>
									<span></span>
								</div>
							</div>
							<h3>Time Differences</h3>
							<p>
							New York (+12hrs), Tokyo (+2hrs), London (-7hrs), Seoul (+2hrs), Beijing (+1hrs), Abu Dhabi (-3hrs), Berlin (-6hrs), Amsterdam (-6hrs), Paris (-6hrs), and Moscow (-4hrs)</p>
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-md-6 ">
						<div class="box-item">
							<div class="wrap-icon">
								<div class="hexagon">
									<div class="hexagon-inner">
										<div class="hexagon-inner-content">
											<i class="fa fa-check-square-o fa-3x"></i>
										</div>
									</div>
									<span></span>
								</div>
							</div>
							<h3>People & Culture</h3>
							<p>Living on more than 13,400 islands, the Indonesian nation today counts some 200 million population comprising over 200 ethnic groups with their own languages and dialects.</p>
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-md-6 ">
						<div class="box-item">
							<div class="wrap-icon">
								<div class="hexagon">
									<div class="hexagon-inner">
										<div class="hexagon-inner-content">
											<i class="fa fa-book fa-3x"></i>
										</div>
									</div>
									<span></span>
								</div>
							</div>
							<h3>Language</h3>
							<p>Bahasa Indonesia is the national and official language of Indonesia and is used in the entire country. It is the language of official communication, taught in schools and used for broadcast in electronic and digital media</p>
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-md-6 ">
						<div class="box-item">
							<div class="wrap-icon">
								<div class="hexagon">
									<div class="hexagon-inner">
										<div class="hexagon-inner-content">
											<i class="fa fa-diamond fa-3x"></i>
										</div>
									</div>
									<span></span>
								</div>
							</div>
							<h3>History</h3>
							<p>The uniformly warm waters that make up 81% of Indonesia's area ensures that temperatures on land remain fairly constant, with the coastal plains averaging 28 °C, the inland and mountain areas averaging 26 °C, and the higher mountain regions, 23 °C.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- ////////////Content Box 02 -->
		<section class="box-content box-2 box-style-2">
			<div class="container">
				<div class="row">
					<div class="heading">
						<h1 class="title">Travel With Us</h1>
						<hr class="line">
					</div>
				</div>
				<div class="row">
					<div id="owl-travel" class="owl-carousel">
						<!-- 작은사진 5_1 -->
						<div class="item">
							<div class="box-entry home-post carpathian">
								<div class="box-entry-inner">
									<div class="entry-details">
										<div class="entry-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="entry-des">
											<h3>Carpathian</h3>
											<span>SED NUNC RUTRUM</span>
											<ul class="fancy-list">
												<li>5 Suspendisse Porttitor</li>
												<li>Lectus Euismod Imperdiet</li>
												<li>At massa pellentesque</li>
											</ul>
										</div>
										<div class="entry-bottom clearfix">
											<p class="pro-price-content">
												<span class="old-price"> 3250$ </span>
												<span class="new-price"> $970 </span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 작은사진 5_2 -->
						<div class="item">
							<div class="box-entry home-post pyrenees">
								<div class="box-entry-inner">
									<div class="entry-details">
										<div class="entry-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="entry-des">
											<h3>Pyrenees</h3>
											<span>SED NUNC RUTRUM</span>
											<ul class="fancy-list">
												<li>5 Suspendisse Porttitor</li>
												<li>Lectus Euismod Imperdiet</li>
												<li>At massa pellentesque</li>
											</ul>
										</div>
										<div class="entry-bottom clearfix">
											<p class="pro-price-content">
												<span class="old-price"> 3250$ </span>
												<span class="new-price"> $970 </span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 작은사진 5_3 -->
						<div class="item">
							<div class="box-entry home-post rocky">
								<div class="box-entry-inner">
									<div class="entry-details">
										<div class="entry-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="entry-des">
											<h3>Rocky</h3>
											<span>SED NUNC RUTRUM</span>
											<ul class="fancy-list">
												<li>5 Suspendisse Porttitor</li>
												<li>Lectus Euismod Imperdiet</li>
												<li>At massa pellentesque</li>
											</ul>
										</div>
										<div class="entry-bottom clearfix">
											<p class="pro-price-content">
												<span class="old-price"> 3250$ </span>
												<span class="new-price"> $970 </span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 작은사진 5_4 -->
						<div class="item">
							<div class="box-entry home-post alps">
								<div class="box-entry-inner">
									<div class="entry-details">
										<div class="entry-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="entry-des">
											<h3>Alps</h3>
											<span>SED NUNC RUTRUM</span>
											<ul class="fancy-list">
												<li>5 Suspendisse Porttitor</li>
												<li>Lectus Euismod Imperdiet</li>
												<li>At massa pellentesque</li>
											</ul>
										</div>
										<div class="entry-bottom clearfix">
											<p class="pro-price-content">
												<span class="old-price"> 3250$ </span>
												<span class="new-price"> $970 </span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 작은사진 5_5 -->
						<div class="item">
							<div class="box-entry home-post kavkaz">
								<div class="box-entry-inner">
									<div class="entry-details">
										<div class="entry-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="entry-des">
											<h3>Kavkaz</h3>
											<span>SED NUNC RUTRUM</span>
											<ul class="fancy-list">
												<li>5 Suspendisse Porttitor</li>
												<li>Lectus Euismod Imperdiet</li>
												<li>At massa pellentesque</li>
											</ul>
										</div>
										<div class="entry-bottom clearfix">
											<p class="pro-price-content">
												<span class="old-price"> 3250$ </span>
												<span class="new-price"> $970 </span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- ////////////Content Box 03 -->
		<section class="box-content box-3">
			<div class="container">
				<div class="row">
					<div class="heading">
						<h1 class="title">Portfolio</h1>
						<hr class="line">
					</div>
				</div>
				<div class="filter-container isotopeFilters">
					<ul class="list-inline filter">
						<li class="active"><a href="#" data-filter="*">All </a></li>
						<li><a href="#" data-filter=".illustrations">Illustrations</a></li>
						<li><a href="#" data-filter=".photography">Photography</a></li>
						<li><a href="#" data-filter=".websites">Websites</a></li>
						<li><a href="#" data-filter=".art">Art</a></li>
					</ul>
				</div>
				<div class="isotopeContainer">
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector art">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지 1-->
							<img src="images/indonesia-adventure.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image21.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector art">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지2 -->
							<img src="images/Jakarta_thumbnail.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image22.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector illustrations">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지 -->
							<img src="images/image23.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image23.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector photography">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지 -->
							<img src="images/Bali-Thumbnail.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image24.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector websites">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지 -->
							<img src="images/3.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image19.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-sm-4 col-md-6 isotopeSelector websites">
						<div class="portfolio-box zoom-effect">
							<!-- 여행후기 이미지 -->
							<img src="images/Kalimantan.jpg" class="img-responsive" alt="">
							<div class="portfolio-box-caption">
								<div class="portfolio-box-caption-content">
									<div class="project-name">
										Project Name
									</div>
									<div class="project-category">
										Category
									</div>
									<div class="project-social">
										<ul class="list-inline">
											<li><a href="single.html"><i class="fa fa-link"></i></a></li>
											<li><a href="images/image20.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward."><i class="fa fa-search"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- ////////////Content Box 04 -->
		<section class="box-content box-4 box-style-3">
			<div class="container">
				<div id="owl-brand" class="owl-carousel">
					<div class="item">
						<a href="single.html"><img src="images/12.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/13.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/15.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/16.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/17.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/18.png" /></a>
					</div>
					<div class="item">
						<a href="single.html"><img src="images/12.png" /></a>
					</div>
				</div>
			</div>
		</section>
		
	</div>
	
	<!-- FOOTER -->
	<footer class="main-footer">
		<div class="wrap-footer">
			<div class="row">
				<div class="heading" >
					<h1 class="title">Contact Us</h1>
					<hr class="line">
				</div>
			</div>
			<div class="bg-footer">
				<div class="container">
					<div class="cleint-says">
						<div class="col-md-5 col-md-offset-1">
							<div class="cleint-say">
								<div class="sub-c">"</div>
								<p>Zerotheme can help you build better websites using the Bootstrap CSS framework! Just download your template and start going, no strings attached! Just download your template and start going, no strings attached! Just download your template and start going, no strings attached!</p>
								<div class="cleint-info">
									<img src="images/partner1.png" class="img-circle" />
									<span>Catherine Grace - America</span>
								</div>
							</div>
						</div>
						<div class="col-md-5">
							<div class="cleint-say">
								<div class="sub-c">"</div>
								<p>Zerotheme can help you build better websites using the Bootstrap CSS framework! Just download your template and start going, no strings attached! Just download your template and start going, no strings attached! Just download your template and start going, no strings attached!</p>
								<div class="cleint-info">
									<img src="images/partner1.png" class="img-circle" />
									<span>Catherine Grace - America</span>
								</div>
							</div>
						</div>
					</div>
					<div class="contact-form">
						<h3>Contact</h3>
						<span>Sign up for our letters to receive updates</span>
						<form name="form1" method="post" action="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
									<input type="text" class="form-control input-lg" name="name" id="name" placeholder="Enter name" required="required" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="email" class="form-control input-lg" name="email" id="email" placeholder="Enter email" required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control input-lg" name="subject" id="subject" placeholder="Subject" required="required" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<input type="date" class="form-control input-lg" name="date" id="date" placeholder="Date" required="required" />
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<input type="time" class="form-control input-lg" name="time" id="time" placeholder="Time" required="required" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<textarea name="message" id="message" class="form-control" rows="4" cols="25" required="required"
										placeholder="Message"></textarea>
									</div>						
									<button type="submit" class="btn btn-skin btn-block" name="btnBooking" id="btnBbooking">Book Now</button>
								</div>
							</div>
						</form>	
					</div>
				</div>
				<div class="bottom-footer">
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<p>Copyright 20xx - Designed by <a href="https://www.Zerotheme.com">Zerotheme</a></p>
							</div>
							<div class="col-md-4">
								<ul class="list-inline social-buttons">
									<li><a href="#"><i class="fa fa-twitter"></i></a>
									</li>
									<li><a href="https://www.facebook.com/Zerotheme"><i class="fa fa-facebook"></i></a>
									</li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a>
									</li>
									<li><a href="#"><i class="fa fa-pinterest"></i></a>
									</li>
								</ul>
							</div>
							<div class="col-md-4">
								<ul class="list-inline quicklinks">
									<li><a href="#">Privacy Policy</a>
									</li>
									<li><a href="#">Terms of Use</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div><!-- .Background image footer -->
		</div><!-- .Wrap footer -->
	</footer>

    <!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
	
	<!-- Light Box -->
	<script src="js/lightbox-plus-jquery.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="js/isotope.min.js"></script>
	<script>
	jQuery(document).ready(function($) {
		var myTheme = window.myTheme || {},
		$win = $( window );
		myTheme.Isotope = function () {
			// 4 column layout
			var isotopeContainer = $('.isotopeContainer');
			if( !isotopeContainer.length || !jQuery().isotope ) return;
			$win.load(function(){
				isotopeContainer.isotope({
					itemSelector: '.isotopeSelector'
				});
			$('.isotopeFilters').on( 'click', 'a', function(e) {
					$('.isotopeFilters').find('.active').removeClass('active');
					$(this).parent().addClass('active');
					var filterValue = $(this).attr('data-filter');
					isotopeContainer.isotope({ filter: filterValue });
					e.preventDefault();
				});
			});
		};
		myTheme.Isotope();

	});</script>
	
	<!-- carousel -->
	<script src="owl-carousel/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {
	  $("#owl-travel").owlCarousel({
        autoPlay: 3000,
        items : 4,
		itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,2],
		navigation: false,
		pagination: true
      });
      $("#owl-brand").owlCarousel({
        autoPlay: 3000,
        items : 6,
		itemsDesktop : [1199,4],
        itemsDesktopSmall : [979,2],
		navigation: false,
		pagination: false
      });
    });
    </script>
	
				
	
</body>

</html>
