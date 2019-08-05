<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_leaderInfoModify</title>
<!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain2.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet"><link href="css/bootstrap.min.css" rel="stylesheet">

   <script>
   		$(document).ready(function(){

			$('.first').hover(function () {
			    if($(".firstSub").css("display") == "none"){
			       $('.firstSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.firstSub').css("display", "none");
			    }
			});

			$('.firstSub2').hover(function () {
			    if($(".asideSubmenu2").css("display") == "none"){
			       $('.asideSubmenu2').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.asideSubmenu2').css("display", "none");
			    }
			});

			$('.second').hover(function () {
			    if($(".secondSub").css("display") == "none"){
			       $('.secondSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.secondSub').css("display", "none");
			    }
			});

			$('.third').hover(function () {
			    if($(".thirdSub").css("display") == "none"){
			       $('.thirdSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.thirdSub').css("display", "none");
			    }
			});

			$('.fourth').hover(function () {
			    if($(".fourthSub").css("display") == "none"){
			       $('.fourthSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.fourthSub').css("display", "none");
			    }
			});

		});//ready
   </script>
   
   <script>
   	$document.ready(function(){
   		var formObj = $("form");
   		
   		$('button').on("click", function(e){
   			e.preventDefault();
   			
   			var operation = $(this).data("oper");
   			
   			console.log(operation);
   			
   			if(operation === 'list'){
   				self.location = "/admin/adminLeader";
   				return;
   			}
   			formObj.submit();
   		});
   	});
   </script>

</head>
<body>
	<div id="wrap">
		<header>
			<nav>
				<div class="inner">
					<div class="headerContent">
						<div class="mainlogo"><a href="#"></a></div>
						<ul class="gnb">
							<li>admin</li>
							<li><input type="button" name="logout" value="로그아웃"></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="container">
					<aside>
				<ul class="asdieMainMenu">
					<li class="Mainli first">매출 관리
						<ul class="asideSubmenu firstSub">
							<li><a href="#">결제 내역</a></li>
							<li class="firstSub2">입금 관리
								<ul class="asideSubmenu2">
									<li><a href="#">입금 전 목록</a></li>
									<li><a href="#">입금 완료 목록</a></li>
								</ul>
							</li>
							<li><a href="#">통계 관리</a></li>
						</ul>
					</li>
					<li class="Mainli"><a href="#">레벨테스트 관리</a></li>
					<li class="Mainli"><a href="#">공지사항 관리</a></li>
					<li class="Mainli second">고객센터 관리
						<ul class="asideSubmenu secondSub">
							<li><a href="#">QnA 관리</a></li>
							<li><a href="#">FAQ 관리</a></li>
						</ul>
					</li>
					<li class="Mainli third">회원 관리
						<ul class="asideSubmenu thirdSub">
							<li><a href="#">회원 관리</a></li>
							<li><a href="#">리더 관리</a></li>
						</ul>
					</li>
					<li class="Mainli fourth">리더가입 관리
						<ul class="asideSubmenu forthSub">
							<li><a href="#">가입 대기 리더 목록</a></li>
							<li><a href="#">리더 가입 거부 목록</a></li>
						</ul>
					</li>
				</ul>
			</aside>
			<div class="inner">
				<div class="content">
					<div class="infoContent">
						<form role="form" action="/admin/adminLeaderModify" method="post">
							<div class="img"><img src="../../../resources/img/GumonMain/user123.jpg"></div>
							<div class="info">아이디</div>
							<div class="userInfo"><c:out value="${ leader.leaId }"/></div>
							<div class="info">비밀번호 수정</div>
							<div class="userInfo"><input type="password" placeholder="비밀번호" class="joinInput"><input type="password" placeholder="비밀번호 확인" class="joinInput"></div>
							<div class="info">이름</div>
							<div class="userInfo"><c:out value="${ leader.leaName }"/></div>
							<div class="info">성별</div>
							<div class="userInfo"><c:out value="${ leader.leaGender }"/></div>
							<div class="info">국적</div>
							<div class="userInfo">한국</div>
							<div class="info">주소</div>
							<div class="userInfo"><input type="text" placeholder="주소" class="joinInput1"><input type="text" placeholder="주소" class="joinInput"><button class="btn">주소찾기</button></div>
							<div class="info">연락처</div>
							<div class="userInfo"><input type="tel" placeholder="연락처" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" class="joinInput2"></div>
							<div class="info">이메일</div>
							<div class="userInfo"><input type="text" placeholder="이메일" class="joinInput1"><span class="joinText">@</span><input type="text" placeholder="이메일" class="joinInput1"></div>
							<div class="info">계좌번호</div>
							<div class="userInfo"><select class="joinInput2">
													<option>국민은행</option><option>신한은행</option><option>우리은행</option><option>기업은행</option></select>
													<input type="text" placeholder="계좌번호" class="joinInput" value="<c:out value="${ leader.leaAccount }"/>"></div>
							<div class="info">자기소개</div>
							<div class="userInfo"><textarea class="joinInput3"><c:out value="${ leader.leaIntroduce }"/></textarea></div>
							<button type="submit" data-oper='modify' id="modBtn">확인</button>
							<button type="submit" data-oper='list' id="listBtn">취소</button>
							
							<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }"/>'>
							<input type="hidden" name="amount" value='<c:out value="${ cri.amount }"/>'>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber">
							<b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)
						</div>
						<div class="footerinfo">
							<ul>
								<li><a href="#">개인정보 처리방침</a></li>
								<li><a href="#">서비스약관</a></li>
							</ul>
						</div>
						<address>서울특별시 마포구 서교동 447-5 풍성빌딩 쌍용강북교육센터</address>
					</div>
					<div class="footerRight">
						<div class="sns">
							<a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
							<a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
							<a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_facebook.png"
								alt="페이스북"></a> <a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_kakaostory.png"
								alt="카카오스토리"></a>
						</div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div>
			<!-- inner -->
		</footer>
	</div>
	<!-- wrap -->
</body>
</html>