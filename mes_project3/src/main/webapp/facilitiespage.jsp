<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facilities Page</title>
    <link rel="stylesheet" href="facilitiespage.css">

</head>

<body>
    <form name="frm">
        <div id="workerTitle">
            <div id="workerLogo">
                <a href="#">
                    <img src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420325036082/Jlogo.png?ex=65c70b1f&is=65b4961f&hm=ae28f53e9280fe71cffc1fc2ca74aec892875f13143ef4e109da28023c5b414b&"
                        class="logo"></img>
                </a>
            </div>
            <h1 id="mainTitle1"><a href="main.html">작업자 페이지</a></h1>
            <h1 id="mainTitle2"><a href="main.html">관리자 페이지</a></h1>
            <div id="myPage">
                <div id="myPageLogo">
                    <img src="https://cdn.discordapp.com/attachments/1185161279804026893/1200675420551520370/workerP.jpg?ex=65c70b1f&is=65b4961f&hm=c49f91b245305c4bb33c58e626bc4960b4f601257e433425a8d7cc0da454126e&"
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
                    <h1 style="text-align: center; font-size: 30px; margin-top: 40px">설비 설정</h1>
                    <!-- 알아서 article 추가하셈 -->
                    <!-- <article></article> -->
                    <div class="options-container">
                        <div class="lego-option">
                            <div>
                                1번 생산라인
                            </div>
                            <div>
                                <select name="cpu-option" class="cpu-option">
                                    <option value="1">퍼포먼스</option>
                                    <option value="2">메인스트림</option>
                                    <option value="3">엔트리</option>
                                </select>
                            </div>
                            <div class="processOption">
                                <input type="text" value="그래픽카드 : RTX 3080ti" class="option-value1" readonly><br>
                                <input type="text" value="SSD : 1TB" class="option-value2" readonly><br>
                                <input type="text" value="RAM : 32GB" class="option-value3" readonly><br>
                            </div>
                            <div>
                                <button type="button" class="change-option">수정</button>
                            </div>
                        </div>
                        <div id="optionpage-option-select-page">
                            <h2>옵션 변경 PAGE</h2>
                            <div id="optionpage-option-select-box">
                                <div class="parent-div">
                                    <input type="checkbox" class="option-delete-box">
                                    <input type="text" readonly value="그래픽카드" class="optionpage-lego-option">
                                    <select class="optionpage-lego-option-select1">
                                        <option value="그래픽카드 : RTX 3060" name="graphics-card" selected>
                                            RTX 3060
                                        </option>
                                        <option value="그래픽카드 : RTX 3070ti" name="graphics-card">
                                            RTX 3070ti
                                        </option>
                                        <option value="그래픽카드 : RTX 3080ti" name="graphics-card">
                                            RTX 3080ti
                                        </option>
                                    </select>
                                </div>
                                <div class="parent-div">
                                    <input type="checkbox" class="option-delete-box">
                                    <input type="text" readonly value="저장장치" class="optionpage-lego-option">
                                    <select class="optionpage-lego-option-select2">
                                        <option value="SSD : 250GB" name="storage" selected>
                                            SSD 250GB
                                        </option>
                                        <option value="SSD : 500GB" name="storage">
                                            SSD 500GB
                                        </option>
                                        <option value="SSD : 1TB" name="storage">
                                            SSD 1TB
                                        </option>
                                    </select>
                                </div>
                                <div class="parent-div">
                                    <input type="checkbox" class="option-delete-box">
                                    <input type="text" readonly value="메모리" class="optionpage-lego-option">
                                    <select class="optionpage-lego-option-select3">
                                        <option value="RAM : 8GB" name="memory" selected>
                                            RAM 8GB
                                        </option>
                                        <option value="RAM : 16GB" name="memory">
                                            RAM 16GB
                                        </option>
                                        <option value="RAM : 32GB" name="memory">
                                            RAM 32GB
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="optionpage-button">
                                <button type="button" class="optionpage-add-option-btn">추가</button>
                                <button type="button" class="optionpage-delete-option-btn">삭제</button>
                                <button type="button" class="optionpage-delete-option-real-btn">삭제</button>
                            </div>
                            <div class="optionpage-button-zip">
                                <button type="button" class="optionpage-application-btn">적용</button>
                                <div class="optionpage-spacebar-btn"></div>
                                <button type="button" class="optionpage-delete-btn">취소</button>
                            </div>
                            <div id="detail-option-select" class="modal">
                                <div class="modal-content">
                                    <span id="closeDetailBtn" class="close">
                                        <img width="20" height="20"
                                            src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&">
                                        </img>
                                    </span>
                                    <h2>세부 옵션 선택</h2>
                                    <p>
                                        <input type="text" class="detail-title-value">
                                        <input type="text" class="detail-content-value">
                                    </p>
                                    <button type="button" id="detail-select-btn">추가</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" id="add-option-btn">추가</button>
                    <button type="button" id="openModalBtn">설정</button>

                    <div id="myModal" class="modal">
                        <div class="modal-content">
                            <span id="closeModalBtn" class="close">
                                <img src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"
                                    style="width:20px; height:20px"></img>
                            </span>
                            <h3>설비설정을 완료 하시겠습니까?</h3>
                            <div class="option-check-botton-zip">
                                <button type="button" class="okay-btn">확인</button>
                                <button type="button" class="nono-btn">취소</button>
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
    </form>
<script src="facilitiespage.js"></script>
</body>

</html>