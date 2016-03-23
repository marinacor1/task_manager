require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'

ENV['RACK_ENV'] ||= 'test'
#if run shotgun defaults in developer mode, else when runs in test sets it equal to test environment

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'

module TestHelpers
  def teardown
    task_manager.delete_all
    super #minitest after every test will tear down
  end

  def task_manager #will overwrite what was database before. Manage data.
    database = YAML::Store.new('db/task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end
