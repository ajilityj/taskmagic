$(function() {

  // Date Picker
	$('#datepicker').datepicker({
		altField: "#datepicker_db_format",
		altFormat: "yy-mm-d"
	});

  // Slide Task Details
  $('.task_title').click(function() {
    var item_id = $(this).attr('id');

    $('.task_details#'+item_id ).toggle( "slide", {direction: "right"}, 800 );
    return false;
  });

  // New Task Form
  $('#new_link').click(function() {
    $('.new_task_container').show( "slide", {direction: "right"}, 800 );
    return false;
  });
});
