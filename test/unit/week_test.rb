require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  test "previous_week" do
    two = assignments :two
    assert_equal 2012, two.from_year
    assert_equal 1, two.from_week
    three = assignments :three
    assert_equal 2012, three.from_year
    assert_equal 5, three.from_week
    two_previous_week = two.previous_week
    assert_equal 2011, two_previous_week[:year]
    assert_equal 52, two_previous_week[:week]
    three_previous_week = three.previous_week
    assert_equal 2012, three_previous_week[:year]
    assert_equal 4, three_previous_week[:week]
  end
  test "previous_assignment" do
    two = assignments :two
    assert_equal 2012, two.from_year
    assert_equal 1, two.from_week
    three = assignments :three
    assert_equal 2012, three.from_year
    assert_equal 5, three.from_week
    previous_week = three.previous_week
    assert_equal 2012, previous_week[:year]
    assert_equal 4, previous_week[:week]
    pre1 = three.worker.get_assignment three.project, previous_week[:year], previous_week[:week]
    assert_equal 2012, pre1.from_year
    assert_equal 1, pre1.from_week
    pre2 = three.previous
    assert_equal 2012, pre2.from_year
    assert_equal 1, pre2.from_week

    assert_equal pre1, pre2
    assert_equal two, pre1
    assert_equal two, pre2
  end
end

