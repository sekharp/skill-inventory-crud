require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({  :title       => "My title #{i+1}",
                               :description => "get stuff done #{i+1}"})
    end
  end

  def test_skill_is_created
    create_skills(1)

    skill = SkillInventory.find(1)

    assert_equal 1, skill.id
    assert_equal "My title 1", skill.title
    assert_equal "get stuff done 1", skill.description
  end

  def test_returns_all_skills
    create_skills(2)

    skills = SkillInventory.all

    assert_equal 2, skills.count
    assert skills.all? { |skill| skill.is_a?(Skill) }
  end

  def test_skill_can_be_updated
    SkillInventory.create({  :title              => "My title",
                             :description        => "get stuff done"})

    SkillInventory.update(1, {      :title       => "Updated title",
                                    :description => "moar stuff"})
    updated_skill = SkillInventory.find(1)

    assert_equal 1, updated_skill.id
    assert_equal "Updated title", updated_skill.title
    assert_equal "moar stuff", updated_skill.description
  end

  def test_skill_can_be_deleted
    create_skills(2)

    SkillInventory.delete(1)

    assert_equal 1, SkillInventory.all.count
  end

  def test_skill_can_be_found_by_id
    create_skills(3)
    skill = SkillInventory.find(2)

    assert_equal 2, skill.id
    assert_equal "My title 2", skill.title
    assert_equal "get stuff done 2", skill.description
  end

end
