$(function() {
  $("a.load_comments").on("click", function(e){
    $.ajax({
        method: "GET",
        url: this.href
      }).success(function(response){
         //Get the response (it's the variable data)
        $("div.comments").html(response)
         //We'd really want to load that data into the DOM (add it to the current page)
      }).error(function(notNeeded){
        alert("we broke!!!!")
      });
  }
})