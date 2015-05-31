


$(function(){

  // addSubmitLoginListener();

})

function addSubmitLoginListener(){

  $('#signin-form').on("submit", function(e){

      e.preventDefault();
      e.stopPropagation();
      var url = "http://localhost:3000/api/sessions"
      var email = $('#session_email').val();
      var password = $('#session_password').val();
      var data =  'email: jeremy.sklarsky@gmail.com, password:             '

        $.ajax({
        beforeSend: function(xhr) {
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
        type: "POST",
        url: url,
        dataType: 'json',
        data: {data},
        success: function (data) {
          alert("Success!!");
        }
      });
    })


  
}
