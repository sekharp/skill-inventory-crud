class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.dataset
    database.from(:skills)
  end

  def self.create(skill)
    dataset.insert(skill)
  end

  def self.update(id, data)
    skill = dataset.where(id: id)
    skill.update(data)
  end

  def self.delete(id)
    dataset.where(id: id).delete
  end

  def self.all
    skills = dataset.to_a
    skills.map do |skill|
      Skill.new(skill)
    end
  end

  def self.find(id)
    skill = dataset.where(id: id).to_a.first
    Skill.new(skill)
  end
end
