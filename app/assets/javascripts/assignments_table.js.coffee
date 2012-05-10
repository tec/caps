# submittable form elements auto submit the form
$('.submittable').live 'change', -> 
  $(this).parents('form:first').submit()

# hide forms and only show them on click
$ ->
  label  = '.assignment_label'
  form   = '.assignment_form'
  button = '.assignment_button'

  hideForms = ->
    $(label).show()
    $(form).hide()
    $(label).parent().css 'cursor', 'pointer'
    true

  showForm = (cell) ->
    $(cell).children(label).hide()
    $(cell).children(form).show()
    $(cell).css 'cursor', 'auto'
    false

  # show the form when a table cell is clicked
  $(label).parent().on 'click', -> showForm(this)

  # hide forms 
  $('body').on 'click', -> hideForms()
  $(form).on('ajax:complete', -> hideForms())

  # hide forms and buttons on load
  $(button).hide()
  hideForms()
