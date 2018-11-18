<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-control" content="public">
<meta name="author" content="Manogna Reddy">
<link rel="icon" href="resources/logo.png">
<meta name="description"
	content="Exclusive collection of maternity, momtobe, pregnancy photographs taken by Manogna Reddy. Experience the best photoshoot of your maternity with Manogna Reddy. Maternity photographer, Hyderabad." />
<title>Maternity| Future Mom | Mom-to-Be Photography by Manogna Reddy, Hyderabad</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href=resources/logo.png type="image/x-icon">

<link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet" href="assets/socicon/css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" />
<link rel="stylesheet" href="assets/theme/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
<link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
<link rel="stylesheet" href="css/myApp.css">
</head>
<body>
	<header> <section class="menu cid-qsRDwi0Sai" once="menu" id="menu1-n" data-rv-view="933"> <nav
		class="navbar navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<div class="hamburger">
			<span></span> <span></span> <span></span> <span></span>
		</div>
	</button>
	<div class="menu-logo">
		<div class="navbar-brand">
			<span class="navbar-logo"> <img src="resources/logo.png" alt="Manogna Reddy Photography" title="" media-simple="true"
				style="height: 3.8rem;">

			</span> <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="index">Manogna Reddy Photography</a></span>
		</div>
	</div>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true">
			<li class="nav-item"><a class="nav-link link text-white display-4" id="homeMenu" href="index"> &nbsp;Home</a></li>
			<li class="nav-item"><a class="nav-link link text-white display-4" id="newBornMenu" href="newBorn"> &nbsp;New-born</a></li>
			<li class="nav-item"><a class="nav-link link text-blue display-4" id="maternityMenu" href="maternity"> &nbsp;Maternity</a></li>
			<li class="nav-item"><a class="nav-link link text-white display-4" id="babiesMenu" href="babies"> &nbsp;Babies</a></li>
			<li class="nav-item"><a class="nav-link link text-white display-4" id="galleryMenu" href="gallery"> &nbsp;Gallery</a></li>
			<li class="nav-item"><a class="nav-link link text-white display-4" href=""> About Us </a></li>
		</ul>
	</div>
	</nav> </section> </header>

	<section class="carousel slide cid-qtvcqPaJB9" data-interval="false" id="slider2-14" data-rv-view="2268">

	<div class="container content-slider">
		<div class="content-slider-wrap" id="desktopView">
			<div>
				<div class="mbr-slider slide carousel" data-pause="true" data-keyboard="false" data-ride="false" data-interval="false">
					<div class="container">
						<ol class="carousel-indicators">
							<c:forEach var="i" begin="0" end="${maxTagCount-1}">
								<li data-app-prevent-settings="" data-target="#slider2-14" class='<c:if test="${i == 0}"> active</c:if>'
									data-slide-to='<c:out value="${i}" />'></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner" role="listbox">
							<%-- 						 --%>
							<c:forEach var="i" begin="0" end="${maxTagCount-1}">
								<div class="carousel-item slider-fullscreen-image <c:if test="${i == 0}"> active</c:if>" id="sd1"
									data-bg-video-slide="false" style="background-image: url(photos/maternity/max/<c:out value='${imagesArr[i]});'></c:out>">
									<div class="container container-slide">
										<div class="image_wrapper">
											<img src="photos/maternity/max/<c:out value='${imagesArr[i]}'></c:out>" alt="maternity photography" />
											<div class="carousel-caption">
												<div class="col-10 offset-1 align-center"></div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<a data-app-prevent-settings="" class="carousel-control carousel-control-prev" role="button" data-slide="prev" href="#slider2-14"><span
							aria-hidden="true" class="mbri-left mbr-iconfont"></span><span class="sr-only">Previous</span></a><a data-app-prevent-settings=""
							class="carousel-control carousel-control-next" role="button" data-slide="next" href="#slider2-14"><span aria-hidden="true"
							class="mbri-right mbr-iconfont"></span><span class="sr-only">Next</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mobile" id="mobileView">
		<ul>
			<c:forEach var="i" begin="0" end="${maxTagCount-1}">
				<li><img data-src="photos/maternity/med/<c:out value='${imagesArr[i]}'></c:out>" /></li>
			</c:forEach>
		</ul>
	</div>
	</section>

	<section class="cid-qtv9bQqKKT" id="footer1-12" data-rv-view="2285">
	<div class="container">
		<div class="media-container-row content text-white">
			<div class="col-12 col-md-3">
				<div class="media-wrap">
					<a href=""> <img src="resources/logo.png" alt="Mobirise" media-simple="true">
					</a>
				</div>
			</div>
			<div class="col-12 col-md-3 mbr-fonts-style display-7">
				<h5 class="pb-3">Address</h5>
				<p class="mbr-text">
					Hyderabad <br>India
				</p>
			</div>
			<div class="col-12 col-md-3 mbr-fonts-style display-7">
				<h5 class="pb-3">Contacts</h5>
				<p class="mbr-text">
					<a href="mailto: manognareddyphotography@gmail.com?subject=Query reg photoshoot. &body= " target="_blank">e-mail us</a> <br> <a
						href="tel://+919676404065" target="_blank">call us</a>
				</p>
			</div>
			<div class="col-12 col-md-3 mbr-fonts-style display-7">
				<h5 class="pb-3">Links</h5>
				<p class="mbr-text">
					<a class="text-primary" href="https://www.flickr.com/photos/manogna-reddy/" target="_blank">flickr</a>
				</p>
			</div>
		</div>
		<div class="footer-lower">
			<div class="media-container-row">
				<div class="col-sm-12">
					<hr>
				</div>
			</div>
			<div class="media-container-row mbr-white">
				<div class="col-sm-6 copyright">
					<p class="mbr-text mbr-fonts-style display-7">� Copyright 2017 &nbsp;- All Rights Reserved</p>
				</div>
				<div class="col-md-6">
					<div class="social-list align-right">
						<div class="soc-item">
							<a href="https://twitter.com/Manureddy" target="_blank"> <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"
								media-simple="true"></span>
							</a>
						</div>
						<div class="soc-item">
							<a href="https://www.facebook.com/manognareddyphotography/" target="_blank"> <span
								class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social" media-simple="true"></span>
							</a>
						</div>
						<div class="soc-item">
							<a href="https://instagram.com/manogna.reddy" target="_blank"> <span class="socicon-instagram socicon mbr-iconfont mbr-iconfont-social"
								media-simple="true"></span>
							</a>
						</div>
						<div class="soc-item">
							<a href="https://www.behance.net/ManognaReddy" target="_blank"> <span class="socicon-behance socicon mbr-iconfont mbr-iconfont-social"
								media-simple="true"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.18/jquery.touchSwipe.min.js"></script>
	<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
	<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.5/popper.min.js"></script> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/smoothscroll/1.4.6/SmoothScroll.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-dropdown/2.0.3/jquery.dropdown.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-viewport-checker/1.8.8/jquery.viewportchecker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.1.2/jquery.mb.YTPlayer.min.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<script src="assets/bootstrap-carousel-swipe/bootstrap-carousel-swipe.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jarallax/1.9.0/jarallax.min.js"></script>
	<script src="js/jquery.unveil.js"></script>
	<script>
		if (window.screen.width < 500) {
			$("#mobileView").show();
			$(document).ready(function() {
				$("img").unveil();
			});
			$('#desktopView').hide();
		} else {
			$("#mobileView").hide();
			$('#desktopView').show();
		}
	</script>

	<div id="scrollToTop" class="scrollToTop mbr-arrow-up">
		<a style="text-align: center;"><i class="mbri-down mbr-iconfont"></i></a>
	</div>
	<input name="animation" type="hidden">
</body>
</html>
