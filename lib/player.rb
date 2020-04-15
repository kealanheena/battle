class Player

  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = 60
  end

  def receive_damage(damage = 10)
    @health -= damage
  end

  def dead?
    @health <= 0
  end

end
