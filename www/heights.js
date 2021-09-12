// Define function to set height of "map" and "map_container"
setHeight = function() {
  var window_height = $(window).height();
  var header_height = $(".main-header").height();
  var update_height = $("#update").height();
  var boxHeight = window_height - header_height - 30;

  $("#map_container").height(boxHeight);
  $("#scotland_map").height(boxHeight - header_height);
  $("#input_options").height(boxHeight);
  
  
};

setWidth = function() {
  var box_width = $(".selectize-input").width();
  
  $("#update").width(box_width)
};

// Set input$box_height when the connection is established
$(document).on("shiny:connected", function(event) {
  setWidth();
  setHeight();
});

// Refresh the box height on every window resize event    
$(window).on("resize", function(){
  setWidth();
  setHeight();
});