// JavaScript Document
$(function(){

	var fileTarget = $('#file');
	fileTarget.on('change', function(){ // 값이 변경되면
		/*
	if(window.FileReader){ // modern browser
		var filename = $(this)[0].files[0].name;
		alert($(this)[0].files[0].name);

	}
	else { // old IE
	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
 	} // 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename); });
*/
});
$(function() {
		$("#file").on('change', function(){
				readURL(this);
		});
});

	function readURL(input) {
		if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
						$('#Img').attr('src', e.target.result);
				}

			reader.readAsDataURL(input.files[0]);
		}
}


});
