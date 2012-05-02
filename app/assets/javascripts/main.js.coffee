# submittable form elements auto submit the form
$('.submittable').live 'change', -> 
  $(this).parents('form:first').submit()

# hide forms and buttons on load
$ ->
  label  = '.assignment_label'
  form   = '.assignment_form'
  button = '.assignment_button'

  $(label).show()
  $(form).hide()
  $(button).hide()

  $(label).parent().on 'mouseenter', ->
    $(this).children(label).hide()
    $(this).children(form).show()

  $(label).parent().on 'mouseleave', ->
    $(this).children(label).show()
    $(this).children(form).hide()

