require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    test_robot = Robot.new
    test_robot.foreign_model = true
    test_robot.needs_repairs = true
    # act
    act = test_robot.station
    # assert
    assert(act == 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    test_robot = Robot.new
    test_robot.vintage_model = true
    test_robot.needs_repairs = true
    # act
    act = test_robot.station
    # assert
    assert(act == 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    test_robot = Robot.new
    test_robot.needs_repairs = true
    # act
    act = test_robot.station
    # assert
    assert(act == 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    test_robot = Robot.new
    # act
    act = test_robot.station
    # assert
    assert(act == 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    test_robot = Robot.new
    # act
    act = test_robot.prioritize_tasks
    # assert
    assert(act == -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    test_robot = Robot.new
    test_robot.todos = [1, 3, 5]
    # act
    act = test_robot.prioritize_tasks
    # assert
    assert(act == 5)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    test_robot = Robot.new
    test_robot.day_off = true
    # act
    act = test_robot.workday?(test_robot.day_off)
    # assert
    refute(act)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    test_robot = Robot.new
    # act
    act = test_robot.workday?(test_robot.day_off)
    # assert
    refute(act)
  end

end
