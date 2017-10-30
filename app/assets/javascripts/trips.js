$(function() {
  $("a.load_comments").on("click", function(e){
  //  $.ajax({
  //      method: "GET",
  //      url: this.href
  //    }).success(function(response){
         //Get the response (it's the variable data)
  //      $("div.comments").html(response)
         //We'd really want to load that data into the DOM (add it to the current page)
    //  })
  //  e.preventDefault();
//  })

// Requesting JSON
 $.get(this.href).success(function(json){
   var $ol = $("div.comments ol")
   $ol.html("")
   json.forEach(function(comment){
     $ol.append("<li>" + comment.content + "</li>");
   })
  })
  e.preventDefault();
})
})
