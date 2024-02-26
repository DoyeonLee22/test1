<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Page</title>
<link rel="stylesheet" href="process.css">

</head>

<body>
    <form name="frm">
        <div id="workerTitle">
            <div id="workerLogo">
                <a href="#">
                    <image
                        src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420325036082/Jlogo.png?ex=65c70b1f&is=65b4961f&hm=ae28f53e9280fe71cffc1fc2ca74aec892875f13143ef4e109da28023c5b414b&"
                        class="logo"></image>
                </a>
            </div>
            <h1 id="mainTitle1"><a href="main.html">작업자 페이지</a></h1>
            <h1 id="mainTitle2"><a href="main.html">관리자 페이지</a></h1>
            <div id="myPage">
                <div id="myPageLogo">
                    <image
                        src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420551520370/workerP.jpg?ex=65c70b1f&is=65b4961f&hm=c49f91b245305c4bb33c58e626bc4960b4f601257e433425a8d7cc0da454126e&"
                        class="workerPic">
                </div>
                <span id="workerName"><span class="workerGrade">관리자<br></span>이도연 대리님</span>
            </div>
        </div>

        <div class="wrap">
            <div class="header-nav-container">
                <header>
                    <!-- 모바일 헤더 코드 -->
                    <div class="header-content">
                        <div class="hamburger-menu">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <h1 id="headerTitle" style="display: none;"><a href="main.html">J.company</a></h1>
                    </div>
                    <ul>
                        <li><a href="work-order.html" class="hover" title="작업지시서">작업</a></li>
                        <li><a href="facilityMonitoring.html" class="hover" title="품질검사">설비</a></li>
                        <li><a href="stock_status.html" class="hover" title="건의사항">재고관리</a></li>
                        <li id="adminTitle"><a href="Employee_managemen.html" class="hover" title="직원관리">직원관리</a></li>
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
                        <li>
                            <a href="FacilityMonitoring.html">설비 모니터링</a>
                        </li>
                        <li>
                            <a href="process.html">공정도</a>

                        </li>
                        <li>
                            <a href="facilitiespage.html">설비설정</a>
                        </li>
                    </ul>
                </aside>
                <section>
                    <h1 style="text-align: center; font-size: 30px; margin-top: 40px">공정도</h1>
                    <div class="process-chart">
                        <div id="section-nav">
                            <div class="tree-graph-line-title1">1번라인 공정도</div>
                            <div class="tree-graph-line-title2">2번라인 공정도</div>
                            <div class="tree-graph-line-title3">3번라인 공정도</div>
                            <div class="tree-graph-line-title4">4번라인 공정도</div>
                        </div>
                        <div class="tree-line1">
                        </div>
                        <div class="tree-line2">
                        </div>

                        <div class="tree-graph-circle1">설계 확인</div>
                        <div class="tree-graph-circle2">자재 확인</div>
                        <div class="tree-graph-circle3">그래픽카드 조립</div>

                        <div class="tree-graph-circle4">저장장치 조립</div>
                        <div class="tree-graph-circle5">메모리 조립</div>
                        <div class="tree-graph-circle6">조립 검사</div>

                        <div class="tree-graph-circle7">품질 검사</div>
                        <div class="tree-graph-circle8">포장</div>
                        <div class="tree-graph-circle9">출하</div>

                        <div class="tree-graph-bar1">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar2">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>

                        <div class="tree-graph-bar3">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar4">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar5">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar6">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar7">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>
                        <div class="tree-graph-bar8">
                            <image width="30" height="30"
                                src="https://cdn.discordapp.com/attachments/1185161279804026893/1201801919757029427/pngwing.com_1.png?ex=65cb2442&is=65b8af42&hm=587c52877b6d903462980dbd8103a16072852811f563d2fdfcdf8da3cb0dceec&">
                            </image>
                        </div>

                        <table class="process-chart-time-table">
                            <thead>
                                <tr>
                                    <th>일시</th>
                                    <th>완성된 컴퓨터 수</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2024-02-02<br><br>
                                        시작시간 : 09 : 00<br> <!-- 설비설정을 누른 시간 -->
                                        현재시간 : 14 : 06
                                    </td>
                                    <td class="completeComputer">0</td>
                                    <td class="completeComputer-progress">
                                        설계 확인중
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="toggleDiv">
                        <button type="button" id="toggle">토글</button>
                    </div>
                </section>
            </div>
            <footer>ⓒ2024 J.company System</footer>
        </div>
    </form>
    
</body>
<scirpt src="process.js"></scirpt>
</html>