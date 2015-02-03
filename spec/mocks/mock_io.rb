class MockIO

  attr_accessor :puts_string, :gets_string

  def initialize
    @puts_string = ""
  end

  def puts(string)
    @puts_string = string
  end

  def gets
    return @gets_string
  end
end