require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers
  def test_it_creates_a_task
    task_manager.create({
      :title       => "a title",
      :description => "a description"
    })

    task = task_manager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
    refute task.id == 2
  end

  def test_it_returns__empty_array_for_initial_all
    all = task_manager.all
    assert_equal [], all
  end

  def test_it_returns__all_info_for_all
    task_manager.create({:title => 'eat', :description => 'i love food'})
    task_manager.create({:title => 'swim', :description => '30 minute laps'})
    task_manager.create({:title => 'yoga', :description => 'yoga sculpt at 6pm'})
    task_manager.create({:title => 'grocery shopping', :description => 'need milk'})

    all = task_manager.all
    assert_equal Task, all.first.class
    assert_equal 'eat', all.first.title
    assert_equal 'need milk', all.last.description
    # assert_equal 4, all.count
  end
end
