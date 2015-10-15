require_relative "../test_helper"

class DeleteSkillTest < FeatureTest

  def test_user_can_delete_a_skill
    SkillInventory.create(title: "Title", description: "This is my description.")

    visit '/skills'

    assert_equal '/skills', current_path

    click_on "Delete"

    assert_equal "/skills", current_path

    refute page.has_css?("#1id")
  end

end
