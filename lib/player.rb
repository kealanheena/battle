class Player

  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = 60
  end

  def receive_damage
    @health -= 10
  end

  def dead?
    @health <= 0
  end

end