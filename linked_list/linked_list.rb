class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  def initialize()
    @head = nil
    @tail = @head
  end

  def get(index)
    current_node = at(index)
    current_node.value
  end

  def set(value, index)
    current_node = at(index)
    current_node.value = value
  end

  def push(value)
    new_node = Node.new(value)
    if @tail.nil?
      @tail = new_node
      @head = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
  end

  def delete_at(index)
    if index == 0
      node_to_delete = @head
      @head = node_to_delete.next
      return node_to_delete.value
    end

    previous_node = at(index - 1)
    node_to_delete = previous_node.next
    previous_node.next = node_to_delete.next
    node_to_delete.value
  end

  def insert_after(index, value)
    current_node = at(index)
    next_node = current_node.next
    new_node = Node.new(value)
    new_node.next = next_node
    current_node.next = new_node
  end

  def size
    size = 0
    current_node = @head

    while current_node
      current_node = current_node.next
      size += 1
    end

    size
  end

  private

  def at(index)
    current_index = 0
    current_node = @head

    while current_node && current_index != index
      current_node = current_node.next
      current_index += 1
    end

    if index > current_index || current_node.nil?
      raise ArgumentError
    end

    current_node
  end
end
