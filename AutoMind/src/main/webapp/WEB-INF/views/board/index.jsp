<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>Home</title>
	<meta charset="utf-8">
	<meta name = "format-detection" content = "telephone=no" />
	<link rel="icon" href="/resource/images/favicon.ico" type="image/x-icon">
	<!-- 메뉴 창-->
	<link rel="stylesheet" href="/resources/css/grid.css">
	<!-- 전체적인 css -->
	<link rel="stylesheet" href="/resources/css/style.css">
	<!-- 사진 모달창 -->
	<link rel="stylesheet" href="/resources/css/touchTouch.css">
	<!-- 움직이는 글씨  -->
	<link rel="stylesheet" href="/resources/css/camera.css">
	
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/jquery-migrate-1.2.1.js"></script>
	<script src='/resources/js/camera.js'></script>
	<script src="/resources/js/touchTouch.jquery.js"></script>
	<script src="/resources/js/jquery.stellar.js"></script>
	<script src="/resources/js/script.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqAN26LTI1rVsV2KSWALunfDjx3pwjyeA&callback=initMap"
  							type="text/javascript"></script>
	<!-- [if (gt IE 9)|!(IE)]><! -->
	<script src="/resources/js/jquery.mobile.customized.min.js"></script>
	<script src="/resources/js/wow.js"></script>
	
	<script>
		$(document).ready(function () {
			if ($('html').hasClass('desktop')) {
				new WOW().init();
			}
		});
	</script>
	
	<!-- ===========module1================================ -->
	
	<!-- BOOTSTRAP STYLES-->
    <link href="/resources/module1/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="/resources/module1/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="/resources/module1/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="/resources/module1/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- script -->
    <script src="/resources/module1/js/bootstrap.js"></script>
    <script src="/resources/module1/js/custom.js"></script>
    <script src="/resources/module1/js/galleryCustom.js"></script>
    <script src="/resources/module1/js/jquery.metisMenu.js"></script>
    <script src="/resources/module1/js/jquery.mixitup.min.js"></script>
    <script src="/resources/module1/js/jquery.prettyPhoto.js"></script>
    <script src="/resources/module1/js/wizard/jquery.cookie-1.3.1.js"></script>
    <script src="/resources/module1/js/wizard/jquery.steps.js"></script>
    <script src="/resources/module1/js/wizard/modernizr-2.6.2.min.js"></script>
	<!--<![endif]-->
	<!--[if lt IE 8]>
	<div style=' clear: both; text-align:center; position: relative;'>
	 <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
		 <img src="images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
	 </a>
	</div>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
	<![endif]-->
	<!--[if IE]>
		<link rel="stylesheet" type="text/css" media="screen" href="css/ie-8.css">
	<![endif]-->
	</head>
<body class="index">
<!--==============================header=================================-->
<%@include file="../include/header.jsp"%>

<!--=======content================================-->

<section id="content">
	<div class="full-width-container block-1">
		<div class="camera_container">
			<div id="camera_wrap">
				<div class="item" data-src="/resources/images/index_img_slider-1.jpg">
					<div class="camera_caption fadeIn">
						<h3>혁신적인  주행거리</h3>
					</div>
				</div>
				<div class="item" data-src="/resources/images/index_img_slider-1.jpg">
					<div class="camera_caption fadeIn">
						<h3>독보적인  안전성</h3>
					</div>
				</div>
				<div class="item" data-src="/resources/images/index_img_slider-1.jpg">
					<div class="camera_caption fadeIn">
						<h3>압도적인  가속</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-2">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<header>
						<h2><span>Our works</span></h2>
					</header>
					<div class="isotope clearfix">
						<a href="/resources/images/index_img-1-big.jpg" class="item-1 w-1"><div class="img_block"><img src="/resources/images/index_img-1.jpg" alt="img"></div><i>+</i></a>
						<a href="/resources/images/index_img-2-big.jpg" class="item-2 w-2"><div class="img_block"><img src="/resources/images/index_img-2.jpg" alt="img"></div><i>+</i></a>
						<a href="/resources/images/index_img-3-big.jpg" class="item-3 w-1"><div class="img_block"><img src="/resources/images/index_img-3.jpg" alt="img"></div><i>+</i></a>
						<a href="/resources/images/index_img-4-big.jpg" class="item-4 w-2"><div class="img_block"><img src="/resources/images/index_img-4.jpg" alt="img"></div><i>+</i></a>
						<a href="/resources/images/index_img-5-big.jpg" class="item-5 w-1"><div class="img_block"><img src="/resources/images/index_img-5.jpg" alt="img"></div><i>+</i></a>
						<a href="/resources/images/index_img-6-big.jpg" class="item-6 w-1"><div class="img_block"><img src="/resources/images/index_img-6.jpg" alt="img"></div><i>+</i></a>
					</div>
					<!-- <a href="#" class="btn">more</a> -->
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-3">
	<div class="container">
	<!-- ====================================================== -->
	<div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">

                            <div id="carousel-example" class="carousel slide" data-ride="carousel" style="border: 5px solid #000;">

                                <div class="carousel-inner">
                                    <div class="item active">

                                        <img src="/resources/module1/img/slideshow/1.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="/resources/module1/img/slideshow/2.jpg" alt="" />

                                    </div>
                                    <div class="item">
                                        <img src="/resources/module1/img/slideshow/3.jpg" alt="" />

                                    </div>
                                </div>
                                <!--INDICATORS-->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example" data-slide-to="1"></li>
                                    <li data-target="#carousel-example" data-slide-to="2"></li>
                                </ol>
                                <!--PREVIUS-NEXT BUTTONS-->
                                <a class="left carousel-control" href="#carousel-example" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                </a>
                            </div>
                        </div>
                        </div>
                    </div>
              </div>
<!-- 		<div class="container">
			<div class="row">
				<div class="grid_4">
					<header>
						<h2><span>Hi!</span></h2>
					</header>
					<p class="first">Gamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste.</p>
					<p class="secont">Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur orci sed <br> Curabitur vel lorem sit amet nulla ullamcorper fermentum. In vitae varius augue, eu consectetur ligula. Etiam dui eros, laoreet sit amet est vel, commodo venenatis eros.</p>
					<a href="#" class="btn">more</a>
				</div>
				<div class="grid_7 offset_1">
					<header>
						<h2>From the Blog</h2>
					</header>
					<h4><a href="#">10 Nov</a></h4>
					<div class="img_block"><img src="/resources/images/index_img-7.jpg" alt=""></div>
					<p>Gamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste. Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur orci sed <br><br>Gamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste. Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur</p>
					<a href="#" class="btn">more</a>
				</div>
			</div>
		</div> -->
	</div>
	<div class="full-width-container block-4  parallax-block" data-stellar-background-ratio="0.5">
		<span class="el-1">Your best</span>
		<span class="el-2">projects</span>
		<a href="#" class="btn">more</a>
	</div>
	<div class="full-width-container block-5">
		<div class="container">
			<div class="row">
				<div class="item-1 clearfix">
					<div class="grid_2">
						<div class="img_block"><img src="/resources/images/index_img-8.jpg" alt=""></div>
					</div>
					<div class="grid_10">
						<div class="text">Gamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste. <br><br>Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur rci sed r vel lorem sit amet nulla ullamcorper fermentum.</div>
					</div>
				</div>
				<div class="item-2 clearfix">
					<div class="grid_10">
						<div class="text">Tamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste. <br><br>Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur rci sed r vel lorem sit amet nulla ullamcorper fermentu.</div>
					</div>
					<div class="grid_2">
						<div class="img_block"><img src="/resources/images/index_img-9.jpg" alt=""></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-6">
		<div class="google-map-api"> 
			<div id="map-canvas" class="gmap"></div> 
		</div> 
	</div>
</section>

<!--=======footer=================================-->
<%@include file="../include/footer.jsp"%>

<!--=======Script=================================-->
<script>
	jQuery(function(){
		jQuery('#camera_wrap').camera({
			height: '68.125%',
			thumbnails: false,
			pagination: true,
			fx: 'simpleFade',
			loader: 'none',
			hover: false,
			navigation: false,
			playPause: false,
			minHeight: "975px",
		});
	});
</script>
<!--script>
	var $container = $('.isotope');
	// init
	$container.on( 'click', '.iso-item', function( event ) {
	  // change size of item via class
	  $( event.target ).toggleClass('gigante');
	  // trigger layout
	  $container.packery();
	  /*$container.packery({
		  itemSelector: 'iso-.item',
		  gutter: 10*/

	});
</script-->
<script>
	$(document).ready(function() { 
			if ($('html').hasClass('desktop')) {
				$.stellar({
					horizontalScrolling: false,
					verticalOffset: 20,
					resposive: true,
					hideDistantElements: true,
				});
			}
		});
</script>
<!--=======Google Map=================================-->
<script type="text/javascript">
		google_api_map_init();
		function google_api_map_init(){
			var map;
			var coordData = new google.maps.LatLng(parseFloat(37.501143), parseFloat(126.884598,10)); 

			var styleArray = [
				{"featureType":"water","stylers":[{"color":"#021019"}]},
				{"featureType":"landscape","stylers":[{"color":"#08304b"}]},
				{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0c4152"},{"lightness":5}]},
				{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0b434f"},{"lightness":25}]},
				{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0b3d51"},{"lightness":16}]},
				{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},
				{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},
				{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":13}]},
				{"featureType":"transit","stylers":[{"color":"#146474"}]},
				{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},
				{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144b53"},{"lightness":14},{"weight":1.4}]}
				]
			 
			function initialize() { 
			  var mapOptions = { 
				zoom: 18, 
				center: coordData, 
				scrollwheel: false, 
				styles: styleArray 
			  } 
 
			  var contentString = "<div></div>"; 
			  var infowindow = new google.maps.InfoWindow({ 
				content: contentString, 
				maxWidth: 200 
			  }); 
			   
			  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions); 


			google.maps.event.addDomListener(window, 'resize', function() {

			  map.setCenter(coordData);

			  var center = map.getCenter();
			});
		}

			google.maps.event.addDomListener(window, "load", initialize); 

		}
</script>
<script>
	$(function(){
		$('.isotope a').touchTouch();
	});
</script>
</body>
</html>