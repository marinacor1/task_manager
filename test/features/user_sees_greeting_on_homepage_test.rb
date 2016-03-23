require_relative "../test_helper"

class UserSeesGreetingOnHomePage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_is_welcomed
    visit '/' #visit comes from capybara

    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

end
