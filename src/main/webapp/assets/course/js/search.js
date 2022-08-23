const searchWrapper = document.querySelector(".search-input");
const inputBox = document.querySelector(".input_search");
const values = document.querySelector(".autocom-box");
const icon = searchWrapper.querySelector(".icon");


jQuery(document).ready(
    function ($) {
        $('.search-switch').on('click', function () {
            $('.search-model').fadeIn(400);
        });

        $('.search-close-switch').on('click', function () {
            $('.search-model').fadeOut(400, function () {
                $('#search-input').val('');
            });
        });
    });

jQuery(document).ready(function($) {
    $("#summitCmt").click(function(){
        var mark = $('#inputBoxs').val();
        var cmt = $('#subject').val();
        var id_c = $('.id_c').text();

        console.log(id_c);
        if(mark == "" && cmt == ""){
            alert("Vui lòng cho điểm và nhận xét của bạn về khóa học, bài giảng");
            return false;
        }else if(mark == ""){
            alert("Thiếu điểm khóa học rồi, hãy nhập điểm bài giảng để ");
            return false;
        }else if(cmt == ""){
            alert("Hãy thêm nhận xét để cải thiện những khóa học sau nhé!");
             return false;
        }

        $.ajax({
            type: "GET",
            url: "/ANSV/user/khoa-hoc/comment",
            contentType : "application/json",
            data: {id_c: id_c, marks : mark, comments : cmt},
            dataType : 'json',
            success: function(data) {
                var result = "<div class=\"course_review__item\">\n" +
                    "                    <div class=\"course_review__item__pic\">\n" +
                    "                        <img src=\"/ANSV/assets/course/img/avatar.png\"/>\n" +
                    "                    </div>\n" +
                    "                    <div class=\"course_review_item_text\">\n" +
                    "                        <h6>"+data.username+" - <p class=\"stars\" style=\"--rating:"+ data.marks_vote + ";\"></p> <span style=\"float: right;\">"+data.date_cmt+"</span></h6>\n" +
                    "                        <p>"+data.cmt+"</p>\n" +
                    "                    </div>\n" +
                    "                </div>";
                $(".course_review").html(result);

            },
            error: function(e) {
               console.log(e);
            }
        });
    });
});


inputBox.onkeyup = (e)=>{
    let userData = e.target.value;
        if (userData.length >= 2) {
            jQuery.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/search/",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: {query:userData},
                success: function(data){
                    if(data === 0){
                        searchWrapper.classList.remove("active"); //show autocomplete box
                        values.innerHTML = "";
                    }else{
                        searchWrapper.classList.add("active"); //show autocomplete box
                        values.innerHTML = data;
                    }
                }
            });
        } else {
            values.innerHTML = "";
            searchWrapper.classList.remove("active"); //show autocomplete box
        }

        if(e.which === 13){
            let values =  inputBox.value;
            if(values.length >= 2){
                location.href = '/ANSV/user/khoa-hoc/search/'+values;
        }
    }
}

function select(element){
    let selectData = element.textContent;
    inputBox.value = selectData;
    icon.onclick = ()=>{
        location.href = '/ANSV/user/khoa-hoc/search/'+selectData;
    }
    searchWrapper.classList.remove("active");
}

jQuery(document).ready(
    function($) {
        if(window.history.length === 1){
            $("#backBtn").hide();
        }else{
            $("#backBtn").show();
        }
    }
);





