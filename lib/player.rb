class Player

  attr_reader :name, :health, :poison, :paralysed, :sleeping

  def initialize(name)
    @name = name
    @health = 60
  end

  def get_damage(damage = 10)
    @health -= damage
  end

  def attack(damage)
    reset_status
    get_damage(damage)
  end

  def poison_attack
    reset_status
    @poison = true if rand(1..10) == 10
    get_damage(5)
  end

  def electric_attack
    reset_status
    @paralysed = true if rand(1..8) == 8
    get_damage(5)
  end

  def sleep_spell
    reset_status
    @sleeping = true if rand(1..10) != 10
  end

  def dead?
    @health <= 0
  end

  private

  def reset_status
    @paralysed = false
    @sleeping = false
  end

end
