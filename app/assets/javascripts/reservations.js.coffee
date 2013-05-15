# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('.chzn-select').chosen
  allow_single_deselect: true
  no_results_text: 'No results matched'

$('#reservation_use_backup').on 'click', ->
  form = $(@).parent('form')
  $.ajax
    type: form.attr('method')
    url: form.attr('action')
    data: form.serialize(),
    dataType: "json",
    error:(data) ->
      alert 'Error updating reservation status'
    success: (data) ->
