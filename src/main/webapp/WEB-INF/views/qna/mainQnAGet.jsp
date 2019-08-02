<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/mainQnA.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

   <script>
   		$(document).ready(function(){

			$('nav .one').hover(function () {
			    if($(".callsenterSub").css("display") == "none"){
			       $('.callsenterSub').slideDown();
			       $("headerA").css("color","#f15b6d");
			       event.preventDefault();
			    } else {
			       $('.callsenterSub').css("display", "none");
			    }
			});

			$('input[id="pwdCheck"]').change(function() {
				    var value = $(this).val();
				    var checked = $(this).prop('checked');

				    if(checked)
				    	$('#mainQnARegisterPwd').attr("readonly", false);
				    else
				        $('#mainQnARegisterPwd').attr("readonly", true);
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
							<li><a href="#">스터디 찾기</a></li>
							<li><a href="#">레벨 테스트</a></li>
							<li><a href="#">공지사항</a></li>
							<li class="one"><a href="#">고객센터</a>
								<ul class="callsenterSub">
									<li><a href="#">FAQ</a></li>
									<li><a href="#">QnA</a></li>
								</ul>
							</li>
						</ul>
						<ul class="gnb">
							<li><a href="#">로그인</a></li>
							<li><a href="#">학생 회원가입</a></li>
							<li><a href="#">리더 시작하기</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="container">
			<div class="inner">
				<h1>QnA 상세 정보</h1>
				<div class="QnAWrap">
					<form class="MyQnAGetForm">
					  <div class="form-group">
					    <label for="QnAGetNo">번호</label>
					    <input type="text" class="form-control" id="QnAGetNo" placeholder="번호" readonly="readonly"  value="${qna.qnaIndex}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetTitle">제목</label>
					    <input type="text" class="form-control" id="QnAGetTitle" placeholder="제목" readonly="readonly" value="${qna.qnaTitle}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetDate">날짜</label>
					    <input type="text" class="form-control" id="QnAGetDate" placeholder="날짜" readonly="readonly" value="${qna.qnaDate}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetDate">작성자</label>
					    <input type="text" class="form-control" id="QnAGetDate" placeholder="작성자" readonly="readonly" value="${qna.qnaWriter}">
					  </div>
					  <div class="form-group">
					    <label for="QnAGetContent">내용</label>
					    <textarea class="form-control" id="QnAGetContent" placeholder="내용" style="resize: none" readonly="readonly">${qna.qnaContent}</textarea>
					  </div>
					  <button data-oper="modify" class="btn btn-default">수정</button>
					  <button data-oper="remove" class="btn btn-default">삭제</button>
					  <button data-oper="list" class="btn btn-default">목록</button>
					</form>
					<div class="MyQnAGetAnswer">
						<h2>답변내용</h2>
						<input type="textarea" class="form-control" id="QnAGetContent" placeholder="내용" readonly="readonly">
						<!-- 나중에 answer할떄 수정 -->
					</div>
					<form id="operForm" action="/qna/modify" method="get">
						<input type="hidden" id="qnaIndex" name="qnaIndex" value="${qna.qnaIndex}">
						<%-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<input type="hidden" name="type" value="${cri.type }">
						<input type="hidden" name="keyword" value="${cri.keyword }"> --%>
					</form>
				</div>
			</div><!-- inner -->
		</div><!-- container -->
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber"><b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)</div>
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
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_facebook.png" alt="페이스북"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_kakaostory.png" alt="카카오스토리"></a>
		                </div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div><!-- inner -->
		</footer>
	</div><!-- wrap -->
<script>
$(function() {
	var operForm = $("#operForm");
	
	//modify
	$('button[data-oper="modify"]').on("click", function(e){
		operForm.attr("action", "/qna/modify")
				.submit();
	});
	
	//list
	$('button[data-oper="list"]').on("click", function(e){
		/* operForm.find('#qnaIndex').remove();
		operForm.attr("action","/qna/list");
		operForm.submit(); */
		location.href = "/qna/register";
	});
	
	//remove
	$('button[data-oper="remove"]').on("click", function(e){
		
		var conf = confirm("정말로 삭제하시겠습니까?");
		alert(conf);
		
		if(conf == true){
			con = 1;
		} else {
			conf = 0;
		}

		operForm.attr("action","/qna/remove").attr("method", "post");
		operForm.submit();
	});
});
</script>
</body>
</html>