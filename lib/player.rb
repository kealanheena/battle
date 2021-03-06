require_relative 'status'

class Player

  MAX_HEALTH = 60

  attr_reader :name, :health

  def initialize(name, status = Status.new)
    @name = name
    @max_health = MAX_HEALTH
    @health = 60
    @status = status
  end
  
  def attack(damage)
    reset_status
    apply_damage(damage)
  end

  def special_attack(effect)
    reset_status
    add_status(effect)
    apply_damage(5)
  end

  def sleep_spell
    @status.add('immobilised') if rand(1..10) != 10
  end

  def heal(points)
    over_max?(points) ? @health = @max_health :  @health += points
  end

  def poison_damage
    apply_damage(1) if poisoned?
  end

  def dead?
    @health <= 0
  end

  def poisoned?
    effects.include?('poisoned')
  end

  def immobilised?
    effects.include?('immobilised')
  end

  private

  def effects
    @status.current
  end

  def apply_damage(damage)
    @health -= damage
  end

  def add_status(effect)
    @status.add(effect) if rand(1..10) == 10
  end

  def reset_status
    @status.remove('immobilised')
  end

  def over_max?(points)
    @health + points > @max_health
  end

end
