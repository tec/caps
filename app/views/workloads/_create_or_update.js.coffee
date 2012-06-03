(->
  project  = <%= @workload.project_id %>
  days     = <%= @workload.days_per_week %>
  workload = <%= @workload.id %>

  label_id = '#project_' + project + '_label .workloads'
  form_id  = '#project_' + project + '_form form'

<% if @workload.destroyed? %>
  <%# workload was deleted, days_per_week should have the value of the previous workload %>
  $(label_id).html('<%= @workload.previous_days %>')
  <%# form for creating workloads %>
  $(form_id).attr 'id', 'new_workload'
  $(form_id).attr 'action', '/workloads'
  $(form_id + ' div input[name=\'_method\']').remove()
<% else %>
  <%# update the value of days_per_week %>
  $(label_id).html days
  <%# form for updating assignments %>
  $(form_id).attr 'id', 'edit_workload_' + workload
  $(form_id).attr 'action', '/workloads/' + workload
  if $(form_id + ' div input[name=\'_method\']').length == 0
    input = $(document.createElement('input'))
    input.attr({'name': '_method', 'type': 'hidden', 'value': 'put'})
    $(form_id).children('div').first().append input
<% end %>
)()
