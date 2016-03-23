require_relative '../test_helper'

class UserDeletesTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_delete_a_task
    visit '/'

      click_link("New Task")

      assert_equal "/tasks/new", current_path
      fill_in 'task[title]', with: "Learn Capybara" #new.erb
      fill_in 'task[description]', with: "Its super helpful" #new.erb
      click_button("Submit")

      within(".buttons") do
        assert page.has_content?("Learn Capybara")
      end

      click_button("Eliminar")
      assert_equal "/tasks", current_path

      refute page.has_content?("Learn Capybara") #index.erb


  end
end
