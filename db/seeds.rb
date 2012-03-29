# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


silvan = Worker.create(name: 'Silvan')
lars = Worker.create(name: 'Lars')
tino = Worker.create(name: 'Tino')


rails = Project.create(name: 'Rails App')
sling = Project.create(name: 'Sling Server')
symfony = Project.create(name: 'Symfony Project')


Availability.create([
  {worker: silvan, days_per_week: 1, from_week:  1, from_year: 2011},
  {worker: silvan, days_per_week: 2, from_week:  2, from_year: 2011},
  {worker: silvan, days_per_week: 3, from_week: 52, from_year: 2011},
  {worker: silvan, days_per_week: 4, from_week:  1, from_year: 2012},
  {worker: silvan, days_per_week: 5, from_week: 30, from_year: 2012}
])
Availability.create([
  {worker: lars, days_per_week: 1, from_week:  5, from_year: 2011},
  {worker: lars, days_per_week: 2, from_week: 12, from_year: 2012},
  {worker: lars, days_per_week: 3, from_week: 32, from_year: 2013},
  {worker: lars, days_per_week: 4, from_week: 33, from_year: 2013}
])
Availability.create([
  {worker: tino, days_per_week: 1, from_week: 17, from_year: 2012},
  {worker: tino, days_per_week: 2, from_week: 40, from_year: 2013}
])


Workload.create([
  {project: rails, days_per_week: 1, from_week:  1, from_year: 2011},
  {project: rails, days_per_week: 5, from_week: 10, from_year: 2013}
])
Workload.create([
  {project: rails, days_per_week: 4, from_week: 17, from_year: 2012},
  {project: rails, days_per_week: 3, from_week: 40, from_year: 2012}
])

Assignment.create([
  {worker: silvan, project: rails,   days_per_week: 1, from_week:  1, from_year: 2011},
  {worker: silvan, project: rails,   days_per_week: 2, from_week: 12, from_year: 2011},
  {worker: silvan, project: rails,   days_per_week: 4, from_week: 17, from_year: 2012},
  {worker: lars,   project: sling,   days_per_week: 3, from_week: 17, from_year: 2011},
  {worker: lars,   project: sling,   days_per_week: 5, from_week:  1, from_year: 2012},
  {worker: lars,   project: sling,   days_per_week: 3, from_week: 32, from_year: 2012},
  {worker: lars,   project: symfony, days_per_week: 2, from_week: 32, from_year: 2012},
  {worker: tino,   project: symfony, days_per_week: 3, from_week:  1, from_year: 2012},
  {worker: tino,   project: symfony, days_per_week: 4, from_week:  1, from_year: 2013}
])
