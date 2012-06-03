# submittable form elements auto submit the form
$('.submittable').live 'change', -> 
  $(this).parents('form:first').submit()

# hide forms and only show them on click
$ ->
  label   = '.assignment_label'
  form    = '.assignment_form'
  loading = '.assignment_loading'
  button  = '.assignment_button'

  showLabels = ->
    console.log 'show'
    $(label).show()
    $(form).hide()
    $(loading).hide()
    true

  showForm = (cell) ->
    $(cell).children(label).hide()
    $(cell).children(form).show()
    $(cell).children(loading).hide()
    false

  showLoading = (cell) ->
    # set duration to 0 to make sure callback is not postponed after ajax call
    $(cell).children(label).hide(0)
    $(cell).children(form).hide(0)
    $(cell).children(loading).show(0)
    true

  # show the form when a table cell is clicked
  $(label).parent().on 'click', -> showForm(this)

  # hide forms 
  $('body').on 'click', -> showLabels()
  $(form).on('submit', -> showLoading($(this).parent()))
  $(form).on('ajax:complete', -> showLabels())

  # hide forms and buttons on load
  $(button).hide()
  showLabels()
