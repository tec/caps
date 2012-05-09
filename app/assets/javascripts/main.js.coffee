# submittable form elements auto submit the form
$('.submittable').live 'change', -> 
  $(this).parents('form:first').submit()

# hide forms and buttons on load
$ ->
  label  = '.assignment_label'
  form   = '.assignment_form'
  button = '.assignment_button'
  $(button).hide()

  closeForms = ->
    $(label).show()
    $(form).hide()
    $(label).parent().css 'cursor', 'pointer'
    true
  closeForms()

  $(label).parent().on 'click', ->
    $(this).children(label).hide()
    $(this).children(form).show()
    $(this).css 'cursor', 'auto'
    false

  $('body').on 'click', ->
    closeForms()

  $(form).on 'submit', ->
    closeForms()

