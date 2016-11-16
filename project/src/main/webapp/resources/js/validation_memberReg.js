/* Validation - Register New Member */
/* member_reg.jsp */

function passwordCheck() {
	var member_pwd = document.getElementById("member_pwd").value;
	var member_pwd_check = document.getElementById("member_pwd_check").value;

	console.log("member_pwd : " + member_pwd);
	console.log("member_pwd_check : "+member_pwd_check);
	
	if(member_pwd_check == "") {
		document.getElementById("pwd-check-message").innerHTML = "<b><font color=orange>&nbsp;※ 비밀번호를 입력해주세요.</b>"
	} else if(member_pwd != member_pwd_check) {
		document.getElementById("pwd-check-message").innerHTML = "<b><font color=red>&nbsp;※ 비밀번호가 일치하지 않습니다.</b>"
	} else {
		document.getElementById("pwd-check-message").innerHTML = "<b><font color=#2E2EFE>&nbsp;비밀번호가 확인되었습니다.</b>"
	}
}

function regInputCheck() {
	var member_email = document.frm.member_email.value;
	var member_pwd = document.frm.member_pwd.value;
	var member_first_name = document.frm.member_first_name.value;
	var member_last_name = document.frm.member_last_name.value;
	var member_phone1 = document.frm.member_phone1.value;
	var member_phone2 = document.frm.member_phone2.value;
	var member_phone3 = document.frm.member_phone3.value;
	var member_birthday = document.frm.member_birthday.value;
	var member_img = document.frm.member_img.value;
	
	if(member_email = "" || member_email.length == 0) {
		alert("이메일 주소를 입력해주세요. \n\nPlease insert your e-mail address.\n");
		frm.member_email.focus();
		return false;
	}
	if(member_pwd = "" || member_pwd.length == 0) {
		alert("비밀번호를 입력해주세요. \n\nPlease insert your password.\n");
		frm.member_pwd.focus();
		return false;
	}
	if(member_first_name = "" || member_first_name.length == 0) {
		alert("이름을 입력해주세요. \n\nPlease insert your first name.\n");
		frm.member_first_name.focus();
		return false;
	}
	if(member_last_name = "" || member_last_name.length == 0) {
		alert("성을 입력해주세요. \n\nPlease insert your last name.\n");
		frm.member_last_name.focus();
		return false;
	}
	if(member_phone1.length == 0 || member_phone2.length == 0 || member_phone3.length==0) {
		alert("전화번호를 입력해주세요. \n\nPlease insert your phone number.\n");
		frm.member_phone1.focus();
		return false;
	}
	if(member_birthday = "" || member_birthday.length == 0) {
		alert("생년월일을 입력해주세요. \n\nPlease insert your birthday.\n");
		frm.membe_birthday.focus();
		return false;
	}
	if(member_img = "" || member_img.length == 0) {
		alert("사진을 등록해주세요. \n\nPlease insert your picture.\n");
		return false;
	}
	
	alert("SUCCESS!!!");
	return true;
}