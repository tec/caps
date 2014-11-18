(->
  worker     = <%= @assignment.worker_id %>
  project    = <%= @assignment.project_id %>
  days       = <%= @assignment.destroyed? ? @assignment.previous_days : @assignment.days_per_week %>
  assignment = <%= @assignment.id %>

  label_id = '#w' + worker + '_p' + project + '_label'
  form_id  = '#w' + worker + '_p' + project + '_form form'

  $(label_id).html days
<% if @assignment.destroyed? %>
  <%# assignment was deleted, days_per_week should have the value of the previous assignment %>
  <%# form for creating assignments %>
  $(form_id).attr 'id', 'new_assignment'
  $(form_id).attr 'action', '/assignments'
  $(form_id + ' div input[name=\'_method\']').remove()
<% else %>
  <%# update the value of days_per_week %>
  <%# form for updating assignments %>
  $(form_id).attr 'id', 'edit_assignment_' + assignment
  $(form_id).attr 'action', '/assignments/' + assignment
  if $(form_id + ' div input[name=\'_method\']').length == 0
    input = $(document.createElement('input'))
    input.attr({'name': '_method', 'type': 'hidden', 'value': 'put'})
    $(form_id).children('div').first().append input
<% end %>

  if days == 0
    $(label_id).addClass('no-assignment')
  else
    $(label_id).removeClass('no-assignment')

  <%# recalculate column and row sums for total assignments %>
  worker_total = 0
  $('.worker_' + worker + ' .assignment_label').each( -> 
    worker_total += parseInt($(this).html()))
  $('.worker_' + worker + ' span.total').html(worker_total)

  project_total = 0
  $('.project_' + project + ' .assignment_label').each( -> 
    project_total += parseInt($(this).html()))
  $('.project_' + project + ' span.total').html(project_total)
)()
