#could have happy path
#could have sad path
require_relative "../test_helper"

class UserSeesGreetingOnHomePage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_task
    visit '/' #visit comes from capybara
    click_link("New Task")
    assert_equal "/tasks/new", current_path

    fill_in 'task[title]', with: "Learn Capybara"
    fill_in 'task[description]', with: "Its super helpful"

    click_button("Submit")

    assert_equal "/tasks", current_path
    within("#greeting") do
      assert page.has_content?("Learn Capybara")
    end
  end

end
