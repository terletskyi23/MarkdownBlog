# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $('.comments-block').on 'click', ->
    strNameId = 'cw ' + $(this).attr('id').split(' ').pop()
    $(document.getElementById(strNameId)).slideToggle 'slow'
  $('.show-comments-form').on 'click', ->
    strNameId = 'cf ' + $(this).attr('id').split(' ').pop()
    $(document.getElementById(strNameId)).slideToggle 'slow'