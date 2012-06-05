# submittable form elements auto submit the form
$('.submittable').live 'change', -> 
  $(this).parents('form:first').submit()

# hide forms and only show them on click
ajaxyModelForm = (model) ->
  label   = '.' + model + '_label'
  form    = '.' + model + '_form'
  loading = '.' + model + '_loading'
  button  = '.' + model + '_button'

  showLabels = ->
    $(label).show()
    $(form).hide()
    $(loading).hide()
    updateTotalClasses()
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


$ ->
  ajaxyModelForm 'assignment'
  ajaxyModelForm 'workload'
  ajaxyModelForm 'availability'
  updateTotalClasses()

# update css classes of workload an availability cells after an update
updateTotalClasses = ->
  $('.workload_label, .availability_label').each ->
    totalSpan    = $(this).children '.total'
    total        = parseInt totalSpan.html()
    availability = parseInt $(this).children('.availabilities').html()
    workload     = parseInt $(this).children('.workloads').html()
    totalSpan.removeClass('error')
    totalSpan.removeClass('warning')
    unless isNaN(workload) 
      if total < workload
        totalSpan.addClass('error')
      else if total > workload
        totalSpan.addClass('warning')
    unless isNaN(availability) 
      if total < availability
        totalSpan.addClass('warning')
      else if total > availability
        totalSpan.addClass('error')
