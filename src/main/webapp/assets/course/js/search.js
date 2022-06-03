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

inputBox.onkeyup = (e)=>{
    let userData = e.target.value; //user enetered data
        if (userData.length >= 2) {
            jQuery.ajax({
                type: "GET",
                url: "/ANSV/user/khoa-hoc/search/",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: {query:userData},
                success: function(data){
                    if(data == 0){
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

        if(e.which == 13){

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



