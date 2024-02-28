<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jjh.BoardDTO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management System</title>
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	font-family: "SOYOMapleBoldTTF";
	margin: 0 auto;
	/* font-family: Arial, sans-serif; */
	background: #fff;
	color: #333;
	background-color: #ccc;
}

/* 햄버거 메뉴 아이콘 */
.hamburger-menu {
	display: none;
	cursor: pointer;
	flex-direction: column;
	justify-content: space-between;
	width: 25px;
	height: 20px;
}

.hamburger-menu span {
	display: block;
	height: 3px;
	width: 100%;
	background-color: #fff;
	transition: all 0.2s ease;
}

/* title */
#workerTitle {
	display: flex;
	width: 1000px;
	justify-content: space-between;
	padding: 5px;
}

#workerLogo {
	width: 200px;
	height: 80px;
	display: flex;
	align-items: center;
}

#workerTitle h1 {
	width: 200px;
	color: #000;
}

#mainTitle1 {
	display: none;
}

#mainTitle1 a {
	text-decoration: none;
	color: #333;
}

#mainTitle2 {
	display: none;
}

#mainTitle2 a {
	text-decoration: none;
	color: #333;
}

#myPage {
	width: 200px;
	height: 80px;
	display: flex;
	align-items: center;
}

#myPageLogo {
	width: 80px;
	height: 80px;
	margin-right: 3%;
}

#workerName a {
	text-decoration: none;
	color: #333;
}

#workerName a:hover {
	text-decoration: none;
	color: #888;
	transition: color 0.2s ease;
}

#workerTitle .workerPic {
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

#workerTitle .logo {
	width: 200px;
	height: 70px;
}

/* title end */
.wrap {
	width: 1000px;
	/* height: 100vh; */
	display: flex;
	flex-direction: column;
	margin: auto;
}

/* header와 nav의 집합 */
.header-nav-container {
	position: relative;
	width: 100%;
	/* wrap과 동일한 너비 */
}

/* header 코드 */
header {
	width: 100%;
	background: #000;
	color: #fff;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

header h1 {
	font-size: 30px;
	margin: 0;
}

header ul {
	padding: 0;
	display: flex;
	justify-content: space-around;
	list-style: none;
	align-items: center;
}

header ul li {
	display: inline-block;
	margin: 0 15px;
}

header ul li a {
	font-size: 18px;
	text-decoration: none;
	color: #fff;
	transition: color 0.3s ease;
}

header ul li a:hover {
	color: #aaa;
}

/* header 코드 끝 */
nav {
	width: 100%;
	position: absolute;
	top: 100%;
	/* header 높이에 맞게 조정 */
	left: 0;
	right: 0;
	background: #eee;
	max-height: 0;
	overflow: hidden;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
		linear;
	visibility: hidden;
	z-index: 100;
	/* opacity: 0; */
}

/* nav 숨김요소 */
nav.active {
	max-height: 500px;
	/* 활성화될 때 최대 높이 설정 */
	visibility: visible;
	opacity: 1;
	transition: max-height 0.5s ease, visibility 0s, opacity 0.5s linear;
}

/* nav 안의 menu-bar요소 */
.menu-bar {
	width: 100%;
	height: 220px;
	border-top: 0px;
	border-right: 1px solid #ccc;
	display: flex;
}

.menu-bar-content {
	margin-left: 40px;
	width: 20%;
	display: inline-block;
	box-sizing: border-box;
}

.menu-bar-content ul li {
	padding: 10px;
}

.menu-bar-content ul li a {
	text-decoration: none;
	color: #444;
}

.menu-bar-content ul li a:hover {
	color: #aaa;
	transition: color 0.2s ease;
}

#menu-bar-content-sub {
	list-style: circle;
	font-size: 14px;
	padding-left: 20px;
}

#menu-bar-content-sub li {
	padding: 5px;
}

/* menu-bar요소 끝 */

/* aside, section */
.aside-section-container {
	width: 100%;
	display: flex;
	/* height: 100%; */
}

/* 좌측 메뉴바 */
aside {
	width: 20%;
	background: #5f5f5f;
	min-height: 800px;
}

#left-nav {
	height: 100%;
	background: #666;
	color: #fff;
	box-sizing: border-box;
	padding-top: 20px;
}

#left-nav ul li {
	padding-bottom: 60px;
	cursor: pointer;
	list-style: none;
}

#left-nav ul li:hover {
	color: #888;
	transition: color 0.2s ease;
}

#left-nav a {
	height: 100%;
	background: #666;
	color: #fff;
	box-sizing: border-box;
	padding-top: 20px;
}

#left-nav ul li a {
	text-decoration: none;
	padding-bottom: 60px;
	cursor: pointer;
	list-style: none;
}

#left-nav ul li a:hover {
	color: #888;
	transition: color 0.2s ease;
}

/* 섹션 창을 조작하기바람 */
section {
	/* border: 1px solid red; */
	display: flex;
	justify-content: center;
	width: 80%;
	/* overflow: auto; */
	background: #eee;
	z-index: 50;
	align-items: center;
	min-height: 800px;
	position: relative;
}

article .workList {
	width: 100%;
	display: flex;
	/* border: 1px solid green; */
	justify-content: space-around;
}

.workList p {
	width: 100%;
}

.workOrder {
	border: 1px solid orangered;
	width: 450px;
}

.workImg {
	border: 1px solid orangered;
	width: 100px;
	display: inline-block;
}

/* aside, section 끝*/
footer {
	width: 100%;
	background: #000;
	color: #fff;
	text-align: center;
	height: 7%;
	line-height: 70px;
}

/* 전체 div */
article {
	width: 100%;
}

.stock_status_page {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	/* border: 1px solid blue; */
	/* height: 800px; */
	/* margin-top: 20px; */
}

.searchArea {
	width: 96%;
	display: flex;
	justify-content: end;
}

/*  품목검색 */
.searchbox {
	width: 40%;
	border: 1px solid rgb(165, 165, 165);
	height: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 5px 0;
}

.glasses {
	height: 30px;
	margin-top: 5px;
	margin-left: 10px;
	margin-right: 5px;
	/* width: 26px; */
}

.search {
	/* border : 1px solid black !important;  */
	width: 80px;
	height: 30px;
	padding: 3px;
	margin-left: 5px;
	line-height: 30px;
}

.submit {
	padding: 2px;
}

.stock_status {
	/* position: relative;
            top: 120px; */
	/* left: 750px; */
	font-size: 30px;
	line-height: 100px;
}

.search_text {
	width: 100%;
	border: 1px solid black;
	background-color: #fff;
	height: 20px;
	/* margin : auto !important; */
}

/* 품목들 */
.table {
	display: flex;
	flex-direction: column;
}

.row {
	display: flex;
}

.table1 {
	background-color: #888888;
}

.cell {
	padding: 8px;
	border-right: 1px solid #ddd;
}

.cell:last-child {
	border-right: none;
}

/*  */
.row_f {
	display: flex;
	/* border : 1px solid green; */
	width: 780px;
	/* border-bottom: 2px solid #ddd; */
	/* 아래 테두리 스타일 지정 */
}

.row_f:first-child {
	border-top: 2px solid #ddd;
	background-color: #888888;
	/* 첫 번째 행의 위 테두리 스타일 지정 */
}

.row {
	display: flex;
	width: 780px;
	border-bottom: 2px solid #ddd;
}

.cell_f {
	width: 16.78%;
	/* flex: 1; */
	padding: 8px;
	text-align: center;
	border-right: 1px solid #ddd;
	/* 오른쪽 테두리 스타일 지정 */
}

/* .cell_f:last-child {
            border-right: none;
            마지막 셀에서 오른쪽 테두리 제거
        } */

/*  */
table input[type="text"] {
	border: none;
	text-align: center;
	background-color: #eee;
	height: 20px;
	padding: 3px;
	/* margin:auto; */
}

.table2 input {
	width: 90%;
}

td {
	border: 1px solid #ddd;
	text-align: center;
	line-height: 40px;
	height: 35px;
}

td input {
	margin-left: 5%;
}

/* 페이징 */
#pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 90%;
	/* border: 1px solid red; */
}

.pagination button {
	background-color: #333;
	color: #fff;
	border: none;
	cursor: pointer;
}

/* 페이징 번호 */
#page-numbers {
	/* text-align: center; */
	margin-right: 30px;
}

/* 이전, 다음버튼 */
#prevPage, #nextPage {
	background: #333;
	color: #fff;
	border: 0;
	border-radius: 10px;
	width: 50px;
	height: 30px;
	/* height: 50px; */
	cursor: pointer;
}

#page-numbers li {
	display: inline;
	margin-right: 5px;
}

#page-numbers li a {
	color: #fff;
	background-color: #555;
	margin-top: 10px;
	padding: 5px 8px;
	border-radius: 10px;
	cursor: pointer;
	color: #fff;
	border: 0;
	text-decoration: none;
}

#page-numbers li a:hover {
	background-color: black;
	transition: 0.2s;
}

.table {
	border-collapse: collapse;
	/* width: 100%; */
	/* padding: 1px; */
	width: 770px;
}

.table1 td, .table2 td {
	border: 1px solid #ddd;
	/* width: 165px; */
	text-align: left;
}

.table2_box {
	/* border: 1px solid red; */
	height: 500px;
	width: 780px;
}

/* .f_box {
            display: flex;
            width: 790px;
            justify-content: space-evenly;
            border: 1px solid blue;
        } */
.table2 {
	display: flex;
	width: 780px;
	/* margin : auto; */
	/* border: 1px solid blue; */
	justify-content: space-evenly;
}

.items {
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* .table th {
            background-color: #333;
            color: #fff;
        } */
.row_box {
	width: 100%;
	/* border: 1px solid red; */
}

.row td {
	/* border: 1px solid red; */
	height: 45px;
	width: 126px;
	text-align: center;
}

/* 팝업 */

/* infor : 디스플레이 none
        infor_box : 디스플레이 flex
        item_infor : "품목설명"
        item_img : 이미지가 들어갈 박스
        item_name : 재고 이름
        item_indx : 3가지 등급
        item_textarea : 재고 설명문
        commit > com : 확인 버튼 */
.infor_cpu1, .infor_cpu2, .infor_cpu3, .infor_main1, .infor_main2,
	.infor_main3, .infor_gpu1, .infor_gpu2, .infor_gpu3, .infor_ssd1,
	.infor_ssd2, .infor_ssd3 {
	display: none;
}

.com_cpu1, .com_cpu2, .com_cpu3, .com_main1, .com_main2, .com_main3,
	.com_gpu1, .com_gpu2, .com_gpu3, .com_ssd1, .com_ssd2, .com_ssd3 {
	background-color: #3498DB;
	margin-top: 10px;
	width: 80px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.com_cpu1:hover, .com_cpu2:hover, .com_cpu3:hover, .com_main1:hover,
	.com_main2:hover, .com_main3:hover, .com_gpu1:hover, .com_gpu2:hover,
	.com_gpu3:hover, .com_ssd1:hover, .com_ssd2:hover, .com_ssd3:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.infor_box {
	position: absolute;
	/* border: 1px solid red; */
	width: 40%;
	height: 50%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	top: 25%;
	left: 30%;
	background-color: rgb(214, 214, 214);
	z-index: 1001;
}

.item_img img {
	width: 200px;
	/* height: 50%; */
}

.admin, .worker {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.admin:hover, .worker:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.submit {
	width: 100%;
	/* border: 1px solid red; */
	display: flex;
	align-items: flex-end;
	justify-content: space-evenly;
}

/* 팝업 2 */
.add_items_infor {
	display: none;
	position: absolute;
	/* border: 1px solid red; */
	width: 60%;
	height: 90%;
	/* display: flex; */
	/* flex-direction: column; */
	/* align-items: center; */
	/* justify-content: center; */
	top: 0%;
	left: 20%;
	background-color: rgb(214, 214, 214);
	z-index: 1001;
}

.add_items_infor_box {
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	justify-content: space-evenly;
	width: 100%;
	height: 100%;
}

.items_infor {
	font-size: 30px;
	/* border: 1px solid red; */
}

.items_img_box {
	height: 30%;
	width: 70%;
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
}

.items_img {
	height: 80%;
	width: 40%;
	border: 1px solid black;
}

.items_img_choice {
	width: 20%;
	height: 15%;
	/* border: 1px solid red; */
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	/* width: 80px; */
	/* height: 40px; */
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.items_name_box, .items_index_box, .good_items_loc,
	.good_items_count_box, .bad_items_loc, .bad_items_count_box {
	/* border: 1px solid black; */
	width: 90%;
	display: flex;
	justify-content: space-around;
}

.errorMessage {
	line-height: 50px;
	text-align: center;
	width: 70%;
	height: 7%;
	color: red;
}

.items_area_box {
	display: flex;
	justify-content: space-around;
	/* border: 1px solid blue; */
	width: 90%;
	height: 25%;
}

.items_name1, .items_index1, .gil1, .gic1, .bil1, .bic1 {
	width: 30%;
	text-align: center;
	/* border: 1px solid green; */
}

.items_area1 {
	text-align: center;
	/* border: 1px solid green; */
	width: 30%;
	height: 20%;
}

.items_name2, .items_index2, .items_area2, .gil2, .gic2, .bil2, .bic2 {
	/* border: 1px solid red; */
	width: 60%;
}

.items_area2 {
	/* border: 1px solid red; */
	/* width: 60%; */
	
}

.items_name2 input, .items_index2 input, .gil2 input, .gic2 input, .bil2 input,
	.bic2 input {
	font-size: 20px;
	width: 98%;
	text-align: center;
	/* border: 1px solid red; */
}

.add_items_area {
	width: 98%;
	height: 90%;
	resize: none;
}

.add_buttons {
	/* border: 1px solid red; */
	width: 90%;
	display: flex;
	justify-content: space-around;
}

.add_commit {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	text-align: center;
	line-height: 35px;
}

.add_commit:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.add_cancel {
	background-color: red;
	line-height: 35px;
	/* width: 40px; */
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	/* font-size: 10px; */
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	/* line-height: 20px; */
	/* height : 100%; */
	/* border : 1px solid red; */
}

.add_cancel:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

/* 팝업 3 */
.infor_item_box {
	display: none;
	position: absolute;
	width: 40%;
	height: 50%;
	top: 25%;
	left: 30%;
	background-color: rgb(214, 214, 214);
	z-index: 1001;
}

.infor_item {
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	justify-content: space-evenly;
	width: 100%;
	height: 100%;
}

.infor_item_explan {
	font-size: 30px;
}

.add_item_c {
	width: 98%;
	text-align: center;
}

.infor_item_img {
	/* border: 1px solid red; */
	height: 30%;
	width: 40%;
	display: flex;
	justify-content: center;
	align-items: center;
}

/*         
        .infor_item_img img {
            border: 1px solid red;
            width: 200px;
        } */
.infor_item_name {
	/* border: 1px solid red; */
	width: 50%;
	text-align: center;
	height: 5%;
}

.infor_item_ta {
	/* border: 1px solid red; */
	
}

.infor_com {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	text-align: center;
	line-height: 35px;
}

.infor_com:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* 수정버튼 팝업 4 */
.record_items_infor_a {
	display: none;
	position: absolute;
	/* border: 1px solid red; */
	width: 60%;
	height: 70%;
	/* display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; */
	top: 15%;
	left: 20%;
	background-color: rgb(214, 214, 214);
	z-index: 1001;
}

.record_items_infor_box {
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	/* justify-content: center; */
	align-items: center;
	justify-content: space-evenly;
	width: 100%;
	height: 100%;
}

.record_items_infor {
	font-size: 30px;
	/* border: 1px solid red; */
}

.record_items_img_box {
	height: 30%;
	width: 70%;
	/* border: 1px solid red; */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
}

.record_items_img {
	height: 80%;
	width: 40%;
	border: 1px solid black;
}

.record_items_img_choice {
	width: 20%;
	height: 15%;
	/* border: 1px solid red; */
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	/* width: 80px; */
	/* height: 40px; */
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.record_items_name_box, .record_items_index_box, .record_good_items_loc,
	.record_good_items_count_box, .record_bad_items_loc,
	.record_bad_items_count_box {
	/* border: 1px solid black; */
	width: 90%;
	display: flex;
	justify-content: space-around;
}

.record_items_area_box {
	display: flex;
	justify-content: space-around;
	/* border: 1px solid blue; */
	width: 90%;
	height: 25%;
}

.record_items_name1, .record_items_index1, .record_gil1, .record_gic1,
	.record_bil1, .record_bic1 {
	width: 30%;
	text-align: center;
	/* border: 1px solid green; */
}

.record_items_area1 {
	text-align: center;
	/* border: 1px solid green; */
	width: 30%;
	height: 20%;
}

.record_items_name2, .record_items_index2, .record_items_area2,
	.record_gil2, .record_gic2, .record_bil2, .record_bic2 {
	/* border: 1px solid red; */
	width: 60%;
}

.record_items_area2 {
	/* border: 1px solid red; */
	/* width: 60%; */
	
}

.record_items_name2 input, .record_items_index2 input, .record_gil2 input,
	.record_gic2 input, .record_bil2 input, .record_bic2 input {
	font-size: 20px;
	width: 98%;
	text-align: center;
	/* border: 1px solid red; */
}

.record_items_area {
	width: 98%;
	height: 90%;
	resize: none;
}

.record_buttons {
	/* border: 1px solid red; */
	width: 90%;
	display: flex;
	justify-content: space-around;
}

.record_commit {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	text-align: center;
	line-height: 35px;
}

.record_commit:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.record_cancel {
	background-color: red;
	line-height: 35px;
	/* width: 40px; */
	margin-top: 10px;
	margin-bottom: 10px;
	width: 20%;
	height: 55%;
	/* font-size: 10px; */
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	/* line-height: 20px; */
	/* height : 100%; */
	/* border : 1px solid red; */
}

.record_cancel:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

/* 팝업 4 여기까지 */

/* 삭제 버튼 */
.delete_box {
	text-align: center;
	/* border : 1px solid red; */
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.delete {
	width: 35%;
	background-color: red;
	/* width: 40px; */
	height: 50%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	line-height: 25px;
	/* height : 100%; */
	/* border : 1px solid red; */
}

.delete:hover {
	background-color: rgb(163, 6, 6);
	transition: 0.2s;
}

.record {
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 35%;
	height: 50%;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
	/* text-align: center; */
	line-height: 25px;
}

.record:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

.tr :nth-child(6) {
	/* border : 1px solid red; */
	/* width : 100px; */
	/* margin-top: 1000px; */
	
}

.add_items_box {
	/* border : 1px solid red; */
	width: 95%;
	display: flex;
	flex-direction: row-reverse;
	padding: 10px;
}

.add_items {
	/* border : 1px solid red; */
	width: 10%;
	text-align: center;
	background-color: #3498DB;
	margin-top: 10px;
	margin-bottom: 10px;
	/* width: 80px; */
	height: 30px;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
	color: #fff;
	border: 0;
}

.add_items:hover {
	background-color: rgb(0, 47, 255);
	transition: 0.2s;
}

/* Modal 모달 */
.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: flex;
	justify-content: center;
	align-items: center;
}

@media screen and (max-width: 430px) {
	.wrap {
		width: 100%;
	}
	#workerTitle {
		display: none;
	}
	header {
		width: 100%;
		background: #000;
		color: #fff;
		text-align: center;
		padding: 5px;
		box-sizing: border-box;
		border-radius: 0px;
	}

	/* 미디어 쿼리 헤더 영역 수정 코드 */
	header ul {
		display: none;
	}
	.header-content {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		position: relative;
	}
	#headerTitle {
		display: block !important;
		text-align: center;
		color: #fff;
		width: 100%;
		font-size: 20px;
	}
	#headerTitle a {
		text-decoration: none;
		color: #fff;
	}
	.hamburger-menu {
		position: absolute;
		left: 0;
		top: 0;
		display: flex;
	}
	nav {
		width: 100%;
		position: absolute;
		top: 100%;
		/* header 높이에 맞게 조정 */
		left: 0;
		right: 0;
		background: #dde;
		overflow: hidden;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
		transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
			linear;
		transform: translateX(0%);
		visibility: hidden;
		z-index: 100;
		/* opacity: 0; */
	}
	nav.active {
		min-height: 800px;
		max-height: none;
		width: 200px;
		visibility: visible;
		opacity: 1;
		transition: max-height 0.5s ease, visibility 0s 0.5s, opacity 0.5s
			linear;
		transform: translateX(0%);
	}

	/* 왼쪽에서 오른쪽으로 나오는 애니메이션을 추가합니다. */
	nav {
		transform: translateX(-100%);
		transition: transform 0.5s ease;
	}
	nav.active {
		transform: translateX(0%);
		transition: transform 0.5s ease;
	}
	nav.closing {
		transform: translateX(-100%);
		transition: transform 0.5s ease;
	}
	nav .menu-bar {
		width: 100%;
		height: 100%;
		border-top: 0px;
		border-right: 1px solid #ccc;
		display: flex;
		flex-direction: column;
	}
	.menu-bar-content {
		width: 100%;
		margin-left: 0px;
	}
	.menu-bar-content ul li {
		padding: 10px;
	}
	aside {
		display: none;
	}
	section {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.items {
		box-sizing: border-box;
		width: 400px;
	}
	.row_f {
		box-sizing: border-box;
		font-size: 10px;
		display: flex;
		width: 95%;
	}
	.row {
		box-sizing: border-box;
		display: flex;
		width: 380px;
		border-bottom: 2px solid #ddd;
	}
	.cell_f {
		width: none;
		/* flex: 1; */
		padding: 8px;
		text-align: center;
		border-right: 1px solid #ddd;
		/* 오른쪽 테두리 스타일 지정 */
	}
	.table1 td, .table2 td {
		border: 1px solid #ccc;
		width: none;
		text-align: left;
	}
	.table2_box {
		/* border: 1px solid red; */
		height: 500px;
		width: 94%;
	}
	.f_box {
		display: flex;
		width: 100%;
		justify-content: space-evenly;
		/* border: 1px solid blue; */
	}
	.table2 input {
		width: 90%;
		font-size: 11px;
	}
	td input {
		margin-left: 1%;
	}
	.table2 {
		display: flex;
		width: 100%;
		justify-content: space-evenly;
	}
	.searchArea {
		justify-content: center;
	}
	.searchbox {
		font-size: 15px;
		width: 80%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 5px;
		margin-left: 0;
	}
	.infor_box {
		position: absolute;
		/* border: 1px solid red; */
		width: 60%;
		height: 50%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		top: 25%;
		left: 20%;
		background-color: rgb(214, 214, 214);
		z-index: 1001;
	}
	.workerPic {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	.delete_box {
		/* border: 1px solid red; */
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.record {
		width: 60%;
		height: 40%;
		background-color: #3498DB;
		font-size: 10px;
		border-radius: 5px;
		text-align: center;
		cursor: pointer;
		color: #fff;
		border: 0;
		margin-top: 0px;
		margin-bottom: 0px;
		line-height: 20px;
	}
	.record:hover {
		background-color: rgb(0, 47, 255);
		transition: 0.2s;
	}
	.delete {
		width: 60%;
		height: 40%;
		background-color: red;
		font-size: 10px;
		border-radius: 5px;
		text-align: center;
		cursor: pointer;
		color: #fff;
		border: 0;
		line-height: 20px;
	}
	.delete:hover {
		background-color: rgb(163, 6, 6);
		transition: 0.2s;
	}
	.add_items_box {
		/* border: 1px solid red; */
		display: flex;
		width: 90%;
	}
	.add_items {
		font-size: 12px;
		width: 20%;
	}
	.stock_status_page {
		/* border: 1px solid red; */
		width: 390px;
	}
	.row td {
		/* border: 1px solid red; */
		height: 45px;
		width: 16.67%;
	}
	.row_f {
		/* border: 1px solid red; */
		width: 93.5%;
	}
	.row {
		width: 100%
	}
	.row_box {
		display: flex;
		align-items: center;
		flex-direction: column;
	}

	/* 팝업 */
	.add_items_infor, .record_items_infor_a {
		position: absolute;
		/* border: 1px solid red; */
		/* width: 60%; */
		/* height: 70%; */
		/* display: flex; */
		/* flex-direction: column; */
		/* align-items: center; */
		/* justify-content: center; */
		top: 5%;
		left: 4%;
		background-color: rgb(214, 214, 214);
		z-index: 1001;
		width: 85%;
	}
	.add_items_infor_box, .record_items_infor_box {
		width: 100%;
	}
	.items_img_choice, .record_items_img_choice {
		width: 30%;
		line-height: 25px;
	}
}
</style>

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
				<!-- aside 영역내에 메뉴 추가 가능함 -->

				<div id="left-nav">
					<ul>
						<li><a href="stock_status.html">재고 현황</a></li>
						<li><a href="Stock_Request.html">재고 신청</a></li>
						<li><a href="Finished_product_management.html">완제품 관리</a></li>
						<li><a href="Report_of_defective_inventory.html">재고 불량 신고</a>
						</li>
					</ul>
				</div>

			</aside>
			<section>
				<article>
					<form method="get" action="ot">
						<div class="stock_status_page">
							<!-- 재고현황 등 검색텍스트 -->
							<div class="stock_status">재고현황</div>
							<div class="searchArea">
								<div class="searchbox">
									<div class="search">품목검색</div>
									<div>
										<input type="text" name="name" class="search_text" value="">
									</div>
									<div>
										<input type="submit" class="glasses" value="검색">
										<!-- 	<img class="glasses"
											src="https://media.discordapp.net/attachments/1186454147558551552/1201320591920218232/2866321.png?ex=65c963fc&is=65b6eefc&hm=f58ed04bf70d9aa052a073134c27106ecce4726dd07fb3124e0ba9b81fddcadd&=&format=webp&quality=lossless&width=468&height=468">
											 -->
									</div>
								</div>
							</div>
					</form>
					<!--  -->
					<div class="add_items_box">
						<div class="add_items">품목 추가</div>
					</div>
					<!-- 품목들 -->
					<div class="items">
						<!-- <div class="f_box"> -->
						<div class="row_f">
							<div class="cell_f">품목</div>
							<div class="cell_f">양품수량</div>
							<div class="cell_f">양품재고위치</div>
							<div class="cell_f">불량수량</div>
							<div class="cell_f">불량재고위치</div>
							<div class="cell_f"></div>
						</div>
						<!-- </div> -->
						<div class="table2_box">
							<table class="table2">
								<tbody class="row_box">
									<%
									List list = (List) request.getAttribute("list2");

																for (int i = 0; i < list.size(); i++) {

																	BoardDTO dto = (BoardDTO) list.get(i);
									%>
									<tr class="row">
										<td class="add_item_c"><%=dto.get품목()%></td>
										<td class="gic3_c"><%=dto.get양품수량()%></td>
										<td class="gil3_l"><%=dto.get양품재고위치()%></td>
										<td class="bic3_c"><%=dto.get불량수량()%></td>
										<td class="bil3_l"><%=dto.get불량재고위치()%></td>
										<td class="getIndex" style="display: none"><%=dto.get물품설명1()%></td>
										<td class="getArea" style="display: none"><%=dto.get물품설명2()%></td>
										<td>
											<div class="delete_box">
												<div class="record" data-mesid="<%=dto.getMesid()%>">수정</div>
												<!-- 삭제 클릭시 a태그로 주소는 od, 전달인자로 ?mesid = 1 -->

												<div class="delete">
													<a href="/mes_project3/od?mesid=<%=dto.getMesid()%>">삭제</a>
												</div>
											</div>
										</td>
									</tr>
									<%
									}
									%>

								</tbody>
							</table>
						</div>
					</div>
					<div class="submit">
						<button type="button" class="admin">관리자</button>
						<button type="button" class="worker">작업자</button>
					</div>
		</div>

		<div class="modal-overlay" id="modal-overlay" style="display: none;"></div>
		<div class="infor_cpu1">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">CPU 1</div>
				<div class="item_index" style="text-align: center;">
					<br> 퍼포먼스 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_cpu1" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_cpu2">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">CPU 2</div>
				<div class="item_index" style="text-align: center;">
					<br> 메인스트림 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_cpu2" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_cpu3">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">CPU 3</div>
				<div class="item_index" style="text-align: center;">
					<br> 엔트리 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_cpu3" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<!-- 메인보드(main) -->

		<div class="infor_main1">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715419274215504/KakaoTalk_20240130_103821101.png?ex=65d21a57&is=65bfa557&hm=b93df409dd187db39658aabf1798314afc327ed99e15eeac2d7ab3627756f020&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">MAIN 1</div>
				<div class="item_index" style="text-align: center;">
					<br> 퍼포먼스 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_main1" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_main2">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715419811217428/KakaoTalk_20240130_103821101_01.png?ex=65d21a58&is=65bfa558&hm=bdf0e2cd1c64dd22077daeef88fe7340c7751a882888b9999685f997460014d4&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">MAIN 2</div>
				<div class="item_index" style="text-align: center;">
					<br> 메인스트림 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_main2" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_main3">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715420264075274/KakaoTalk_20240130_103821101_02.png?ex=65d21a58&is=65bfa558&hm=6c39ce3f3b54ab938b4c1584f5ce41d5b4ddda00185e0636fd1cf3a90dac31b6&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">MAIN 3</div>
				<div class="item_index" style="text-align: center;">
					<br> 엔트리 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_main3" style="width: 50px;">확인
				</div>
			</div>
		</div>


		<!-- 그래픽카드(gpu) -->

		<div class="infor_gpu1">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715472621576242/KakaoTalk_20240130_140103929_01.png?ex=65d21a64&is=65bfa564&hm=180fa2cd659f749c70064ebe4ecaa1f7d875c6360ce62ba6d19bee80c0234e1d&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">GPU 1</div>
				<div class="item_index" style="text-align: center;">
					<br> 퍼포먼스 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_gpu1" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_gpu2">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715473024483450/KakaoTalk_20240130_140103929_02.png?ex=65d21a64&is=65bfa564&hm=d4d4dd12149d13e58a6d429283a13dd78a5570e19961670e1135834fcd357144&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">GPU 2</div>
				<div class="item_index" style="text-align: center;">
					<br> 메인스트림 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_gpu2" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_gpu3">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1203715473452310578/KakaoTalk_20240130_140103929.png?ex=65d21a64&is=65bfa564&hm=355b71c57e83b162c1648233f6e148eeb3741b294c1638c4af28f62d164ddf4d&=&format=webp&quality=lossless&width=368&height=368">
				</div>
				<div class="item_name">GPU 3</div>
				<div class="item_index" style="text-align: center;">
					<br> 엔트리 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_gpu3" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<!-- SSD(ssd) -->


		<div class="infor_ssd1">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">SSD 1</div>
				<div class="item_index" style="text-align: center;">
					<br> 퍼포먼스 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_ssd1" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_ssd2">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">SSD 2</div>
				<div class="item_index" style="text-align: center;">
					<br> 메인스트림 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_ssd2" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<div class="infor_ssd3">
			<div class="infor_box">
				<div class="item_infor">품목 설명</div>
				<div class="item_img">
					<img
						src="https://media.discordapp.net/attachments/1186454147558551552/1201687978230173706/image.png?ex=65caba24&is=65b84524&hm=bd86b0025fb9ddc7b872d912c5a5b8ae55dd00d9e73964fbefffcfa4f54f77d7&=&format=webp&quality=lossless&width=468&height=468">
				</div>
				<div class="item_name">SSD 3</div>
				<div class="item_index" style="text-align: center;">
					<br> 엔트리 <br>
				</div>
				<div class="item_textarea">
					<textarea class="item_ta"></textarea>
				</div>
				<div class="commit">
					<button type="button" class="com_ssd3" style="width: 50px;">확인
				</div>
			</div>
		</div>

		<!--  -->

		<!-- 품목추가 팝업 -->
		<!-- <div class="modal-overlay" id="modal-overlay" style="display: none;"></div> -->
		<form method="get" class="oi" action="oi">
			<div class="add_items_infor">
				<div class="add_items_infor_box">
					<div class="items_infor">추가 물품 설명</div>
					<div class="items_img_box">
						<div class="items_img">
							<img class="items_imglink" src="#">
						</div>
						<div class="items_img_choice">사진선택</div>
					</div>
					<div class="items_name_box">
						<div class="items_name1">물품 이름</div>
						<div class="items_name2">
							<input type="text" name="itemName" class="add_items_name">
						</div>
					</div>
					<div class="items_index_box">
						<div class="items_index1">물품 설명1</div>
						<div class="items_index2">
							<input type="text" name="itemIndex1" class="add_items_index">
						</div>
					</div>
					<div class="items_area_box">
						<div class="items_area1">물품 설명2</div>
						<div class="items_area2">
							<textarea class="add_items_area" name="itemIndex2"></textarea>
						</div>
					</div>
					<div class="good_items_loc">
						<div class="gil1">양품재고위치</div>
						<div class="gil2">
							<input type="text" name="itemGLoc" class="gil3">
						</div>
					</div>
					<div class="good_items_count_box">
						<div class="gic1">양품 수량</div>
						<div class="gic2">
							<input type="number" name="itemGNumber" class="gic3">
						</div>
					</div>
					<div class="bad_items_loc">
						<div class="bil1">불량재고위치</div>
						<div class="bil2">
							<input type="text" name="itemBLoc" class="bil3">
						</div>
					</div>
					<div class="bad_items_count_box">
						<div class="bic1">불량 수량</div>
						<div class="bic2">
							<input type="number" name="itemBNumber" class="bic3">
						</div>
					</div>
					<div class="errorMessage" name="errorMessage"></div>
					<div class="add_buttons">
						<input type="submit" class="add_commit" value="추가">
						<!-- 	<div class="add_commit">추가</div> -->
						<div class="add_cancel">취소</div>
					</div>
				</div>
			</div>

		</form>
		<!-- 추가된 품목 이름 클릭 팝업 -->
		<!-- <div class="modal-overlay" id="modal-overlay" style="display: none;"></div> -->
		<div class="infor_item_box">
			<div class="infor_item">
				<div class="infor_item_explan">품목 설명</div>
				<div class="infor_item_img">
					<img src="#">
				</div>
				<div class="infor_item_name"></div>
				<div class="infor_item_index" style="text-align: center;"></div>
				<div class="infor_item_textarea">
					<textarea class="infor_item_ta" readonly></textarea>
				</div>
				<div class="infor_commit">
					<button type="button" class="infor_com" style="width: 50px;">확인
				</div>
			</div>
		</div>


		<!-- 품목 수정 팝업 -->
		<form method="get" action="ou">
			<div class="record_items_infor_a">
				<div class="record_items_infor_box">
					<div class="record_items_infor">물품 설명 수정</div>
					<div class="record_items_img_box">
						<div class="record_items_img">
							<img class="record_items_imglink" src="#">
						</div>
						<div class="record_items_img_choice">사진선택</div>
					</div>
					<div class="record_items_name_box">
						<div class="record_items_name1">물품 이름</div>
						<div class="record_items_name2">
							<input type="text" name="record_name" class="record_items_name">
						</div>
					</div>
					<div class="record_items_index_box">
						<div class="record_items_index1">물품 설명1</div>
						<div class="record_items_index2">
							<input type="text" name="itemIndex1" class="record_items_index">
						</div>
					</div>
					<div class="record_items_area_box">
						<div class="record_items_area1">물품 설명2</div>
						<div class="record_items_area2">
							<textarea name="itemIndex2" class="record_items_area"></textarea>
						</div>
					</div>
					<div class="record_good_items_loc">
						<div class="record_gil1">양품재고위치</div>
						<div class="record_gil2">
							<input type="text" name="itemGLoc" class="record_gil3">
						</div>
					</div>
					<div class="record_good_items_count_box">
						<div class="record_gic1">양품 수량</div>
						<div class="record_gic2">
							<input type="number" name="itemGNumber" class="record_gic3">
						</div>
					</div>
					<div class="record_bad_items_loc">
						<div class="record_bil1">불량재고위치</div>
						<div class="record_bil2">
							<input type="text" name="itemBLoc" class="record_bil3">
						</div>
					</div>
					<div class="record_bad_items_count_box">
						<div class="record_bic1">불량 수량</div>
						<div class="record_bic2">
							<input type="number" name="itemBNumber" class="record_bic3">
						</div>
					</div>
					<div class="record_buttons">

						<input type="hidden" name="mesid" class="mesid" value="">
						<button type="submit" class="record_commit">수정</button>
						<!-- <div class="record_commit">수정</div> -->
						<div class="record_cancel">취소</div>
					</div>
				</div>
			</div>
		</form>
		</article>
		</section>
	</div>
	<footer>ⓒ2024 J.company System</footer>
	</div>

	<script>

        // 작업자 관리자버튼 클릭시 이벤트
        document.querySelector(".admin").addEventListener("click", function () {
            document.querySelector("#adminTitle").style.display = "block"
            document.querySelector("#adminNav").style.display = "block"
            document.querySelector("#mainTitle2").style.display = "block"
            document.querySelector("#mainTitle1").style.display = "none"
            document.querySelector(".workerGrade").innerHTML = "관리자<br>";
        })
        document.querySelector(".worker").addEventListener("click", function () {
            document.querySelector("#adminTitle").style.display = "none"
            document.querySelector("#adminNav").style.display = "none"
            document.querySelector("#mainTitle2").style.display = "none"
            document.querySelector("#mainTitle1").style.display = "block"
            document.querySelector(".workerGrade").innerHTML = "작업자<br>";
        })

        // 삭제버튼 클릭 이벤트
        document.querySelectorAll(".delete").forEach(function (event) {
            event.addEventListener("click", function (e) {
                let row = e.target.closest(".row");
                row.remove();
            })
        })

        // 물품 추가 클릭 이벤트
        document.querySelector(".add_items").addEventListener('click', function () {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "flex";
            let infor = document.querySelector(".add_items_infor");
            infor.style.display = "block";
            add_items_name.value = "";
            add_items_index.value = "";
            add_items_area.value = "";
            gil3.value = "";
            gic3.value = "";
            bil3.value = "";
            bic3.value = "";
        });
        
        
        // 재고현황 수정
        a = document.querySelectorAll(".record")
        for(let i=0; i<a.length; i++){
        	a[i].addEventListener("click", function (event) {
            	document.querySelector(".record_items_infor_a").style.display = "block";
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "flex";
                let tr = this.parentNode.parentNode.parentNode
                let add_item_c = tr.querySelector(".add_item_c");
                let gic3_c = tr.querySelector(".gic3_c");
                let gil3_l = tr.querySelector(".gil3_l");
                let bic3_c = tr.querySelector(".bic3_c");
                let bil3_l = tr.querySelector(".bil3_l");
                let getIndex = tr.querySelector(".getIndex");
                let getArea = tr.querySelector(".getArea");
                
                let mesid = this.getAttribute("data-mesid");
                		console.log(mesid);
                
                document.querySelector(".mesid").value = mesid;
                document.querySelector(".record_items_name").value = add_item_c.innerText;
                document.querySelector(".record_items_index").value = getIndex.innerHTML;
                document.querySelector(".record_items_area").value = getArea.innerHTML;
                document.querySelector(".record_gil3").value = gil3_l.innerText;
                document.querySelector(".record_gic3").value = gic3_c.innerText;
                document.querySelector(".record_bil3").value = bil3_l.innerText;
                document.querySelector(".record_bic3").value = bic3_c.innerText;

            })
       }
        
  
       // 품목이름 클릭시 팝업
       b = document.querySelectorAll(".add_item_c")
               for(let i=0; i<a.length; i++){
        	b[i].addEventListener("click", function (event) {
            	document.querySelector(".infor_item_box").style.display = "block";
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "flex";
            
                let tr = this.parentNode
                let add_item_c = tr.querySelector(".add_item_c");
                let getIndex = tr.querySelector(".getIndex");
                let getArea = tr.querySelector(".getArea");
                
                		console.log(add_item_c);
                		console.log(getIndex);
                		console.log(getArea);
                
                document.querySelector(".infor_item_name").innerHTML = add_item_c.innerHTML;
                document.querySelector(".infor_item_index").innerHTML = getIndex.innerHTML;
                document.querySelector(".infor_item_ta").value = getArea.innerHTML;
            })
       }
       
       document.querySelector(".infor_com").addEventListener("click", function () {
           document.querySelector(".infor_item_box").style.display = "none";
           let modal_overlay = document.querySelector(".modal-overlay");
           modal_overlay.style.display = "none";
       });
        
        // 물품 설명 수정 취소버튼
        document.querySelector(".record_cancel").addEventListener("click", function () {
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "none";
                document.querySelector(".record_items_infor_a").style.display = "none";
        })
        
        
        document.querySelector(".record_commit").addEventListener("click", function (event) {
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "none";
                document.querySelector(".record_items_infor_a").style.display = "none";
        })

        // 물품 추가 취소 클릭이벤트
        document.querySelector(".add_cancel").addEventListener('click', function () {
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "none";
            let infor = document.querySelector(".add_items_infor");
            infor.style.display = "none";

            let add_items_name = document.querySelector(".add_items_name");
            add_items_name.value = "";
            let add_items_index = document.querySelector(".add_items_index");
            add_items_index.value = "";
            let add_items_area = document.querySelector(".add_items_area");
            add_items_area.value = "";
            let gil3 = document.querySelector(".gil3");
            gil3.value = "";
            let gic3 = document.querySelector(".gic3");
            gic3.value = "";
            let bil3 = document.querySelector(".bil3");
            bil3.value = "";
            let bic3 = document.querySelector(".bic3");
            bic3.value = "";
			let errorMessage = document.querySelector(".errorMessage");
				errorMessage.innerText = "";
        });

        lastbtn = 0;
        document.querySelector(".add_commit").addEventListener("click", function (event) {
        	event.preventDefault()
            let add_items_name = document.querySelector(".add_items_name");
            let add_items_index = document.querySelector(".add_items_index");
            let add_items_area = document.querySelector(".add_items_area");
            let gil3 = document.querySelector(".gil3");
            let gic3 = document.querySelector(".gic3");
            let bil3 = document.querySelector(".bil3");
            let bic3 = document.querySelector(".bic3");
            let items_imglink = document.querySelector(".items_imglink");
			let errorMessage = document.querySelector(".errorMessage");


            // add_commit클릭과 동시에 적은 내용 삭제

            
            console.log(add_items_name.value);
			if(add_items_name.value.trim() === ''){	
           		console.log("물품이름 입력안됨");
				errorMessage.innerText = "※물품 이름을 입력하세요";
			}else 
				if(gil3.value.trim() === '') {
				console.log("양품재고위치 입력안됨");
				errorMessage.innerText = "※양품재고위치를 입력하세요";	
			}else if(gic3.value.trim() === '') {
				console.log("양품수량 입력안됨");
				errorMessage.innerText = "※양품수량을 입력하세요";	
			}else if(bil3.value.trim() === '') {
				console.log("불량재고위치 입력안됨");
				errorMessage.innerText = "※불량재고위치를 입력하세요";	
			}else if(bic3.value.trim() === '') {
				console.log("불량수량 입력안됨");
				errorMessage.innerText = "※불량수량을 입력하세요";	
			}else{
            let modal_overlay = document.querySelector(".modal-overlay");
            modal_overlay.style.display = "none";
            let infor = document.querySelector(".add_items_infor");
            infor.style.display = "none";
            document.querySelector(".oi").submit();
			}

            newRow.querySelector(".record").addEventListener("click", function (event) {
                document.querySelector(".record_items_infor_a").style.display = "block";
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "flex";
                lastbtn = this;
                let data_name = event.target.closest('.row').querySelector('td').getAttribute('data-name');
                let data_index = event.target.closest('.row').querySelector('td').getAttribute('data-index');
                let data_area = event.target.closest('.row').querySelector('td').getAttribute('data-area');
                let data_gil = event.target.closest('.row').querySelector('td').getAttribute('data-gil');
                let data_gic = event.target.closest('.row').querySelector('td').getAttribute('data-gic');
                let data_bil = event.target.closest('.row').querySelector('td').getAttribute('data-bil');
                let data_bic = event.target.closest('.row').querySelector('td').getAttribute('data-bic');
                // let data_link = event.target.closest('.row').querySelector('td').getAttribute('data-link');
                console.log(data_name);
                document.querySelector(".record_items_name").value = data_name;
                document.querySelector(".record_items_index").value = data_index;
                document.querySelector(".record_items_area").value = data_area;
                document.querySelector(".record_gil3").value = data_gil;
                document.querySelector(".record_gic3").value = data_gic;
                document.querySelector(".record_bil3").value = data_bil;
                document.querySelector(".record_bic3").value = data_bic;
            });


            document.querySelector(".record_commit").addEventListener("click", function (event) {
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "none";
                document.querySelector(".record_items_infor_a").style.display = "none";

                let record_items_name = document.querySelector(".record_items_name").value;
                let record_items_index = document.querySelector(".record_items_index").value;
                let record_items_area = document.querySelector(".record_items_area").value;
                let record_gil3 = document.querySelector(".record_gil3").value;
                let record_gic3 = document.querySelector(".record_gic3").value;
                let record_bil3 = document.querySelector(".record_bil3").value;
                let record_bic3 = document.querySelector(".record_bic3").value;
                // console.log(record_items_name);

                lastbtn.closest('.row').querySelector('td').setAttribute('data-name', record_items_name);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-index', record_items_index);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-area', record_items_area);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-gil', record_gil3);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-gic', record_gic3);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-bil', record_bil3);
                lastbtn.closest('.row').querySelector('td').setAttribute('data-bic', record_bic3);

                let data_name = lastbtn.closest('.row').querySelector('td').getAttribute('data-name');
                let data_gic = lastbtn.closest('.row').querySelector('td').getAttribute('data-gic');
                let data_gil = lastbtn.closest('.row').querySelector('td').getAttribute('data-gil');
                let data_bic = lastbtn.closest('.row').querySelector('td').getAttribute('data-bic');
                let data_bil = lastbtn.closest('.row').querySelector('td').getAttribute('data-bil');
                // lastbtn.('.row').querySelector('td').getAttribute('data-name')
                console.log(data_name);
                newRow.querySelector(".add_item_c").value = data_name;
                newRow.querySelector(".gic3_c").value = data_gic;
                newRow.querySelector(".gil3_l").value = data_gil;
                newRow.querySelector(".bic3_c").value = data_bic;
                newRow.querySelector(".bil3_l").value = data_bil;

            });




            // 단순히 팝업을 보이지 않게 하는 코드, 여기 적지 않아도 됨
            document.querySelector(".infor_com").addEventListener("click", function () {
                document.querySelector(".infor_item_box").style.display = "none";
                let modal_overlay = document.querySelector(".modal-overlay");
                modal_overlay.style.display = "none";
            });

            // 수정 팝업을 보이지 않게 하는 코드, 여기 적지 않아도 됨



            // 만들어진 테이블 delete 클릭시 삭제
            newRow.querySelector('.delete').addEventListener("click", function () {
                newRow.remove();
            });
        });

        const hover = document.querySelectorAll('a.hover');
        const menuBar = document.querySelector('.menu-bar');
        const nav = document.querySelector('nav');
        const wrap = document.querySelector('.wrap');

        // 모바일 스크립트 코드
        const hamburgerMenu = document.querySelector('.hamburger-menu');
        const myPage = document.querySelector('#myPage');

        hamburgerMenu.addEventListener('click', function () {
            nav.classList.toggle('active');

            if (nav.classList.contains('active')) {
                nav.prepend(myPage);
                myPage.style.display = 'flex';
                myPage.style.padding = '5px 0';
                myPage.style.backgroundColor = '#dde';

                let sectionHeight = section.offsetHeight;
                nav.style.height = `${sectionHeight}px`;
            } else {
                workerTitle.appendChild(myPage);
                myPage.style.display = '';
                nav.style.height = '';
            }
        });

        const section = document.querySelector('section');

        hover.forEach(link => {
            link.addEventListener("click", function (event) {
                event.preventDefault();
                if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
                    nav.style.height = `${section.offsetHeight}px`
                }
            });
        });

        // if() {
        // document.querySelector("#mainTitle1").style.display = "block";
        // } else {
        document.querySelector("#mainTitle2").style.display = "block";
        // }

        let isHovered = false;

        hover.forEach(button => {
            button.addEventListener('mouseover', () => {
                showMenuBar();
                isHovered = true;
            });
        });

        wrap.addEventListener("mouseleave", function () {
            if (!isHovered) {
                hideMenuBar();
            }
        });

        menuBar.addEventListener("mouseenter", function () {
            isHovered = true;
        });

        menuBar.addEventListener("mouseleave", function () {
            hideMenuBar();
        });

        section.addEventListener("click", function () {
            hideMenuBar();
        })

        function showMenuBar() {
            nav.classList.add('active');
        }

        function hideMenuBar() {
            nav.classList.remove('active');
        }

        hover.forEach(link => {
            link.addEventListener("click", function (event) {
                let myPage = document.querySelector("#myPage");
                // let myPageName = document.querySelector("#workerName");
                // let myPageLogo = document.querySelector("#myPageLogo");
                let menuBar = document.querySelector(".menu-bar");
                let mainPage = document.querySelector(".wrap");
                let companyLogo = document.querySelector("#workerLogo");

                let ulLi = document.querySelectorAll(".menu-bar-content ul li");


                event.preventDefault();
                if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
                    nav.style.height = `${section.offsetHeight}px`

                    // 네비4
                    // for (let i = 0; i < ulLi.length; i++) {
                    //     ulLi[i].style.padding = '10px';
                    //     ulLi[i].style.margin = '0px';
                    // }

                    // 네비5
                    for (let i = 0; i < ulLi.length; i++) {
                        ulLi[i].style.padding = '7px';

                    }
                    menuBar.prepend(myPage);
                }
            });
        });

        // 마이페이지
        document.querySelector("#workerName").addEventListener("click", () => {
            window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
        });

        document.querySelector("#adminTitle").style.display = 'block';
        document.querySelector("#adminNav").style.display = 'block';
        // document.querySelector(".workerGrade").innerHTML = '작업자<br>';
        document.querySelector(".workerGrade").innerHTML = '관리자<br>';

        // document.querySelector("#adminTitle").style.display = 'none';
        // document.querySelector("#adminNav").style.display = 'none';

    </script>
</body>

</html>