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
	
	$('#addUserForm').validate({
		rules:{
			user_id:"required",
			email: {
				required: true,
				email: true,
				remote: '/account/validate-email'
			},
			pword: {
				required: true,
				minlength: 6,
				validPassword: true
			},
			role:"required"
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
	
	/**
 	 * Hide and Show campus for adding a new user
 	 **/
    $("#role").change(function(){
    	if ($(this).val()=="Advisor" || $(this).val()=="Student"){
        	$('.campus').show();
			if($(this).val()=="Advisor"){
				$('#dept-program-label').html('Department');
				$('#dept').show();
				$('#status').hide();
				$('#program').hide();
			}else{
				$('#dept-program-label').html('Programme');
				$('#program').show();
				$('#status').show();
				$('#dept').hide();
			}
      	}
     	else{
          	$('.campus').hide();
	 	}
	});

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
