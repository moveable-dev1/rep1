// JavaScript Document

jQuery(document).ready(function($) {
	
"use strict";

$(document).foundation();

$('.accordion .accordion-navigation > a').click(function(){
	$(this).find("i").toggleClass('up dwn');
	
});

});
