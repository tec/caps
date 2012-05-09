(->
  worker     = <%= @assignment.worker_id %>
  project    = <%= @assignment.project_id %>
  days       = <%= @assignment.days_per_week %>
  assignment = <%= @assignment.id %>

  label_id = '#w' + worker + '_p' + project + '_label'
  form_id  = '#w' + worker + '_p' + project + '_form form'

<% if @assignment.destroyed? %>
  <%# assignment was deleted, days_per_week should have the value of the previous assignment %>
  $(label_id).html('<%= @assignment.previous_days %>')
  <%# form for creating assignments %>
  $(form_id).attr 'id', 'new_assignment'
  $(form_id).attr 'action', '/assignments'
  $(form_id + ' div input[name=\'_method\']').remove()
<% else %>
  <%# update the value of days_per_week %>
  $(label_id).html days
  <%# form for updating assignments %>
  $(form_id).attr 'id', 'edit_assignment_' + assignment
  $(form_id).attr 'action', '/assignments/' + assignment
  if $(form_id + ' div input[name=\'_method\']').length == 0
    input = $(document.createElement('input'))
    input.attr({'name': '_method', 'type': 'hidden', 'value': 'put'})
    $(form_id).children('div').first().append input
<% end %>
)()
