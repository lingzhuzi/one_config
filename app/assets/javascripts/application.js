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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  window.Notice = {
    checkAndShow: function () {
      var $notice = $('#notice')
      var msg = $notice.text().trim();

      if (msg == ""){
        $notice.hide();
        return;
      }
      $notice.removeClass();
      $notice.addClass('alert').addClass('alert-success');
      this.setPositionAndShow($notice);
    },
    show: function(msg, level) {
      var $notice = $('#notice')
      $notice.removeClass();
      $notice.addClass('alert').addClass(level || 'alert-success');
      $notice.text(msg);
      this.setPositionAndShow($notice);
    },
    setPositionAndShow: function ($notice) {
      var left = ($(window).width() - $notice.width())/2;
      $notice.css({top: 100, left: left}).show();
      setTimeout(function(){
        $notice.hide();
      }, 3000)
    },
    showError: function(msg) {
      this.show(msg, 'alert-danger');
    },
    showWarn: function(msg) {
      this.show(msg, 'alert-warning');
    },
    showInfo: function(msg) {
      this.show(msg, 'alert-info');
    },
    showSuccess: function(msg) {
      this.show(msg, 'alert-success');
    }
  }

  Notice.checkAndShow();
});