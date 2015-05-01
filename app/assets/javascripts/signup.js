$(document).ready(function(){

    // submitUserListener();
})

function submitUserListener(e){
 
  $("form" ).on( "submit", function(e){
    e.preventDefault();
    var url = "http://localhost:3000/api/users"
    var data = $(this).serialize();
    $.ajax({
      type: "POST",
      url: url,
      accepts: "application/json",
      dataType:"json",
      data: data,
      crossDomain: true,
      // beforeSend: function() { $.mobile.showPageLoadingMsg("b", "Loading...", true) },
      // complete: function() { $.mobile.hidePageLoadingMsg() },
      success: function(data) { alert("ajax worked"); },
      error: function(data) {alert("ajax error"); }
    });

  })

}