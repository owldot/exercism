class Bst
  attr_reader :data, :left, :right

  def initialize(number)
    @data = number
    @left = nil
    @right = nil
  end

  def insert(number)
    if number <= data
      if left.nil?
        @left = Bst.new(number)
      else
        left.insert(number)
      end
    else
      if right.nil?
        @right = Bst.new(number)
      else
        right.insert(number)
      end
    end
  end

  def find_smallest(node = self)
    if node.left.nil?
      return node
    else
      find_smallest(node.left)
    end
  end

  def each(&block)
    if block_given?
      traverse(self, &block)
    else
      to_a.to_enum
    end
  end

  def each_with_level(&block)
    traverse_with_level(self, 0, &block)
  end

  def to_a
    arr = []
    traverse(self) { |e| arr << e }
    arr
  end

  def traverse(node, &block)
    if node.left
      traverse(node.left, &block)
    end

    block.call(node.data)

    if node.right
      traverse(node.right, &block)
    end
  end

  def traverse_with_level(node, level, &block)
    if node.left
      traverse_with_level(node.left, level + 1, &block)
    end

    block.call(node.data, level)

    if node.right
      traverse_with_level(node.right, level + 1, &block)
    end
  end

  def search(number)
    node = self
    loop do
      if node.nil?
        return false
      end

      if node.data == number
        return true
      end

      node = if number < node.data
               node.left
             else
               node.right
             end

    end
  end

  def levels
    result = []

    self.each_with_level do |number, level|
      result[level] ||= []
      result[level] << number
    end

    result.reverse
  end
end
