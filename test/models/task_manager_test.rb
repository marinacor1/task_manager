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

  def test_it_returns__all_info_for_initial
    task_manager.create({:title => 'eat', :description => 'i love food'})
    all = task_manager.all
    assert_equal Task, all.first.class
    assert_equal 'eat', all.first.title

  end
end
