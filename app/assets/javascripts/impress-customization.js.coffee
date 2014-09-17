$(document).on 'impress:init', ->
  $(document).on 'keyup', (event) ->
    return if $(event.target).parents('form').length > 0
    if event.keyCode >= 37 && event.keyCode <= 40
      switch event.keyCode
        when 37 then $('#contact-link').trigger('click') # left
        when 38 then $('#executor-link').trigger('click') # up
        when 39 then $('#concept-link').trigger('click') # right
        when 40 then $('#subscription-link').trigger('click') # down
      event.preventDefault()
