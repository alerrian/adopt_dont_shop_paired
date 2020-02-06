class Favorite
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents
  end

  def total_count
    if @contents == nil
      0
    else
      @contents.values.sum
    end
  end
end
