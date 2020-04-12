class Game

  attr_reader :player_1, :player_2

  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @counter = 1
  end

  def attack
    @counter.even? ? @player_1.receive_damage : @player_2.receive_damage
    @counter += 1
  end

end
