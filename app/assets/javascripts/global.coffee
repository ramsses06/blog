$(document).ready ->
  $('.dropdown-toggle').hover (->
    $(this).parent().addClass 'open'
    return
  ), ->
  $('.dropdown-menu').hover (->
  ), ->
    $(this).parent().removeClass 'open'
    return
  return
