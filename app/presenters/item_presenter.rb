class ItemPresenter
  def initialize(item)
    @item = item
  end

  # @abstract
  def serialize
    raise "serialize method is not defined in #{self.class}"
  end

  protected

  attr_reader :item
end
