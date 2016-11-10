

function inputCheck(o,name,len)
{
	if(o.val()==null && o.val()==undefined){
		o.focus();
		alert(name+"를/을 입력해주세요");
		return false;
	}
	else if(o.val().length<len){
		o.focus();
		alert(name+"는/은 "+len+"자 이상 입력하셔야합니다.");
		return false;
	}
	return true;
	
}

function checkReg(o, reg,failMsg) {
	if (!(reg.test(o.val()))) {
		alert(failMsg);
		o.focus();
		return false;
	} else {
		return true;
	}
}