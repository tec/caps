class Workload < ActiveRecord::Base
  include Week
  belongs_to :project
end
