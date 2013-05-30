// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require ./jquery.cookie

//= require store/spree_frontend
//= require twitter/bootstrap/bootstrap-dropdown
//= require twitter/bootstrap/bootstrap-tooltip
//= require twitter/bootstrap/bootstrap-popover
//= require ./bootstrap-typeahead
//= require ./bootstrap-modal
//= require ./bootstrap-modalmanager

//= require_tree .
$(function(){
    new PointGaming.DesktopController();
});
//= require store/spree_bootstrap
