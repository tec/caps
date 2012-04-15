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
//= require jquery-ui



// submittable form elements auto submit the form
$('.submittable').live('change', function() {
  $(this).parents('form:first').submit();
});

// hide forms and buttons on load
$(function(){
  label  = '.assignment_label';
  form   = '.assignment_form';
  button = '.assignment_button';

  $(label).show();
  $(form).hide();
  $(button).hide();

  $(label).parent().on('mouseover', function(){
    $(this).children(label).hide();
    $(this).children(form).show();
  });

  $(label).parent().on('mouseout', function(){
    $(this).children(label).show();
    $(this).children(form).hide();
  });
});


