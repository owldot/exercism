class Array
  def keep(&block)
    result = []

    if block_given?
      self.each do |el|
        if block.call(el)
          result << el
        end
      end
    end

    result
  end

  def discard(&block)
    result = []

    if block_given?
      self.each do |el|
        unless block.call(el)
          result << el
        end
      end
    end

    result
  end
end