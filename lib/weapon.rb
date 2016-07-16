class Weapon
 
  attr_reader :damage, :bot
  def initialize(name, damage = 10)
    raise ArgumentError if name.class != String
    @name = name
    @bot = nil
    @damage = damage
  end

  def bot=(value)
    raise ArgumentError if value.class != BattleBot
    @bot = value
  end
end