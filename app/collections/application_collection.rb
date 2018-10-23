class ApplicationCollection
  def initialize(current_user)
    @current_user = current_user
  end

  # @abstract
  def filter
    raise "filter method is undefined in class #{self.class}"
  end

  protected

  attr_reader :current_user
end
