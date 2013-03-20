function showTaskDetails (id) {
  $(".task_details#"+id).show( "slide", {direction: "right"}, 800);
}
function hideTaskDetails() {
  $(".task_details").hide( "slide", {direction: "right"}, 800);
}
function showNewTask() {
  $(".new_task_container").show( "slide", {direction: "right"}, 800 );
  $("#new_link").css("visibility", "hidden");
}
function hideNewTask() {
  $(".new_task_container").hide( "slide", {direction: "right"}, 800 );
  $("#new_task")[0].reset();  
  $("#new_link").css("visibility", "visible"); 
}

$(function() {

  // Date Picker
	$("#datepicker").datepicker({
		altField: "#datepicker_db_format",
		altFormat: "yy-mm-d"
	});
  
  // Slide Task Details
  $(".container").on("click", ".task_title", function() {
    var item_id = $(this).attr("id");
    hideTaskDetails();
    hideNewTask();
    showTaskDetails(item_id);
    return false;
  });

  $(".task_details #cancel_link").click(function() {
    hideTaskDetails();
    return false;
  });

  // New Task Form
  $(".container").on("click", "#new_link", function() {
    hideTaskDetails();
    showNewTask();
    return false;
  });
  
  $(".new_task_container #cancel_link").click(function() {
    hideNewTask();
    return false;
  });

  // Close Task on Container Click
  $(".container").click(function() {
    hideTaskDetails();
    hideNewTask();
    return false;
  });

  // Prevent Task Close when Clicking on Details
  $('.task_details').click(function(e){
      e.stopPropagation();
  });
  $('.new_task_container').click(function(e){
      e.stopPropagation();
  });  

});
