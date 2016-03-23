require_relative '../test_helper'

class UserEditsaTask < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_task
    visit '/'

      click_link("New Task")
      
      assert_equal "/tasks/new", current_path
      fill_in 'task[title]', with: "Learn Capybara" #new.erb
      fill_in 'task[description]', with: "Its super helpful" #new.erb
      click_button("Submit")

    visit '/tasks'

      click_link("Editar")
      assert_equal "/tasks/1/edit", current_path

      fill_in 'task[title]', with: "Sing and Dance" #edit.erb
      fill_in 'task[description]', with: "Its super fun" #edit.erb
      click_button("Submit")

    assert_equal "/tasks/1", current_path #edit.erb ??

    within(".edits") do
      assert page.has_content?("Sing and Dance") #index.erb
    end
  end
end
