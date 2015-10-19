require_relative '../test_helper'

class UserSeesAllSkillsTest < FeatureTest

  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :title       => "#{i+1} title",
                              :description => "#{i+1} description"})
    end
  end

  def test_new_skill_creation
    visit("/")
    click_link("New Skill")

    fill_in("skill-title", with: "new skill")
    fill_in("skill-description", with: "new description")
    assert_equal "/skills/new", current_path
    click_button("Create Skill")
    assert_equal "/skills", current_path

    within(".container") do
      assert page.has_content?("new skill")
    end
  end

  def test_user_can_edit_a_skill
    create_skills(1)
    skill = SkillInventory.all.last

    visit "/skills"
    click_link("Edit")
    fill_in("skill-title", with: "new skill edited")
    fill_in("skill-description", with: "new description edited")
    click_button("Update Skill")

    assert_equal "/skills/#{skill.id}", current_path
    within(".container") do
      assert page.has_content?("new skill edited")
    end
  end

  def test_user_can_delete_a_skill
    create_skills(1)

    visit "/skills"
    click_button("delete")

    refute page.has_content?("new skill")
  end

  def test_a_user_can_see_a_single_skill
    create_skills(1)
    skill = SkillInventory.all.last

    visit "/skills"

    click_link("1 title")
    assert_equal "/skills/#{skill.id}", current_path
    assert page.has_content?("1 description")
  end
end
