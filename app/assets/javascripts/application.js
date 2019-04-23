// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require leaflet
//= require activestorage
//= require jquery-readyselector
//= require_tree .

$(document).ready(function () {

    $("#second_author").on("change", function(){
    	$("#secondauthor").toggleClass('active');
    });

    $("#third_author").on("change", function(){
    	$("#thirdauthor").toggleClass('active');
    });

    $("#fourth_author").on("change", function(){
    	$("#fourthauthor").toggleClass('active');
    });

    $("#association_details").on("change", function(){
    	$("#associationdetails").toggleClass('active');
    });

    $("#second_structure").on("change", function(){
        $("#secondstructure").toggleClass('active');
    });

    $.fn.inputFilter = function(inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
      if (inputFilter(this.value)) {
        this.oldValue = this.value;
        this.oldSelectionStart = this.selectionStart;
        this.oldSelectionEnd = this.selectionEnd;
      } else if (this.hasOwnProperty("oldValue")) {
        this.value = this.oldValue;
        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      }
    });
    };

    $(".integeronly").inputFilter(function(value) {
    return /^\d*$/.test(value); });

});
