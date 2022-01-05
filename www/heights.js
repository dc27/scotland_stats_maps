// Define function to set height of "map" and "map_container"
setHeight = function() {
  var window_height = $(window).height();
  var header_height = $(".main-header").height();
  var boxHeight = window_height - header_height - 30;
  var nav_element = document.getElementsByClassName('nav-tabs-custom')[0];
  var bottom_marge = window
    .getComputedStyle(nav_element, null)
    .getPropertyValue('margin-bottom');
  var update_height = $("#update").height();
  
  $(".box-body").height(boxHeight - header_height);
  $("#scotland_map").height(boxHeight - header_height);
  $("#basic_bar").height(boxHeight - header_height);
  $("#table").height(boxHeight - header_height);
  $(".nav-tabs-custom").
  height(
    boxHeight - header_height - parseInt(bottom_marge, 10) - (2 * update_height)
    );
};

setWidth = function() {
  var box_width = $(".selectize-input").width();
  
  $("#update").width(box_width);
};

// Set box_height when the connection is established
$(document).on("shiny:connected", function(event) {
  setWidth();
  setHeight();
});

// Refresh the box height on every window resize event    
$(window).on("resize", function(){
  setWidth();
  setHeight();
});