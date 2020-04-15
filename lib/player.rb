class Player

  attr_reader :name, :health, :poison

  def initialize(name)
    @name = name
    @health = 60
  end

  def get_damage(damage = 10)
    @health -= damage
  end

  def poison_attack
    get_damage(5)
    @poison = true if rand(1..10) == 1
  end

  def dead?
    @health <= 0
  end

end
