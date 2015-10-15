require_relative "../test_helper"

class GreetingTest < FeatureTest

  def test_user_can_see_the_greeting
    visit '/'

    within('#greeting') do
      assert page.has_content?("Welcome to your Skill Inventory!")
    end
  end

end
