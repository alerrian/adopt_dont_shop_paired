class Favorite
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents
    if @contents == nil
      0
    end

  end

  def total_count
    if @contents == nil
      0
    else
      @contents.values.sum
    end
  end

  def delete_pet(id)
    @contents.delete(id.to_s)
  end
end
