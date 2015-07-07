// JavaScript Document

$(document).ready(function() {
	
"use strict";	
$(function() {
	  $('span.checkbox').click(function(){
    		$(this).toggleClass("checked");
			
				if($(this).hasClass('checked')) {
					$(this).prev('.cb').prop('checked', false);
					$(this).parent('label').css('font-weight', '700');
					} else {
					$(this).prev('.cb').prop('checked', true);
					$(this).parent('label').css('font-weight', '400');
				}
	
	});
});

$(function() {
	  $('span.radio').click(function(){
    		$(this).toggleClass("checked");
			
				if($(this).hasClass('checked')) {
					$(this).prev('.rb').prop('checked', false);
					} else {
					$(this).prev('.rb').prop('checked', true);	
				}
	
	});
});

$('.accordion .accordion-navigation > a').click(function(){
	$(this).find("i").toggleClass('fa-caret-right fa-caret-down');
	
});
  	

$(function() {
	function validateChk(e) {
		if($('input[type="checkbox"]').hasClass('error') || $('input[type="radio"]').hasClass('error')) {
		$('span.custom').css('border', '2px solid red');
		if(e) {
		e.preventDefault(); }
	} 
	else{
		$('span.custom').css('border', '1px solid #cccccc');
	}
} 
$('#contact-form').on('submit', function(e){
	validateChk(e);
});
$('#CompProfileForm').on('submit', function(e){
	validateChk(e);
});
$('span.custom').on('click', function(){
	validateChk();
});
});


$('#logoFile').bind('change', function() {
        var filename = $(this).val();
		//var filesize = $(this)[0].files[0].size;		
		var filesize = ($(this)[0].files[0].size / 1024); 
			if (filesize / 1024 > 1) { 
				if (((filesize / 1024) / 1024) > 1) { 
					filesize = (Math.round(((filesize / 1024) / 1024) * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'GB');
				}
				else{ 
					filesize = (Math.round((filesize / 1024) * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'MB');
				} 
				} 
				else {
					filesize = (Math.round(filesize * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'KB');
				}	
        //filename=filename.substring(filename.lastIndexOf('\\')+1);
		//$(this).prev($('.file-status')).css('display' , 'block');
        //$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'bytes');
});



$('#FImageFile').bind('change', function() {
        var filename = $(this).val();
		//var filesize = $(this)[0].files[0].size;		
		var filesize = ($(this)[0].files[0].size / 1024); 
			if (filesize / 1024 > 1) { 
				if (((filesize / 1024) / 1024) > 1) { 
					filesize = (Math.round(((filesize / 1024) / 1024) * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'GB');
				}
				else{ 
					filesize = (Math.round((filesize / 1024) * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'MB');
				} 
				} 
				else {
					filesize = (Math.round(filesize * 100) / 100);
					$(this).prev($('.file-status')).css('display' , 'block');
					$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'KB');
				}	
        //filename=filename.substring(filename.lastIndexOf('\\')+1);
		//$(this).prev($('.file-status')).css('display' , 'block');
        //$(this).prev($('.file-status')).html(filename + '&nbsp;&nbsp;' + filesize + 'bytes');
});

    
});
