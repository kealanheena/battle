class Game

  attr_reader :player_1, :player_2, :turn

  def initialize(name_1, name_2, player_1 = Player.new(name_1), player_2 = Player.new(name_2))
    @player_1 = player_1
    @player_2 = player_2
    @turn = 1
    @@instance = self
  end

  def attack(damage = rand(1..10))
    @turn.even? ? @player_1.attack(damage) : @player_2.attack(damage)
    @turn += 1
  end

  def special_attack(effect)
    @turn.even? ? @player_1.special_attack(effect) : @player_2.special_attack(effect)
    immobilised_status
  end

  def sleep_spell
    @turn.even? ? @player_1.sleep_spell : @player_2.sleep_spell
    immobilised_status
  end

  def heal_spell(points = rand(1..10))
    @turn.even? ? @player_2.heal(points) : @player_1.heal(points)
    @turn += 1
  end

  def poison_damage
    @player_1.poison_damage if poisoned?(@player_1)
    @player_2.poison_damage if poisoned?(@player_2)
  end

  def over?
    @player_1.dead? || @player_2.dead?
  end

  def self.instance
    @@instance
  end

  private

  def immobilised_status
    if immobilised?
      @turn += 2
    else
      @turn += 1
    end
  end

  def immobilised?
    @player_1.immobilised? || @player_2.immobilised?
  end

  def poisoned?(player)
    player.poisoned?
  end
  
end
