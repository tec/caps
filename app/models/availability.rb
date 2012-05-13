class Availability < ActiveRecord::Base
  include Week
  belongs_to :worker
end
