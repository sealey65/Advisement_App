$.validator.addMethod('validPassword',function(value, element, param){
	if(value!=''){
		if(value.match(/.*[a-z]+.*/i) == null){
			return false;
		}
		if(value.match(/.*\d+.*/i) == null){
			return false;
		}
	}
	return true;
	
},'Must contain at least one letter and one number');

$(document).ready(function(){
	
	$('#formLogin').validate({
		rules:{
			user_id: "required",
			password: {
				required: true,
				minlength: 6,
				validPassword: true
			}
		}
	});

	/**
	 *
	 * Show password toggle button
	 **/
	$(".reveal").on('click',function() {
    	var $pwd = $("#inputpassword");
    	if ($pwd.attr('type') === 'password') {
        	$pwd.attr('type', 'text');
			$('.show-icon').removeClass('fa-eye');
			$('.show-icon').addClass('fa-eye-slash');
    	} else {
        	$pwd.attr('type', 'password');
			$('.show-icon').removeClass('fa-eye-slash');
			$('.show-icon').addClass('fa-eye');
			
    	}
	});
	$("#inputpassword").on('focus', function(){
		$(".reveal").show();
	});
	$(".reveal").hide();

});

/*$('#updateBtn').click(function() {
    $.ajax({
        type: 'POST',
        url: '/user/update',
        data: { value: $('#updateBtn').val() },
        success: function(data)
        {
            console.log(data);
        }
    });
});
*/