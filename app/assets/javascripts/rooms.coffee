# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.datetimepicker').datetimepicker
    inline: true
    sideBySide: true
    format: 'DD-MM-YYYY HH:mm'
    locale: 'en'
  return