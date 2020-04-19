require_relative 'status'

class Player

  attr_reader :name, :health, :status

  def initialize(name, status = Status.new)
    @name = name
    @health = 60
    @status = status
  end

  def apply_damage(damage = 10)
    @health -= damage
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

  def dead?
    @health <= 0
  end

  private

  def apply_damage(damage)
    @health -= damage
  end

  def add_status(effect)
    @status.add(effect) if rand(1..10) == 10
  end

  def reset_status
    @status.remove('immobilised')
  end

end
