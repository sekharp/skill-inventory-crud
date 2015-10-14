require 'yaml/store'
require_relative 'skill'

class SkillInventory
  def self.database
    @database ||= YAML::Store.new("db/skill_inventory")
  end

  def self.all
    raw_skills.map { |data| Skill.new(data) }
  end

end
