//= require jquery.maskedinput

jQuery ->
  $.get('/contacts/new')
  $.get('/subscriptions/new', ->
    $('.subscription-form .cpf-input').mask("999.999.999-99")
    $('.subscription-form .birthday-input').mask("99/99/9999")
  )
