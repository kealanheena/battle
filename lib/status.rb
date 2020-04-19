class Status

  def initialize
    @current = []
  end

  def add(status)
    @current << status unless @current.include?(status)
  end

  def remove(status)
    []
  end
end
