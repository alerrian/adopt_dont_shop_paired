class Favorite
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.count
  end

  def add_favorite_pet(id)
    @contents[id.to_s] = 1
  end

  def remove_pet(id)
    @contents.delete(id.to_s)
  end
end
