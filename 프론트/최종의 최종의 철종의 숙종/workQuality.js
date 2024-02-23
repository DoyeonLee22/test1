window.addEventListener("load", function () {

    document.querySelector("#mainTitle2").style.display = "block";

    const hover = document.querySelectorAll('a.hover');
    const menuBar = document.querySelector('.menu-bar');
    const nav = document.querySelector('nav');

    // 모바일 스크립트 코드
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const myPage = document.querySelector('#myPage');

    const workerGrade = document.querySelector(".workerGrade");

    hamburgerMenu.addEventListener('click', function () {
        nav.classList.toggle('active');

        if (nav.classList.contains('active')) {
            nav.prepend(myPage);
            myPage.style.display = 'flex';
            myPage.style.padding = '5px 0';
            myPage.style.backgroundColor = '#dde';
            workerGrade.style.display = "inline";

            let sectionHeight = section.offsetHeight;
            nav.style.height = `${sectionHeight}px`;
        } else {
            workerTitle.appendChild(myPage);
            myPage.style.display = '';
            nav.style.height = '';
            workerGrade.style.display = "none";
        }
    });
    
    const wrap = document.querySelector('.wrap');

    const section = document.querySelector('section');
    section.addEventListener("click", function () {
        hideMenuBar();
    })

    let id = "admin";

    document.querySelector("#complete-button")
        .addEventListener("click", function () {
            id = "admin";
            user_check(id);
        });
    document.querySelector("#user")
        .addEventListener("click", function () {
            id = "user";
            user_check(id);
        });


    function user_check(id) {

        const menubarContent = document.querySelector(".menu-bar-content");

        if (id == "user") {
            document.querySelector("#mainTitle1").style.display = "block";
            document.querySelector("#mainTitle2").style.display = "none";
            document.querySelector("#complete-button-div").style.display = "block";
            document.querySelector("#work-checker").style.display = "block";
            document.querySelector("#add-button-div").style.display = "none";
            document.querySelector("#adminTitle").style.display = 'none';
            document.querySelector("#adminNav").style.display = 'none';
            document.querySelector(".workerGrade").innerHTML = '작업자<br>';

            let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");

            for (let i = 0; i < delete_checkbox_div.length; i++) {
                delete_checkbox_div[i].style.display = "none";
            };

            let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");

            for (let i = 0; i < error_checkbox_div.length; i++) {
                error_checkbox_div[i].style.display = "block";
            };

            for (let i = 0; i < menubarContent.length; i++) {
                menubarContent[i].style.marginLeft = "40px";
            };

        } else if (id == "admin") {
            document.querySelector("#mainTitle1").style.display = "none";
            document.querySelector("#mainTitle2").style.display = "block";
            document.querySelector("#add-button-div").style.display = "block";
            document.querySelector("#work-checker").style.display = "none";
            document.querySelector("#complete-button-div").style.display = "none";
            document.querySelector("#adminTitle").style.display = 'block';
            document.querySelector("#adminNav").style.display = 'block';
            document.querySelector(".workerGrade").innerHTML = '관리자<br>';

            let delete_checkbox_div = document.getElementsByClassName("delete-checkbox-div");

            for (let i = 0; i < delete_checkbox_div.length; i++) {
                delete_checkbox_div[i].style.display = "block";
            };

            let error_checkbox_div = document.getElementsByClassName("error-checkbox-div");

            for (let i = 0; i < error_checkbox_div.length; i++) {
                error_checkbox_div[i].style.display = "none";
            };

            for (let i = 0; i < menubarContent.length; i++) {
                menubarContent[i].style.marginLeft = "0";
            };

        }

    };





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

    function showMenuBar() {
        nav.classList.add('active');
    }

    function hideMenuBar() {
        nav.classList.remove('active');
    }

    // 품질검사 지침서 팝업
    // 팝업 div 랑 버튼가져오기
    const work_popup = document.getElementById("work-popup");
    const work_button = document.getElementById("work-checker-button");
    const close_btn = document.getElementById("close-popup-btn");

    // 팝업 div 열기
    work_button.addEventListener("click", function () {
        work_popup.style.display = "block";
        // 다른영역 클릭 비활성화
        work_popup.style.pointerEvents = "auto";
    });

    // 팝업 div 닫기 => 닫기버튼누를시
    close_btn.addEventListener("click", function () {
        work_popup.style.display = "none";
        // 다른영역 클릭 활성화
        work_popup.style.pointerEvents = "none";
    });

    // 팝업 div 닫기버튼 비활성화
    work_popup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    // 팝업 div 닫기버튼 활성화
    window.addEventListener("click", function (event) {
        if (event.target == work_popup) {
            work_popup.style.display = "none";
            // 다른영역 클릭 활성화
            work_popup.style.pointerEvents = "none";
        }
    });







    // 품질불량 체크사항 삭제하기 --기본사항
    const list_delete = document.getElementById("list-delete");


    list_delete.addEventListener("click", function () {

        const delete_checked = document.querySelectorAll(".delete-checkbox:checked");

        for (let i = 0; i < delete_checked.length; i++) {


            delete_checked[i].closest(".work-check-list").style.display = "none";
        }

    });







    // 품질불량 체크사항 추가하기 팝업
    const add_popup = document.getElementById("quality-add-popup");
    const list_add_button = document.getElementById("list-add-button");
    const add_apply_button = document.getElementById("add-apply-button");
    const cancel_apply_button = document.getElementById("cancel-apply-button");

    // 팝업 div 열기
    list_add_button.addEventListener("click", function () {

        const add_title = document.querySelector("#add-title");
        const add_detail = document.querySelector("#add-detail");
        add_title.value = "";
        add_detail.value = "";

        add_popup.style.display = "block";

        // 다른영역 클릭 비활성화
        add_popup.style.pointerEvents = "auto";
    });

    // 팝업 div 닫기 => 적용,취소버튼누를시
    add_apply_button.addEventListener("click", function () {
        add_popup.style.display = "none";
        // 다른영역 클릭 활성화
        add_popup.style.pointerEvents = "none";
    });

    cancel_apply_button.addEventListener("click", function () {
        add_popup.style.display = "none";
        // 다른영역 클릭 활성화
        add_popup.style.pointerEvents = "none";
    });

    // 팝업 div 닫기버튼 비활성화
    add_popup.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    // 팝업 div 닫기버튼 활성화
    window.addEventListener("click", function (event) {

        if (event.target == add_popup) {
            add_popup.style.display = "none";
            // 다른영역 클릭 활성화
            add_popup.style.pointerEvents = "none";
        }
    });



    // 품질불량 체크사항 추가사항 적용하기

    document.querySelector("#add-apply-button")
        .addEventListener("click", function () {

            const add_title = document.querySelector("#add-title");
            const add_detail = document.querySelector("#add-detail");
            const work_quality = document.querySelector("#work-quality");




            let detail = add_detail.value.split("\n");

            let detail_content = "";

            for (let i = 0; i < detail.length; i++) {

                detail_content += `<div class="work-check-list-content">
                                        <span>
                                            -${detail[i]}
                                            <div class="error-checkbox-div">
                                                <input type="checkbox" class="error-checkbox">
                                            </div>
                                        </span>
                                    </div>`;

            }


            let html = "";
            html += `<div class="work-check-list">
                            <h3>
                                ${add_title.value}
                                <div class="delete-checkbox-div">
                                    <input type="checkbox" class="delete-checkbox">
                                </div>
                            </h3>
                                ${detail_content}
                        </div>`;

            console.log("클릭됨");
            let add_div = document.createElement("div");
            add_div.innerHTML = html;
            work_quality.append(add_div);

        });

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

    

    // document.querySelector("#adminTitle").style.display = 'none';
    // document.querySelector("#adminNav").style.display = 'none';

});