class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @turn = 1
    @@instance = self
  end

  def attack(damage = rand(1..10))
    @turn.even? ? @player_1.attack(damage) : @player_2.attack(damage)
    @turn += 1
  end

  def poison_attack
    @turn.even? ? @player_1.poison_attack : @player_2.poison_attack
    @turn += 1
  end

  def electric_attack
    @turn.even? ? @player_1.electric_attack : @player_2.electric_attack
    paralysis_status
    @turn += 1
  end

  def poison_damage
    @player_1.get_damage(rand(1..2)) if @player_1.poison
    @player_2.get_damage(rand(1..2)) if @player_2.poison  
  end

  def self.instance
    @@instance
  end

  private

  def paralysis_status
    @turn += 1 if @player_1.paralysed || @player_2.paralysed
  end

end
