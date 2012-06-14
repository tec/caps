(->
  project = <%= @project.id %>
  name   = '<%= @project.name %>'

  label_id = '#project_' + project + '_label .project'
  form_id  = '#project_' + project + '_form form'

  <%# update the value of days_per_week %>
  $(label_id).html name
)()
