// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

  $('.image').hide();
  $('.image').each( function(){
    $(this).on('load', function () {
        $(this).fadeIn();
    });
  });

  $("a").each(function() {
    if ($(this).prop("href") == window.location.href) {
      $(this).addClass("active");
    }
  });

  $(".content-holder").on("click", "#dot-link", function(event) {
    event.preventDefault();
    var path = $(event.target).attr("href");
    $.ajax({
      url: path,
      method: "get"
    }).done(function(data) {
      $(".content-holder").hide().html(data).fadeIn();
      console.log(data);
    }).fail(function() {
      console.log("failed ajax!");
    });
  });

  $(".content-holder").on("click", "#next-image-link", function(event) {
    event.preventDefault();
    var path = $(event.target).parent().attr("href");
    $.ajax({
      url: path,
      method: "get"
    }).done(function(data) {
      $(".content-holder").hide().html(data).fadeIn();
    }).fail(function() {
      console.log("failed ajax!");
    })
  })
  // $(".nav-bar").on("click", ".nav-bar-links", function(event) {
  //   event.preventDefault();
  //   var id = $(event.target).attr("id");
  //   $("#sub-nav" + id).slideToggle();
  // })

  // $("body").on("click", "a", function() {
  //   $(this).css('color','#C0C0C0');
  // });
});