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

  $('#convert_post_title').text $('#post_title').val()
  $('#convert_post_text').append markdown.toHTML($('#post_text').val(), 'Maruku')
  $ ->
    $('#post_title').keyup ->
      $('#convert_post_title').text $(this).val()

  $ ->
    $('#post_text').keyup ->
      $('#convert_post_text').empty()
      $('#convert_post_text').append markdown.toHTML($('#post_text').val(), 'Maruku')
