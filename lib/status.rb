class Status

  attr_reader :current

  def initialize
    @current = []
  end

  def add(status)
    @current << status unless effect?(status)
  end

  def remove(status)
    @current.delete(status)
    @current
  end

  def effect?(status)
    @current.include?(status)
  end
end
