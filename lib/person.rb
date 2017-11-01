class Person
  attr_accessor :name

  def initialize(name = nil)
    set_name(name)
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
