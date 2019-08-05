<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminQnA.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">

<script>
	$(document).ready(function() {

		$('.first').hover(function() {
			if ($(".firstSub").css("display") == "none") {
				$('.firstSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.firstSub').css("display", "none");
			}
		});

		$('.firstSub2').hover(function() {
			if ($(".asideSubmenu2").css("display") == "none") {
				$('.asideSubmenu2').css("display", "block");
				event.preventDefault();
			} else {
				$('.asideSubmenu2').css("display", "none");
			}
		});

		$('.second').hover(function() {
			if ($(".secondSub").css("display") == "none") {
				$('.secondSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.secondSub').css("display", "none");
			}
		});

		$('.third').hover(function() {
			if ($(".thirdSub").css("display") == "none") {
				$('.thirdSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.thirdSub').css("display", "none");
			}
		});

		$('.fourth').hover(function() {
			if ($(".fourthSub").css("display") == "none") {
				$('.fourthSub').css("display", "block");
				event.preventDefault();
			} else {
				$('.fourthSub').css("display", "none");
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
						<div class="mainlogo">
							<a href="#"></a>
						</div>
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
			<div class="containerContent">
				<h1>QnA 답변</h1>
				<div class="QnAWrap">
					<form action="/admin/QnAmodify" method="post">
						<div class="form-group">
					   		<label for="QnAModifyGetNo">번호</label>
					  		<input type="text" class="form-control" id="QnAModifyGetNo" name="qnaIndex" placeholder="번호" readonly="readonly" value="${qna.qnaIndex}">
					 	</div>
						<div class="form-group">
							<label for="QnAGetTitle">제목</label> <input type="text"
								class="form-control" id="QnAGetTitle" name="qnaTitle" placeholder="제목"
								readonly="readonly" value="${qna.qnaTitle}">
						</div>
						<div class="form-group">
							<label for="QnAGetWriter">작성자</label> <input type="text"
								class="form-control" id="QnAGetWriter" name="qnaWriter" placeholder="작성자"
								readonly="readonly" value="${qna.qnaWriter}">
						</div>
						<div class="form-group">
							<label for="QnAGetDate">날짜</label> <input type="text"
								class="form-control" id="QnAGetDate" name="qnaDate" placeholder="날짜"
								readonly="readonly" value="${qna.qnaDate}">
						</div>
						<div class="form-group">
							<label for="QnAGetContent">내용</label>
							<textarea class="form-control" id="QnAGetContent" name="qnaContent"
								placeholder="내용" style="resize: none" readonly="readonly">${qna.qnaContent}</textarea>
						</div>
						<div class="form-group">
							<label for="QnAGetAnswer">답변</label>
							<textarea class="form-control" id="QnAGetAnswer" name="qnaAnswer"
								placeholder="미답변 상태" style="resize: none">${qna.qnaAnswer}</textarea>
						</div>
						<input type="hidden" name="qnaAnsState" value="답변 완료">
						<button type="submit" data-oper="modify" id="modifyOK" class="btn btn-default">확인</button>
					 	<button type="button" id="cancel" class="btn btn-default">취소</button>
					</form>
				</div>
				<!-- QnAWrap -->
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
								src="../../../resources/img/GumonMain/img_sns_instar.png"
								alt="인스타"></a> <a href="#" target="_blank"><img
								src="../../../resources/img/GumonMain/img_sns_blog.png"
								alt="블로그"></a> <a href="#" target="_blank"><img
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
<script>
	$("#cancel").on("click", function(e){
		
		var QnAModifyGetNo = $("#QnAModifyGetNo").val();
		location.href = "/admin/QnAget?qnaIndex="+QnAModifyGetNo;
	});	
</script>
</body>
</html>