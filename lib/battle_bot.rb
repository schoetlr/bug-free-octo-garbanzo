class BattleBot
  attr_reader :name, :health, :enemies, :weapon
  def initialize(name, health = 100)
    @name = name
    @health = health
    @enemies = []
    @weapon = nil
    @alive = true
  end

  def dead?
    health > 0 ? false : true
  end

  def has_weapon?
    if weapon 
      true
    else
      false
    end
  end

  def pick_up(weapon)
    raise ArgumentError if weapon.class != Weapon
    if self.weapon != nil
      return nil
    else
      @weapon = weapon
      self.weapon.bot = self
      self.weapon
    end
  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil

  end

  def take_damage(damage)
    raise ArgumentError if damage.class != Fixnum
    @health -= damage
    @health = @health < 0 ? 0 : @health
    self.health
  end

  def heal
    if self.health > 0
      @health += 10
      @health = @health > 100 ? 100 : @health
      @health
    else
      @health
    end

  end


  def attack(enemy)
    raise ArgumentError if enemy.class != BattleBot
    raise ArgumentError if enemy.object_id == self.object_id
    raise ArgumentError if self.weapon == nil
    enemy.receive_attack_from(self)

  end

  def receive_attack_from(enemy)
    if enemy.class != BattleBot || enemy.object_id == self.object_id || enemy.weapon == nil
      raise ArgumentError
    end
    self.take_damage(enemy.weapon.damage)
    @enemies.push(enemy) unless @enemies.include?(enemy)
  end

end