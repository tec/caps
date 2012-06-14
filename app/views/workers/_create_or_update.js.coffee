(->
  worker = <%= @worker.id %>
  name   = '<%= @worker.name %>'

  label_id = '#worker_' + worker + '_label .worker'
  form_id  = '#worker_' + worker + '_form form'

  <%# update the value of days_per_week %>
  $(label_id).html name
)()
