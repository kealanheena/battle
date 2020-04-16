class Attack

  attr_reader :player, :type

  def initialize(player, type = 'normal')
    @player = player
    @type = type
  end
end
