function readURL(file,image) {
	console.log(file.files);
	console.log(file.files[0]);
	console.log(image);
	
	if (file.files && file.files[0]) {
		console.log('ok');
		var reader = new FileReader(); // 파일을 읽기 위한 FileReader객체 생성
		reader.onload = function(e) {
			// 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			image.attr('src', e.target.result);
			// 이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
			// (아래 코드에서 읽어들인 dataURL형식)
		}
		reader.readAsDataURL(file.files[0]);
		// File내용을 읽어 dataURL형식의 문자열로 저장
	}
}// readURL()--

function imageChange(image,file) {
	console.log(file);
	// file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	file.change(function() {
		// alert(this.value); //선택한 이미지 경로 표시
		readURL(this,image);
	});
}

function imageView(image,file) {
	// file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	
		readURL(file,image);
		//readURL(image,file);
}