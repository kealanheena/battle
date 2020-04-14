class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @turn = 1
  end

  def attack
    @turn.even? ? @player_1.receive_damage : @player_2.receive_damage
    @turn += 1
  end

end
