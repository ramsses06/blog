# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form",(ev,data)->
	console.log data
	$("ul#comments-box").prepend("<li><b>#{data.user.email}: </b>#{data.body}</li>")
	$(this).find("textarea").val("")

jQuery ->
  objetos = $("#comentariosData").data('comentarios')
  # console.log (objetos)
  $.each objetos, (obj, values) ->
    console.log (values)
    $("#comentariosData").append("<ul><h1><strong>#{values.user_id}</strong></h1><li>#{values.body}</li></ul>")
