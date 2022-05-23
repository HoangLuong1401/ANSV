$(document).ready(function() {

	$("#btn_form").click(function() {

		var form = $("#form_login");
		console.log("1. Form on submit!");
		var usn = $('#usn').val();
		var psw_test = $('#psw').val();
		var psw = $('#psw_main').val();

		if (psw_test != "") {
			alert("Có lỗi! Vui lòng load lại trang.");
			return false;
		}

		if (usn == "" || psw == "") {
			alert("TÊN ĐĂNG NHẬP hoặc MẬT KHẨU không được để trống!");
			return false;
		}

		$.ajax({
			type: "POST",
			url: "http://10.1.3.10:3000/login",
			data: form.serialize(),
			success: function(data) {
				console.log("2. LDAP Authentication Success!");
				console.log(data);
				check_data_ajax(data);
			},
			error: function(e) {
				/*console.log("ERROR: ", e);*/
				console.log("2. LDAP Authentication Error!");
				alert("TÊN ĐĂNG NHẬP hoặc MẬT KHẨU không đúng!");
			}
		});

		return false;
	});
});

/* Hàm check role của user*/
function check_data_ajax(data_ajax) {
	array_role = data_ajax.data.memberOf;
	var array_role_send = [];
	let role = "";
	var data = "";

	for (let i = 0; i < array_role.length; i++) {
		role = array_role[i].replace(',CN=Users,DC=ansv,DC=vn', '');
		role = role.replace('CN=', '');
		role = role.toUpperCase();
		role = "ROLE_" + role;

		if (i == 0) {
			data += "role1=" + role;
		} else {
			data += "&role" + (i + 1) + "=" + role;
		}

		array_role_send.push(role);
	}
	
	data += "&size_role=" + array_role_send.length;
	data += "&display_name=" + data_ajax.data.displayName;
	data += "&login_status=" + $('#login_status').val();
	data += "&" + $("#form_login").serialize(); // Dữ liệu truyền vào ajax

	console.log('Data compare_role_user: ' + data);

	$.ajax({
		type: "POST",
		url: "compare_role_user",
		data: data,
		success: function(data) {
			console.log("3. Simple Authorization - " + data);
			if (data > 0) {
				$( "#form_login" ).submit();
			}
		},
		error: function(e) {
			console.log("ERROR: ", e);
		}
	});
}