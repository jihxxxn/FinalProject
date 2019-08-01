<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="../../resources/lib/owl/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="../../resources/lib/owl/owl.theme.default.css">
	<script src="../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<script src="../../resources/lib/owl/owl.carousel.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/main.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

   <script>
   		$(document).ready(function(){

   			var owl = $('.owl-carousel');
			owl.owlCarousel({
			    items:1,
			    loop:true,
			    margin:0,
			    autoplay:true,
			    autoplayTimeout:7500,
			    autoplayHoverPause:false
			});
			$('.play').on('click',function(){
			    owl.trigger('play.owl.autoplay',[2000])
			})
			$('.stop').on('click',function(){
			    owl.trigger('stop.owl.autoplay')
			})
			//$('.owl-dots').hide();

			$('nav .one').hover(function () {
			    if($(".callsenterSub").css("display") == "none"){
			       $('.callsenterSub').slideDown();
			       $("headerA").css("color","#f15b6d");
			       event.preventDefault();
			    } else {
			       $('.callsenterSub').css("display", "none");
			    }
			});

		});//ready
   </script>
</head>
<body>
	<div id="wrap">
		<header>
			<nav>
				<div class="inner">
					<div class="headerContent">
						<div class="mainlogo"><a href="#"></a></div>
						<ul class="mainmenu">
							<li><a href="#">���͵� ã��</a></li>
							<li><a href="#">���� �׽�Ʈ</a></li>
							<li><a href="#">��������</a></li>
							<li class="one"><a href="#">������</a>
								<ul class="callsenterSub">
									<li><a href="#">FAQ</a></li>
									<li><a href="#">QnA</a></li>
								</ul>
							</li>
						</ul>
						<ul class="gnb">
							<li><a href="#">�α���</a></li>
							<li><a href="#">�л� ȸ������</a></li>
							<li><a href="#">���� �����ϱ�</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="container">
			<div class="slider">
				<div class="owl-carousel owl-theme">
				    <div class="item item1">
				    	<img src="../../resources/img/GumonMain/img_main02.png">
				    	<div class="slidercontent">
							<h1>WelCome</h1>
							<h1>�����ǿ��� ó���̼���?</h1>
							<p>���� �����׽�Ʈ�ϰ� �� �´� ���͵� �ȳ���������!</p>
							<input type="button" target="_blank" name="sadas" value="�����ϱ�">
						</div>
					</div>
				    <div class="item item2">
						<img src="../../resources/img/StudyMain/12950-1557969673.jpeg">
						<div class="slidercontent">
							<h1>�����ǿ���?</h1>
							<p>���簢���� �ؿܰ��� ������ �Բ��ϴ� ���͵� ��Ī �÷����Դϴ�.</p>
						</div>
					</div>
				    <div class="item item3">
				    	<img src="../../resources/img/StudyMain/studySlider01.jpeg">
				    	<div class="slidercontent">
							<h1>���͵� ������ ������ �����Ű���?</h1>
							<p>���͵��� ȣ��Ʈ�� �Ǿ� ������ ��ſ��� �����ϼ���!</p>
							<input type="button" target="_blank" name="sadas" value="�����ϱ�">
						</div>
					</div>
				</div>
			</div><!-- slider -->
			<section class="studyListWrap">
				<div class="inner">
					<h1>�����ǿ���</h1>
					<h1>���簢���� <b>�ؿܰ��� ����</b>�� �Բ��ϴ�</h1>
					<h1><b>�������� ���͵� ��Ī �÷���</b> �Դϴ�.</h1>
					<div class="studyListContent">
						<div class="studyList">
							Empty
						</div>
						<div class="studyList">
							Empty
						</div>
						<div class="studyList">
							Empty
						</div>
					</div>
				</div>
			</section>
			<section class="howLike">
				<div class="inner">
					<div class="howLikeTitle">
						<h1>�����ǿ�!</h1>
						<h2>����� ������?</h2>
					</div>
					<ul>
						<li>
							<div class="icon icon1"></div>
							<h2>���� �� �´� ���غ� ���͵�</h2>
							<h3>�ʱ�, �߱�, ��޷�����<br> ����Ǵ� ���͵𿡿�!</h3>
						</li>
						<li>
							<div class="icon icon2"></div>
							<h2>�ִ� 6-8���� �Ҽ� ����</h2>
							<h3>�������� ���� �����<br>�� �´� ����鳢�� �����ؿ�</h3>
						</li>
						<li>
							<div class="icon icon3"></div>
							<h2>�پ��� ���� �� �ð���</h2>
							<h3>���� ������ ��, �׸��� �ָ�����!<br>���� �� �´� �ð��븦 ã�ƺ�����!</h3>
						</li>
					</ul>
				</div>
			</section>
			<section class="levelTestGo">
				<div class="inner">
					<div class="levelTestContent">
						<h1><b>�ϴ� �����׽�Ʈ����</b><br> �����غ�����!</h1>
						<h2>����� ������ ������ �ľ��ϰ�<br>�� �´� ���͵� �ȳ� ��������!</h2>
						<a href="#">�����׽�Ʈ ����</a>
					</div>
					<div class="levelTestImg">
					</div>
				</div>
			</section>
			<div class="inner">
			<div class="box">
	            <div class="loader6"></div>
       		 </div>
       		 </div>
			<section class="LeaderGo">
				<div class="inner">
					<div class="LeaderGoContent">
						<h1><b>���͵� ������</b><br>������ �����Ű���?</h1>
						<h2>���� ���� ����, ���� �ð��� ���͵� ������<br>�л������ ������ ������ �����غ�����.</h2>
						<a href="#">���� �����ϱ�!</a>
					</div>
					<div class="LeaderGoImg">
					</div>
				</div>
			</section>
		</div><!-- container -->
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber"><b>������</b><strong> 1588-0000</strong> ���� 09:00~18:00(������ ����)</div>
						<div class="footerinfo">
							<ul>
								<li><a href="#">�������� ó����ħ</a></li>
								<li><a href="#">���񽺾��</a></li>
							</ul>
						</div>
						<address>����Ư���� ������ ������ 447-5 ǳ������ �ֿ밭�ϱ�������</address>
					</div>
					<div class="footerRight">
						<div class="sns">
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_instar.png" alt="�ν�Ÿ"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_blog.png" alt="��α�"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_facebook.png" alt="���̽���"></a>
		                    <a href="#" target="_blank"><img src="../../resources/img/GumonMain/img_sns_kakaostory.png" alt="īī�����丮"></a>
		                </div>
					</div>
				</div>
				<div class="copyright">Copyright�� AGUMON. All Right Reserved</div>
			</div><!-- inner -->
		</footer>
	</div><!-- wrap -->
</body>
</html>