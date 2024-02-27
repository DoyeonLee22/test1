<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My page</title>
    <link rel="stylesheet" href="mypage.css">
</head>


<body>
    <div>
        <div id="myprofile">
            <div id="myprofliePic">
                <image
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1203977325457186836/KakaoTalk_20240205_151822418.jpg?ex=65d30e43&is=65c09943&hm=bbc9b17a6585edaa669c0fe838fff08bc61fdf93ee51510bd686db531616d602&"
                    class="mypic"></image>
            </div>
            <div id="myprofilecard">
                <div id="mycard">
                    이름 : 이도연<br>
                    전화번호 : 010 - 4721 - 2237<br>
                    이메일 : ldy0202@human.com<br>
                    PAX : 041 - 9999 - 2237
                </div>
                <span id="modify-profile">수정하기</span>
            </div>
            <div id="myprofilecontent">
                <div id="my-mail-page">
                    <a href="#">
                        <img
                            src="https://cdn.discordapp.com/attachments/1185161279804026893/1202848629878956052/mail-99218_640.png?ex=65cef315&is=65bc7e15&hm=42c1b645ea72a9b7e4a824c362af1060465ffd76b04acf05af7c6faa0b0c9420&">
                    </a>
                    <div>
                        <span id="mailMainpage">메일</span><br>
                        <span id="writeMailPage">메일쓰기</span>
                    </div>
                </div>
                <div id="todayWork">
                    오늘 할일
                    <div class="today-work-zip">
                        <ul>
                            <li>- 3번 라인 불량 검수</li>
                            <li>- CPU 재고 확인</li>
                            <li>- 창고 불량 재고 관리</li>
                            <li>- 환불 내역 확인</li>
                            <li>- 설비 설정 수정</li>
                        </ul>
                    </div>
                </div>
                <div id="instructions">
                    <img
                        src="https://cdn.discordapp.com/attachments/1185161279804026893/1203931959382769684/write-2935375_640.png?ex=65d2e403&is=65c06f03&hm=189761bd5036b16953c25f258f56d2497ddd7489a20bcd996cb44f4c2389afbd&">
                    <div>
                        금일 지시사항<br>
                        <span class="order-detail">- 세부사항</span>
                    </div>
                </div>

                <div id="vacationSchedule">
                </div>
            </div>
        </div>
        <div class="calendar">
            <div class="header">
                <button class="calendar_btn" onclick="prevCal();">&lt;</button>
                <div class="title"><span class="year"></span><span class="month"></span></div>
                <button class="calendar_btn" onclick="nextCal();">&gt;</button>
            </div>
            <div class="day">
                <div>S</div>
                <div>M</div>
                <div>T</div>
                <div>W</div>
                <div>T</div>
                <div>F</div>
                <div>S</div>
            </div>
            <div class="dates"></div>
        </div>
    </div>
    <button type="button" id="close-btn">닫기</button>
    <div class="vacation-word"></div>
    <button type="button" id="vacation-btn">휴가신청</button>

    <!-- 메일 팝업 -->
    <div id="mailPage" class="modal4">
        <div class="modal-content">
            <span id="closeMailBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>

            <div id="mailTable">
                <img width="30" height="30"
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1202848629878956052/mail-99218_640.png?ex=65cef315&is=65bc7e15&hm=42c1b645ea72a9b7e4a824c362af1060465ffd76b04acf05af7c6faa0b0c9420&">
                <div> &nbsp;&nbsp;메일</div>
                <table>
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="allCheckBox" width="20"></th>
                            <th width="100">보낸이</th>
                            <th width="200">제목</th>
                            <th width="100">시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" class="isCheckedBox"></td>
                            <td title="globalmind@google.com">Global_Mind</td>
                            <td>생산 일정 변경 사항 안내</td>
                            <td>02.04 12:30</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="isCheckedBox"></td>
                            <td title="easycom@google.com">EASY_C</td>
                            <td>귀하와 함께 할 수 없음에 유감을 표합니다.</td>
                            <td>02.04 11:56</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="isCheckedBox"></td>
                            <td title="fucherwork@google.com">FucherWork</td>
                            <td>생산 공정 개선을 위한 의견 수렴 안내</td>
                            <td>02.03 17:30</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="isCheckedBox"></td>
                            <td title="neosoft@google.com">NEO-SOFT</td>
                            <td>중요 업데이트 및 변경 사항 안내문.</td>
                            <td>02.02 14:12</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="isCheckedBox"></td>
                            <td title="brightcore@google.com">Bright-CORE</td>
                            <td>새로운 제품 런칭과 관련된 안내</td>
                            <td>02.01 08:51</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="mailBtnArea">
                <button type="button" id="mailDeleteBtn">삭제</button>
                <div id="pagingBtn">
                    <div style="background-color: #ccc;">1</div>
                    <div>2</div>
                    <div>3</div>
                </div>
                <button type="button" id="mailCloseBtn">닫기</button>
            </div>
        </div>
    </div>

    <!-- 메일 쓰기 팝업 -->
    <div id="mailWrite" class="modal5">
        <div class="modal-content" style="position: relative;">
            <span id="closeWriteBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <img width="30" height="30"
                src="https://cdn.discordapp.com/attachments/1185161279804026893/1202848629878956052/mail-99218_640.png?ex=65cef315&is=65bc7e15&hm=42c1b645ea72a9b7e4a824c362af1060465ffd76b04acf05af7c6faa0b0c9420&">
            <div style="display: inline-block; position: absolute; top: 25px;">&nbsp;&nbsp;메일 쓰기</div>

            <div id="mailWritePage">
                받는사람 : <input type="text"><br>
                <span style="display: inline-block; width: 30px;"></span>제목 : <input type="text"><br>
                <span style="display: inline-block; width: 30px;"></span>내용 : <br><textarea type="text" cols="50"
                    rows="10"></textarea>
            </div>
            <div class="write-btn-zip">
                <button type="button" id="apply-write-btn">쓰기</button>
                <button type="reset" id="delete-write-btn">취소</button>
            </div>
        </div>
    </div>


    <!-- 명함 수정 팝업 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span id="closeModalBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <h2>정보 수정</h2>
            <p style="width: 290px; text-align: right;">
                이름 : <input type="text" id="myName"><br>
                전화번호 : <input type="text" id="myNumber"><br>
                이메일 : <input type="text" id="myMail"><br>
                PAX : <input type="text" id="myPax">
            </p>
            <div class="btn-zip">
                <button type="button" id="apply-btn">적용</button>
                <button type="reset" id="delete-btn">취소</button>
            </div>
        </div>
    </div>

    <!-- 오늘 할일 팝업 -->
    <div id="todayWorkPage" class="modal3">
        <div class="modal-content">
            <span id="closeWorkBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <div class="todayWorkTable">
                <table id="workTable">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="totalChkBtn"></th>
                            <th width="180">오늘 할 일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="workChkBox"><input type="checkbox" class="work-check-box"></td>
                            <td class="tdContent">3번 라인 불량 검수</td>
                        </tr>
                        <tr>
                            <td class="workChkBox"><input type="checkbox" class="work-check-box"></td>
                            <td class="tdContent">CPU 재고 확인</td>
                        </tr>
                        <tr>
                            <td class="workChkBox"><input type="checkbox" class="work-check-box"></td>
                            <td class="tdContent">창고 불량 재고 관리</td>
                        </tr>
                        <tr>
                            <td class="workChkBox"><input type="checkbox" class="work-check-box"></td>
                            <td class="tdContent">환불 내역 확인</td>
                        </tr>
                        <tr>
                            <td class="workChkBox"><input type="checkbox" class="work-check-box"></td>
                            <td class="tdContent">설비 설정 수정</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="work-btn-zip">
                <button type="button" id="workCheckBox">삭제</button>
                <button type="reset" id="closeWorkBox">닫기</button>
            </div>
        </div>
    </div>

    <!-- 휴가 신청 팝업 -->
    <div id="vacationCard" class="modal2">
        <div class="modal-content">
            <span id="closeVacationBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <h2>휴가 신청</h2>
            <div id="reasonZip">
                <div class="vacationReason">연차</div>
                <div class="vacationReason">월차</div>
                <div class="vacationReason">반차</div>
                <div class="vacationReason">포상</div>
                <div class="vacationReason">외출</div>
                <div class="vacationReason">기타</div>
            </div>
            <div id="vacationWeek" style="margin-left: 100px; width: 300px; text-align: left;">
            </div>
            <div style="margin-left: 100px">사유 : <input type="text" class="reasonBox"></div>
            <div class="vacation-btn-zip">
                <button type="button" id="applyVacationBtn">신청</button>
                <button type="reset" id="deleteVacationBtn">취소</button>
            </div>
        </div>
    </div>

    <!-- 지시 사항 팝업 -->
    <div id="orderPage" class="modal">
        <div class="modal-content">
            <span id="closeOrderBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <h3>금일 지시사항</h3>
            <table id="orderTable">
                <thead>
                    <tr>
                        <th>날짜</th>
                        <th>지시사항</th>
                        <th>관리자</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody id="orderTableBody">
                    <tr>
                        <td>02.08</td>
                        <td><a href="#">설연휴 전 마감 주문 및 출하 일정 안내</a></td>
                        <td>최민수</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>02.07</td>
                        <td><a href="#">2번 라인 불량률 상승으로 인한 조치</a></td>
                        <td>최민수</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>02.06</td>
                        <td><a href="#">한파로 인한 기계 오작동 유의</a></td>
                        <td>최민수</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>02.05</td>
                        <td><a href="#">CPU 관련 보고서 작성</a></td>
                        <td>최민수</td>
                        <td>완료</td>
                    </tr>
                    <tr>
                        <td>02.02</td>
                        <td><a href="#">감기로 인해 회사 내 마스크 착용</a></td>
                        <td>최민수</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="order-btn-zip">
                <button type="button" id="orderWriteBtn">작성</button>
                <button type="button" id="orderCloseBtn">닫기</button>
            </div>
        </div>
    </div>

    <!-- 지시 사항 작성 팝업 -->
    <div id="orderWritePage" class="modal6">
        <div class="modal-content">
            <span id="closeOrderWriteBtn" class="close"><img
                    src="https://cdn.discordapp.com/attachments/1185161279804026893/1201735089197957160/15287.png?ex=65cae604&is=65b87104&hm=e986c916b65b591d57dfc74b65c46d3425de849f447a26132c493960a55a129b&"></span>
            <div>
                <span style="width: 30px; display: inline-block;"></span>제목 : <input type="text"
                    class="orderWriteTitle"><br>
                지시사항 : <br>
                <textarea cols="50" rows="10"></textarea>
            </div>
            <div class="orderWriteZip">
                <button type="button" id="orderWriteApplyBtn">적용</button>
                <button type="reset" id="orderWriteCancelbtn">취소</button>
            </div>
        </div>
    </div>



</body>
<script src="mypage.js"></script>
</html>