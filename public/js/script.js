
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
	/*$('#inputpassword').hideShowPassword(false, 'focus', {
    	toggle: {
			className: 'btn btn-secondary show-btn'
        }
     }); */
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