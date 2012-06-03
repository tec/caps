(->
  worker       = <%= @availability.worker_id %>
  days         = <%= @availability.days_per_week %>
  availability = <%= @availability.id %>

  label_id = '#worker_' + worker + '_label .availabilities'
  form_id  = '#worker_' + worker + '_form form'

<% if @availability.destroyed? %>
  <%# availability was deleted, days_per_week should have the value of the previous availability %>
  $(label_id).html('<%= @availability.previous_days %>')
  <%# form for creating availabilities %>
  $(form_id).attr 'id', 'new_availability'
  $(form_id).attr 'action', '/availabilities'
  $(form_id + ' div input[name=\'_method\']').remove()
<% else %>
  <%# update the value of days_per_week %>
  $(label_id).html days
  <%# form for updating assignments %>
  $(form_id).attr 'id', 'edit_availability_' + availability
  $(form_id).attr 'action', '/availabilities/' + availability
  if $(form_id + ' div input[name=\'_method\']').length == 0
    input = $(document.createElement('input'))
    input.attr({'name': '_method', 'type': 'hidden', 'value': 'put'})
    $(form_id).children('div').first().append input
<% end %>
)()
