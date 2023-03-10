<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Creative Multipurpose Bootstrap Template">

<!-- Favicon -->
<link rel="shortcut icon" href="../assets/images/favicon.ico">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700"
	rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/themify-icons/css/themify-icons.css" />
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/animate/animate.min.css" />

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css" />
<script type="text/javascript" src="/js/todayBook.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<style>
h4 {
	font-weight: bold;
}

label {
	color: black;
}

.wrap {
	position: relative;
}

.wrap span {
	position: absolute;
	bottom: 5px;
	right: 5px;
	color: black;
}

#counter {
	background: rgba(255, 0, 0, 0.5);
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}
</style>
<body>

	<header>
		<%@ include file="../include/header.jsp"%>
	</header>

	<div class="innerpage-banner center bg-overlay-dark-7 py-7"
		style="background: url(../assets/images/bg/04.jpg) no-repeat; background-size: cover; background-position: center center;">
		<div class="container">
			<div class="row all-text-white">
				<div class="col-md-12 align-self-center">
					<h1 class="innerpage-title">????????? ???</h1>
					<h6 class="subtitle">????????? ????????? ???????????? ????????? ????????????.</h6>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><a
								href="/main?command=loginForm"><i class="ti-home"></i>Home</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- =======================
   Banner innerpage -->

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="text-center mb-4">????????? ??? ??????</h4>
					<form name="frm" method="post"
						action="book?command=adminTodayBookUpdate"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="bookNum"
								value="${todayBookList.bookNum}"> <input type="hidden"
								name="bookBrdNum" value="${todayBookList.bookBrdNum}">



							<div class="form-group">
								<!-- <label>??? ?????? ??????</label> -->
								<div class="row">


									<div class="col-md-4 col-xs-4">


										<!-- id="keyword" -->
										<button type="button" class="form-control col-md-6"
											name="selectBook" id="selectBook" onclick="openPopUp()">???
											??????</button>
									</div>

								</div>
							</div>



							<div class="form-group">
								<label>?????????<span style="color: red;">*</span></label> <input
									class="form-control" type="text"
									value="${todayBookList.bookTitle}" name="bookTitle"
									placeholder="???????????? ???????????????.">
							</div>

							<div class="form-group">
								<label>??????<span style="color: red;">*</span></label> <input
									class="form-control" type="text"
									value="${todayBookList.writer}" name="writer"
									placeholder="????????? ???????????????.">
							</div>
							<div class="form-group">
								<label>?????????<span style="color: red;">*</span></label> <input
									class="form-control" type="text"
									value="${todayBookList.publisher}" name="publisher"
									placeholder="???????????? ???????????????.">
							</div>

							<label>????????? ?????????<span style="color: red;">*</span></label> <input
								class="form-control" type="text"
								value="${todayBookList.bookBrdTitle}" name="bookBrdTitle">
						</div>


						<div class="form-group">

							<label>??????<span style="color: red;">*</span></label>
							<div class="wrap">
								<textarea class="form-control" rows="10" name="bookBrdContent"
									id="bookBrdContent" placeholder="????????? ???????????????.">${todayBookList.bookBrdContent}</textarea>
								<span id="counter">###</span>
							</div>
						</div>


						<div class="form-group">
							<label>?????? ??????</label> <input class="form-control" type="text"
								value="${todayBookList.imgPath}" name="imgPath"
								readonly="readonly">
						</div>

						<!-- ????????? ??????-->
						<div class="form-group">
							<input type="file" class="form-control-file" name="new_imgPath"
								value="">
						</div>
						<!--????????? ???  -->


						<input type="submit" class="btn btn-grad"
							onclick="return todayBookCheck()" value="??????">

						<%--  <button type="button"  class="btn btn-grad" id="delete" onclick="location.href='book?command=adminTodayBookDelete&bookBrdNum=${todayBookList.bookBrdNum}'" >
                 ??????</button> --%>
						<button type="button" class="btn btn-grad" id="delete">
							??????</button>
						<button type="button" class="btn btn-grad" id="cancel">??????</button>
					</form>

				</div>

			</div>

		</div>
	</section>
	<script>
		$(document).ready(function() {

			$('#bookBrdContent').on('keyup', function() {

				if ($(this).val().length > 3000) {

					$(this).val($(this).val().substring(0, 3000));

				}

			});

		});

		$(function() {
			$('#bookBrdContent').keyup(function(e) {
				var content = $(this).val();

				$('#counter').html(content.length + '/3000');
			});
			$('#content').keyup();
		});

		function openPopUp() {
			// window.name = "????????? ??????"; 
			window.name = "parentForm";
			// window.open("open??? window", "????????? ??????", "????????? ??????");
			var width = "650";
			var height = "600";
			var top = (window.screen.height - height) / 2;
			var left = (window.screen.width - width) / 2;
			var url = "book?command=bookPopup";
			var title = "???";
			var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width="
					+ width
					+ ",height="
					+ height
					+ ",top="
					+ top
					+ ",left="
					+ left;

			window.open(url, title, status);
		}

		$(document)
				.ready(
						function() {
							$('#cancel')
									.on(
											"click",
											function(event) {
												self.location = "book?command=adminTodayBookList";
											});
							$('#delete')
									.on(
											"click",
											function(evt) {

												var confirmStat = confirm("?????????????????????????");

												if (confirmStat == true) {
													var bookBrdNum = $(
															'#bookBrdNum')
															.val();
													alert("?????????????????????.");
													self.location = "book?command=adminTodayBookDelete&bookBrdNum=${todayBookList.bookBrdNum}";
												} else {
													return false;
												}

											});

							$('.Message').on("click", function(event) {

							});
						});

		$(document).ready(function() {
			$('form').submit(function() {
				var result = alert("?????????????????????.");

				return result;
			})
		})
	</script>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>