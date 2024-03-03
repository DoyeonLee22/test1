<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.free.BoardDTO"%>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Suggest Page</title>

<link rel="stylesheet" href="css/suT.css">

</head>
<body>
	<%
	// 세션에서 권한 정보 가져오기
	session = request.getSession(false);
	String role = null;
	String userId = null;
	if (session != null) {
		role = (String) session.getAttribute("role");
		userId = (String) session.getAttribute("user");
	}
	System.out.println("----------------------------------------------------");
	System.out.println("session : " + session);
	System.out.println("role : " + role);
	System.out.println("userId : " + userId);

	String displayGrade = "잘못된 접근";
	String displayTitle = "잘못된 접근";
	if ("ADMIN".equals(role)) {
		displayGrade = "관리자";
		displayTitle = "관리자 페이지";
	} else if ("WORKER".equals(role)) {
		displayGrade = "작업자";
		displayTitle = "작업자 페이지";
	}
	%>
	<div id="workerTitle">
		<div id="workerLogo">
			<a href="#"> 
			<img src="${pageContext.request.contextPath}/images/logo.png"
				 class="logo">
			</a>
		</div>
		<h1 id="mainTitle">
			<a href="main.jsp"><%=displayTitle%></a>
		</h1>
		<div id="myPage">
			<div id="myPageLogo">
				<image src="${pageContext.request.contextPath}/images/bee_happy.png"
					   class="workerPic">
			</div>
			<span id="workerName"><span class="workerGrade"> <%--displayGrade--%>
			<br>
			</span>${sessionScope.name}</span>
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
					<li><a href="facilityMonitoring.html" class="hover" title="품질검사">설비</a></li>
					<li><a href="stock_status.html" class="hover" title="건의사항">재고관리</a></li>
					<%
					if ("ADMIN".equals(role)) {
					%>
					<li id="adminTitle"><a href="Employee_managemen.html"
						class="hover" title="직원관리">직원관리</a></li>
					<%
					}
					%>
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
							<li><a href="Report_of_defective_inventory.html">재고 불량 신고</a></li>
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
							<li><a href="dot?boardType=자유게시판">자유게시판</a></li>
							<li><a href="dot?boardType=건의게시판">건의사항</a></li>
							<li><a href="dot?boardType=QaA게시판">Q&A</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="aside-section-container">
			<aside>
				<ul>
					<li><a href="dot?boardType=자유게시판">자유게시판</a></li>
					<li><a href="dot?boardType=건의게시판">건의사항</a></li>
					<li><a href="dot?boardType=QaA게시판">Q&A</a></li>
				</ul>
			</aside>
			<section>
				<div style="text-align: center; margin-top: 30px;">
					<h2>건의사항</h2>
				</div>
				<div class="search-container">
					<input type="text" class="search_text" placeholder="Search...">
					<img width="25" 
					     height="25" 
					     src="https://cdn.discordapp.com/attachments/1186454147558551552/1201320591920218232/2866321.png?ex=65d29e7c&is=65c0297c&hm=5284e6af05cf1457e4f7d3b9801cf540e14d90d174b0003a4974d4691c79b6bb&" 
					     alt="Search" 
					     class="glasses">
				</div>

				<form action="doi" method="GET">
					<div style="display: none">
						<input type="hidden" name="boardType" value="건의게시판"> 
						<input type="hidden" name="userId" value="<%=userId%>"> 
						<input type="hidden" name="wdate" id="nowTime" value=""> 
						<input type="hidden" name="hits" value="0">
					</div>
					<div id="suggestBox">
						<div style="margin: 10px auto; width: 400px; text-align: left;">
							<input type="hidden" name="boardType" value="건의게시판"> 
							<input type="hidden" name="wdate" value=""> 제목
							<br> 
							<input type="text" id="suggestTitle" name="title">
							<br>
							이름(익명<input type="checkbox" id="anonymous">)
							<br> 
							<input type="text" id="suggestName" name="writer" readonly>
							<br>
							내용
							<br>
							<textarea type="text" id="suggestContent" name="content" rows="8" cols="50">
							</textarea>
						</div>
						<div id="sendBtnArea">
							<button type="submit" id="sentBtn">전송</button>
						</div>
					</div>
				</form>
				<table id="totalTable">
					<thead>
						<tr style="background-color: #ddd;">
							<th width="10%">No.</th>
							<th width="48%">제목</th>
							<th width="20%">이름</th>
							<th width="22%">작성시간</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<%
						try {
							List list = (List) request.getAttribute("list");

							System.out.println("list.size() : " + list.size());
							for (int i = 0; i < list.size(); i++) {
								BoardDTO board = (BoardDTO) list.get(i);

								String boardType = board.getBoardType();
								int seq = board.getSeq();
								String userDBId = board.getUserId();
								String num = board.getNum();
								String title = board.getTitle();
								String content = board.getContent();
								String writer = board.getWriter();
								Date wDate = board.getWdate();
						%>
						<tr class="noticeTr">
							<td style="display: none" id="userIdWrite"><%=userDBId%></td>
							<td><%=num%></td>
							<td class="tableTdTitle" data-seq="<%=seq%>"><%=title%></td>
							<td style="display: none;"><textarea class="contentBox"><%=content%></textarea></td>
							<td class="writer"><%=writer%></td>
							<td><%=wDate%></td>
							<td class="hiddenTd">
								<!-- 삭제 버튼 -->
								<button type="button" 
										name="<%=seq%>" 
										class="deleteBtn"
									    onclick="deletePost(<%=seq%>)">삭제
								</button>
							</td>
						</tr>
						<%
							}
						} catch (Exception e) {
							System.out.println("에러");
							e.printStackTrace();
						}
						%>
					</tbody>
				</table>
				<div class="buttonZip">
					<button type="button" class="directBtn">&lt;&lt;</button>
					<button type="button" class="directBtn">&lt;</button>
					<button type="button" class="numberBtn" style="margin-left: 20px;">1</button>
					<button type="button" class="numberBtn" style="margin-right: 20px;">2</button>
					<button type="button" class="directBtn">&gt;</button>
					<button type="button" class="directBtn">&gt;&gt;</button>
				</div>

				<div id="myModal" class="modal">
					<div class="modal-content">
						<span id="closeModalBtn" class="close">
							<img src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&">
						</span>
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
								<td>
									<textarea id="textContentBox" 
											  rows="10" 
											  cols="35"
										      readonly>
									</textarea>
								</td>
							</tr>
						</table>
						<div class="btnZip">
							<button type="button" id="delBtn">삭제</button>
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer>ⓒ2024 J.company System</footer>
	</div>
</body>
<script>
	let userRole = '<%=role%>';
	
	let ttr = document.querySelectorAll(".tableTdTitle");
	let delBtn2nd = document.querySelector("#delBtn");
	
	for(let i=0; i<ttr.length; i++) {
		ttr[i].addEventListener("click", (event) => {
			let userId = event.currentTarget.closest("tr").querySelector("#userIdWrite").innerText;

			console.log("userId : " + userId);
			let seqValue = event.target.getAttribute('data-seq');
			document.querySelector("#delBtn").style.display = "inline";

            console.log("seqValue : " + seqValue);
            console.log("delBtn2nd : " + delBtn2nd.parentNode.innerHTML);
			
            delBtn2nd.onclick = function() {
            	console.log("seqValue2 : " + seqValue);
            	let boardTypeName = document.querySelector('input[name="boardType"]');
            	let boardType = boardTypeName.value;
            	window.location.href = "dod?seq=" + seqValue + "&boardType=" + boardType;
            	console.log("seqValue2 : " + seqValue);
            };
		})
	}
</script>
<script src="js/suT.js"></script>
</html>