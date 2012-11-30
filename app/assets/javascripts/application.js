// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-datepicker

$(function () {
  $('#interest_tag_tokens').tokenInput('/tags.json', { 
    crossDomain: false,
    prePopulate: $('#interest_tag_tokens').data('load'),
    theme: "facebook"
  });
});

$(function () {
  $('#event_interest_tokens').tokenInput('/interests.json', { 
    crossDomain: false,
    prePopulate: $('#event_interest_tokens').data('load'),
    theme: "facebook"
  });
});

$(function () {
  $('#survey_interest_tokens').tokenInput('/interests.json', { 
    crossDomain: false,
    prePopulate: $('#survey_interest_tokens').data('load'),
    theme: "facebook"
  });
});

$(function() {
  $("#survey_start_time").datepicker({format: 'dd-mm-yyyy'});
});

$(function() {
  $("#survey_finish_time").datepicker({format: 'dd-mm-yyyy'});
});

$(function() {
  $("#event_time").datepicker({format: 'dd-mm-yyyy'});
});

$(function() {
  $("#occasion_time").timepicker();
});

$(function() {
  $(".timepicker-default").timepicker();
});

$(function() {
  $(".timepicker").timepicker({showMeridian: true});
});

function remove_fields(link){
	$(link).previous("input[type=hidden]").value = "1";
	$(link).up(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
