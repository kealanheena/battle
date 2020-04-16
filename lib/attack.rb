class Attack

  attr_reader :player, :type

  def initialize(player, type)
    @player = player
    @type = type
  end
end
