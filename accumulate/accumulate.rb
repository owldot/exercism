module Enumerable
  def accumulate(&block)
    result = []
    if block_given?
      self.each { |*e| result << block.call(*e) }
    else
      return to_enum
    end
    result
  end
end