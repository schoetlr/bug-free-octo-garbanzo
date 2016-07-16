class Weapon
 
  attr_reader :damage, :bot, :name
  def initialize(name, damage = 10)
    raise ArgumentError if name.class != String
    raise ArgumentError if damage.class != Fixnum
    @name = name
    @bot = nil
    @damage = damage
  end

  def bot=(value)
    if value.class != BattleBot
      raise ArgumentError unless value.nil?
    end

    @bot = value
  end

  def picked_up?
    !!bot
  end
end