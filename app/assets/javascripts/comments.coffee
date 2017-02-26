# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form",(ev,data)->
	console.log data
	$("ul#comments-box").prepend("<li id='comment#{data.id}'><b>#{data.user.email}: </b><span>#{data.body}</span> <a id='comment_destroy' data-remote='true' rel='nofollow' data-method='delete' href='/articles/#{data.article_id}/comments/#{data.id}'>eliminar</a></li>")
	$(this).find("textarea").val("")

$(document).on "ajax:success", "#comment_destroy", (e, data, status, xhr) ->
  console.log status
  $("#comment#{data.id}").children().remove()
  $("#comment#{data.id}").append("Tu comentario ha sido eliminado <a id='cerrar-ventana'>X</a>")
