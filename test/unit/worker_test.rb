require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  test "silvan is available" do
    availability = workers( :silvan ).get_availability 10000, 10000
    assert_not_nil availability
  end
  test "lars is not available" do
    availability = workers( :lars ).get_availability 10000, 10000
    assert_nil availability
  end
  test "silvan is available 2 days in summer 2011" do
    availability = workers( :silvan ).get_availability 2011, 26
    assert_equal 2, availability.days_per_week
  end
  test "silvan is available 4 days in summer 2012" do
    availability = workers( :silvan ).get_availability 2012, 26
    assert_equal 4, availability.days_per_week
  end
  test "silvan is available 5 days in summer2013" do
    availability = workers( :silvan ).get_availability 2013, 26
    assert_equal 5, availability.days_per_week
  end
end
