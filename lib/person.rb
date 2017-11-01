class Person
  attr_accessor :name, :cash

  def initialize(name = nil)
    set_name(name)
    @cash = 0
  end

  private

  def set_name(name)
    if name == nil
      raise 'Name required'
    else
      @name = name
    end
  end

end
