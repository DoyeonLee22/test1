<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Work Record Page</title>
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}
</style>
<link rel="stylesheet" type="text/css" href="workLog.css">
</head>
<body>
	<div id="workerTitle">
		<div id="workerLogo">
			<a href="#"> <image
					src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420325036082/Jlogo.png?ex=65c70b1f&is=65b4961f&hm=ae28f53e9280fe71cffc1fc2ca74aec892875f13143ef4e109da28023c5b414b&"
					class="logo"></image>
			</a>
		</div>
		<h1 id="mainTitle1">작업자 페이지</h1>
		<h1 id="mainTitle2">관리자 페이지</h1>
		<div id="myPage">
			<div id="myPageLogo">
				<image
					src="https://image.spreadshirtmedia.net/image-server/v1/compositions/T996A1PA2179PT10X17Y18D172654919W7098H6789/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/pixel-art-fox-fox-podstawki.jpg"
					class="workerPic">
			</div>
			<span id="workerName"><span class="workerGrade">작업자<br></span>이도연
				대리님</span>
		</div>
	</div>

	<div class="wrap">
		<div class="header-nav-container">
			<header>
				<!-- 모바일 헤더 코드 -->
				<div class="header-content">
					<div class="hamburger-menu">
						<span></span> <span></span> <span></span>
					</div>
					<h1 id="headerTitle" style="display: none;">
						<a href="main.html">J.company</a>
					</h1>
				</div>
				<ul>
					<li><a href="work-order.html" class="hover" title="작업지시서">작업</a></li>
					<li><a href="facilityMonitoring.html" class="hover"
						title="품질검사">설비</a></li>
					<li><a href="stock_status.html" class="hover" title="건의사항">재고관리</a></li>
					<li id="adminTitle"><a href="Employee_managemen.html"
						class="hover" title="직원관리">직원관리</a></li>
					<li><a href="boardTable.html" class="hover" title="직원 게시판">게시판</a></li>
				</ul>
			</header>
			<nav>
				<div class="menu-bar">
					<div class="menu-bar-content">
						<ul>
							<li><a href="work-order.html">작업 지침서</a></li>
							<li><a href="work-safety.html">안전 지침서</a></li>
							<li><a href="work-quality.html">품질검사</a></li>
							<li><a href="work-report.html">작업보고</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
							<li><a href="facilityMonitoring.html">설비 모니터링</a></li>

							<li><a href="process.html">공정도</a></li>

							<li><a href="facilitiespage.html">설비 설정</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
							<li><a href="stock_status.html">재고 현황</a></li>
							<li><a href="Stock_Request.html">재고 신청</a></li>
							<li><a href="Finished_product_management.html">완제품 관리</a></li>
							<li><a href="Report_of_defective_inventory.html">재고 불량
									신고</a></li>
						</ul>
					</div>
					<div class="menu-bar-content" id="adminNav">
						<ul>
							<li><a href="Employee_managemen.html">직원목록</a></li>
							<li><a href="work-record.html">근무기록</a></li>
							<li><a href="vacation.html">휴가신청</a></li>
						</ul>
					</div>
					<div class="menu-bar-content">
						<ul>
							<li><a href="boardTable.html">자유게시판</a></li>
							<li><a href="suggestTable.html">건의사항</a></li>
							<li><a href="QA.html">Q&A</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="aside-section-container">
			<aside>
				<ul>
					<li><a href="#">직원목록</a></li>
					<li><a href="#">근무기록</a></li>
					<li><a href="#">휴가신청</a></li>
				</ul>
			</aside>
			<section>
				<article class="article-container">
					<div class="work-recode-main">

						<div class="work-report-title">
							<div>
								<h3>근무기록표</h3>
							</div>
						</div>

						<div class="work-report-content">
							<div class="work-report-time">
								<div class="work-report-info">
									<div class="work-report-img">
										<img
											src="https://cdn.discordapp.com/attachments/1186454147558551552/1204581039868084285/KakaoTalk_20240129_145354467.png?ex=65d54083&is=65c2cb83&hm=6afadc8657ea19624501ba952265b4362a35be35008b212da665db8720b441e3&">
									</div>
									<div class="work-report-tell">
										<p>팀장 정장훈</p>
										<span>이메일 : wkd@naver.com</span><br> <span>연락처 :
											010-2933-8001</span>
									</div>
								</div>
								<div class="report-time-info">
									<div class="report-day">
										<span>24.01.22 ~ 24.01.26</span>
									</div>
									<div class="total-work">
										<span>총 근무 30h 03m</span>
									</div>
									<div class="special-work">
										<span>연장 01h 03m</span><br> <span>특근 00h 00m</span>
									</div>
									<div class="add-inform">
										<span>지각 00</span> <span>결근 00</span> <span class="enter">연장
											02</span> <span>특근 00</span> <span>연차 0/20</span>
									</div>
								</div>
							</div>
							<div class="work-report-time">
								<div class="work-report-info">
									<div class="work-report-img">
										<img
											src="https://media.discordapp.net/attachments/1186454147558551552/1203947811654074430/b525b7fb529992f7.jpg?ex=65d2f2c6&is=65c07dc6&hm=594005fd10466b45392d6cf947c27056299b71a36d50920d9283fb6d24ec207d&=&format=webp&width=468&height=468">
									</div>
									<div class="work-report-tell">
										<p>대리 이성현</p>
										<span>이메일 : leesh@gmail.com</span><br> <span>연락처 :
											010-5553-7887</span>
									</div>
								</div>
								<div class="report-time-info">
									<div class="report-day">
										<span>24.01.22 ~ 24.01.26</span>
									</div>
									<div class="total-work">
										<span>총 근무 30h 03m</span>
									</div>
									<div class="special-work">
										<span>연장 01h 03m</span><br> <span>특근 00h 00m</span>
									</div>
									<div class="add-inform">
										<span>지각 00</span> <span>결근 00</span> <span class="enter">연장
											02</span> <span>특근 00</span> <span>연차 0/20</span>
									</div>
								</div>
							</div>
							<div class="work-report-time">
								<div class="work-report-info">
									<div class="work-report-img">
										<img
											src="https://media.discordapp.net/attachments/1186454147558551552/1203955694747918366/image.png?ex=65d2fa1e&is=65c0851e&hm=a2244822ee56e5b93b762d27fe9dc7c1c9345811664e59b8634d5e59d6802081&=&format=webp&quality=lossless&width=554&height=468">
									</div>
									<div class="work-report-tell">
										<p>차장 김태원</p>
										<span>이메일 : choi@naver.com</span><br> <span>연락처 :
											010-0000-0000</span>
									</div>
								</div>
								<div class="report-time-info">
									<div class="report-day">
										<span>24.01.22 ~ 24.01.26</span>
									</div>
									<div class="total-work">
										<span>총 근무 30h 03m</span>
									</div>
									<div class="special-work">
										<span>연장 01h 03m</span><br> <span>특근 00h 00m</span>
									</div>
									<div class="add-inform">
										<span>지각 00</span> <span>결근 00</span> <span class="enter">연장
											02</span> <span>특근 00</span> <span>연차 0/20</span>
									</div>
								</div>
							</div>
							<div class="work-report-time">
								<div class="work-report-info">
									<div class="work-report-img">
										<img
											src="https://cdn.discordapp.com/attachments/1186454147558551552/1203947754850885724/image.png?ex=65d2f2b9&is=65c07db9&hm=0e904a6c94e2546c974233c6d1289c7bf138e3ec1787a0534435d1c32e0d1663&">
									</div>
									<div class="work-report-tell">
										<p>대리 이도연</p>
										<span>이메일 : choi@naver.com</span><br> <span>연락처 :
											010-0000-0000</span>
									</div>
								</div>
								<div class="report-time-info">
									<div class="report-day">
										<span>24.01.22 ~ 24.01.26</span>
									</div>
									<div class="total-work">
										<span>총 근무 30h 03m</span>
									</div>
									<div class="special-work">
										<span>연장 01h 03m</span><br> <span>특근 00h 00m</span>
									</div>
									<div class="add-inform">
										<span>지각 00</span> <span>결근 00</span> <span class="enter">연장
											02</span> <span>특근 00</span> <span>연차 0/20</span>
									</div>
								</div>
							</div>
							<div class="work-report-time">
								<div class="work-report-info">
									<div class="work-report-img">
										<img
											src="https://cdn.discordapp.com/attachments/1186454147558551552/1204215611329089567/image.png?ex=65d3ec2e&is=65c1772e&hm=78b0f94ea376abd4607ea1bd638ab205e80cf2fbf734f22a67c0dce3722013f1&">
									</div>
									<div class="work-report-tell">
										<p>부장 서효림</p>
										<span>이메일 : shr3@naver.com</span><br> <span>연락처 :
											010-2933-8001</span>
									</div>
								</div>
								<div class="report-time-info">
									<div class="report-day">
										<span>24.01.22 ~ 24.01.26</span>
									</div>
									<div class="total-work">
										<span>총 근무 30h 03m</span>
									</div>
									<div class="special-work">
										<span>연장 01h 03m</span><br> <span>특근 00h 00m</span>
									</div>
									<div class="add-inform">
										<span>지각 00</span> <span>결근 00</span> <span class="enter">연장
											02</span> <span>특근 00</span> <span>연차 0/20</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
	<script src="workLog.js"></script>
</body>

</html>