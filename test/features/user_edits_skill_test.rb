require_relative "../test_helper"

class EditsSkillTest < FeatureTest

  def test_user_can_edit_a_skill
    SkillInventory.create(title: "Title", description: "This is my description.")

    visit '/skills'

    assert_equal '/skills', current_path

    click_link "Edit"

    assert_equal "/skills/1/edit", current_path

    fill_in "skill[title]", with: "Edited Skill"
    fill_in "skill[description]", with: "Edited Skill description"
    click_button "Submit"

    assert_equal "/skills", current_path
    assert page.has_css?("#1id")
    within("#1id") do
      assert page.has_content? "Edited Skill"
    end
  end

end
