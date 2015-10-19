require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({  :title       => "#{i+1} title",
                               :description => "#{i+1} description"})
    end
  end

  def test_it_creates_a_skill
    create_skills(1)

    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal "1 title", skill.title
    assert_equal "1 description", skill.description
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_it_finds_all_skills
    create_skills(2)

    assert_equal 2, SkillInventory.all.count
  end

  def test_it_finds_a_skill_by_id
    create_skills(2)

    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal "1 title", skill.title
  end

  def test_it_updates_a_skill
    create_skills(1)
    skill = SkillInventory.find(SkillInventory.all.first.id)

    SkillInventory.update(skill.id, {title: "new title", description: "new description"})

    test_skill = SkillInventory.find(skill.id)

    assert_equal "new title", test_skill.title
    assert_equal "new description", test_skill.description
  end

  def test_it_deletes_a_skill
    create_skills(3)
    total = SkillInventory.all.count

    SkillInventory.delete(SkillInventory.all.first.id)

    assert_equal (total - 1), SkillInventory.all.count
  end
end
