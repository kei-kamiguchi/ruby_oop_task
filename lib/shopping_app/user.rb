require_relative "item_manager"

class User
  include ItemManager

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
