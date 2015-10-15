require_relative "../test_helper"

class CreateSkillTest < FeatureTest

  def test_user_can_create_a_skill
    visit '/'

    assert_equal '/', current_path

    click_on 'New Skill'

    fill_in 'skill[title]', with: 'Make cookies'
    fill_in 'skill[description]', with: 'Bake them with chocolate chips'

    click_on 'Submit'

    assert_equal '/skills', current_path

    within(".container") do
      assert has_content?("Make cookies")
    end
  end

end
