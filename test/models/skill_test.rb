require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    skill = Skill.new({ :id          => 1,
                        :title       => "My Skill",
                        :description => "get stuff done"})

    assert_equal 1, skill.id
    assert_equal "My Skill", skill.title
    assert_equal "get stuff done", skill.description
  end
end
