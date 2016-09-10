# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "a#eliminar",  (ev,data)->
	console.log data
	alert "articulo borrado con exito"

$(document).on "ajax:error", "a#eliminar", (ev,data)->
	console.log data