class Element
  attr_reader :datum
  attr_accessor :next # don't agree with this test

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(array = nil)
    @head = nil
    @tail = @head

    if array
      array.each do |value|
        push(Element.new(value))
      end
    end
  end

  def push(element)
    if @tail.nil?
      @tail = element
      @head = element
    else
      @tail.next = element
      @tail = element
    end
    self
  end

  def pop
    current = @head

    while !current.nil? && current.next != @tail
      current = current.next
    end

    # we are on the node before tail
    tail = @tail
    @tail = current

    tail
  end

  def to_a
    result = []
    loop do
      node = pop

      if node.nil?
        break
      end

      result << node.datum
    end

    result
  end

  def reverse!
    new_head = nil
    new_tail = @head

    while @head
      next_el = @head.next
      @head.next = new_head
      new_head = @head

      @head = next_el
    end

    @head = new_head
    @tail = new_tail

    self
  end
end
