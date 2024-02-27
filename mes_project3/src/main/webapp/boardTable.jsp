<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="doyeon.BoardDTO"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>


<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Freedom_Table Page</title>
<link rel="stylesheet" href="css/bt.css">

</head>

<body>
	<div id="workerTitle">
		<div id="workerLogo">
			<a href="#"> <image
					src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420325036082/Jlogo.png?ex=65c70b1f&is=65b4961f&hm=ae28f53e9280fe71cffc1fc2ca74aec892875f13143ef4e109da28023c5b414b&"
					class="logo"></image>
			</a>
		</div>
		<h1 id="mainTitle1">
			<a href="main.html">작업자 페이지</a>
		</h1>
		<h1 id="mainTitle2">
			<a href="main.html">관리자 페이지</a>
		</h1>
		<div id="myPage">
			<div id="myPageLogo">
				<image
					src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420551520370/workerP.jpg?ex=65c70b1f&is=65b4961f&hm=c49f91b245305c4bb33c58e626bc4960b4f601257e433425a8d7cc0da454126e&"
					class="workerPic"
					style="width: 80px;
                    height: 80px;
                    border-radius: 50%;">
			</div>
			<span id="workerName"><span class="workerGrade">관리자<br></span>이도연
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
					<li><a href="boardTable.html">자유게시판</a></li>
					<li><a href="suggestTable.html">건의사항</a></li>
					<li><a href="QA.html">Q&A</a></li>
				</ul>
			</aside>
			<section>
				<div style="text-align: center; margin-top: 30px;">
					<h2>자유게시판</h2>
				</div>
				<div class="search-container">
					<input type="text" class="search_text" placeholder="Search...">
					<img width="25" height="25"
						src="https://cdn.discordapp.com/attachments/1186454147558551552/1201320591920218232/2866321.png?ex=65d29e7c&is=65c0297c&hm=5284e6af05cf1457e4f7d3b9801cf540e14d90d174b0003a4974d4691c79b6bb&"
						alt="Search" class="glasses">
				</div>
				<form method="post" action="setting">
					<table id="boardTable">
						<thead>
							<tr style="background-color: #ddd;">
								<th class="hiddenTd"><input type="checkbox"
									id="checkAllBox"></th>
								<th width="50">No.</th>
								<th width="330">제목</th>
								<th width="85">작성자</th>
								<th width="170">작성일</th>
								<th width="76">조회수</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<%
							try {
								List list = (List) request.getAttribute("list");
							%>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<%
								System.out.println(list);
								int seq = ((BoardDTO) list.get(i)).getSeq();
								String num = ((BoardDTO) list.get(i)).getNum();
								String title = ((BoardDTO) list.get(i)).getTitle();
								String content = ((BoardDTO) list.get(i)).getContent();
								String writer = ((BoardDTO) list.get(i)).getWriter();
								Date wDate = ((BoardDTO) list.get(i)).getWdate();
								int viewCount = ((BoardDTO) list.get(i)).getHits();
							%>
							<tr class="noticeTr">
								<td class="hiddenTd"><input type="checkbox"
									class="checkchkbox" name="deleteChkBox" value="<%=seq%>">
								</td>
								<td><%=num%></td>
								<td class="tableTdTitle"><%=title%></td>
								<td style="display: none;"><textarea class="contentBox"><%=content%></textarea></td>
								<td class="writer"><%=writer%></td>
								<td><%=wDate%></td>
								<td><%=viewCount%></td>
								<td>
									<!-- 삭제 버튼 -->
									<button type="button" name="<%= seq %>" class="deleteBtn"
										onclick="deletePost(<%=seq%>)">삭제</button>
								</td>
							</tr>
							<%
								}
							}catch(Exception e) {
								System.out.println("에러");
								e.printStackTrace();
							}
							%>
						</tbody>
					</table>
					<div class="button-zip">
						<button type="button" id="deleteWriteBtn">삭제1</button>
						<button type="button" id="deleteWriteBtn2">삭제2</button>
						<button type="button" id="noticeWriteBtn">공지작성</button>
						<button type="button" id="writeBtn">글쓰기</button>
					</div>
					<div id="directBtnZip">
						<button type="button" class="directBtn">&lt;&lt;</button>
						<button type="button" class="directBtn">&lt;</button>
						<button type="button" class="numberBtn" style="margin-left: 20px;">1</button>
						<button type="button" class="numberBtn"
							style="margin-right: 20px;">2</button>
						<button type="button" class="directBtn">&gt;</button>
						<button type="button" class="directBtn">&gt;&gt;</button>
					</div>
					<div id="writeDiv">
						<div>
							<span style="font-size: 20px;">글 작성</span>
						</div>
						<table id="writeTable">
							<tr>
								<td style="display: none"><input type="text" name="num"
									value="1"></td>
								<td style="display: none"><input type="text" name="writer"
									value="이도연"></td>
								<td style="display: none"><input type="text" name="hits"
									value="0"></td>
								<td style="display: none"><input type="text" name="wdate"
									value="" id="nowTime"></td>
							</tr>
							<tr>
								<th width="70">제목</th>
								<td><input type="text" id="writeTitle" name="title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="textBox" rows="10" cols="60"
										name="content"></textarea></td>
							</tr>
						</table>
						<div class="wrtieBtnZip">
							<button type="submit" id="clearWrite">작성</button>
							<button type="button" id="resetWrite">취소</button>
						</div>
					</div>
					<div id="noticeWriteDiv">
						<div>
							<span style="font-size: 20px;">공지 작성</span>
						</div>
						<table id="noticeWriteTable">
							<tr>
								<th width="70">제목</th>
								<td><input type="text" id="noticeWriteTitle"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="noticeTextBox" rows="10" cols="60"></textarea></td>
							</tr>
						</table>
						<div class="noticeWrtieBtnZip">
							<button type="button" id="noticeClearWrite">작성</button>
							<button type="button" id="noticeResetWrite">취소</button>
						</div>
					</div>
				</form>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span id="closeModalBtn" class="close"><img
							src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
						<table id="readTable">
							<tr>
								<th width="70">제목</th>
								<td><input type="text" id="readTitle" readonly></td>
							</tr>
							<tr>
								<th height="30">작성자</th>
								<td><input type="text" id="writer" readonly></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="textContentBox" rows="10" cols="30"
										readonly></textarea></td>
							</tr>
						</table>
						<div class="btnZip">
							<button type="button" id="deleteBtn">닫기</button>
						</div>
					</div>
				</div>
				<div id="toggleDiv">
					<button type="button" id="toggle">토글</button>
				</div>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
	<!-- 		<script> 
 			<%--  
 				num = (String)request.getAttribute("num");
 				title = (String)request.getAttribute("title");
 				writer = (String)request.getAttribute("writer");
 				content = (String)request.getAttribute("content");
				
 				LocalDateTime currentTime = LocalDateTime.now();
 		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 		        String nowTime = currentTime.format(formatter);

				viewCount = (int)request.getAttribute("hits");
				viewCount = 0;
 			--%> 
<%--  			let num = '<%= num %>';  --%>
<%--  			let title = '<%= title %>';  --%>
<%-- 			let writer = '<%= writer %>';  --%>
<%--  			let content = '<%= content %>';  --%>
<%--  			let nowTime = '<%= nowTime %>';  --%>
<%--  			let viewCount = '<%= viewCount %>';  --%>
 		</script> -->
	<script src="js/bt.js"></script>
</body>

</html>