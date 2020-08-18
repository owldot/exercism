require 'minitest/autorun'
require 'minitest/focus'

require_relative 'linked_list'

class LinkedListTest < Minitest::Test

  def test_push_elements
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)
    linked_list.push(7)
    assert_equal 1, linked_list.get(0)
    assert_equal 7, linked_list.get(2)
    assert_equal 4, linked_list.get(1)
  end

  def test_size
    linked_list = LinkedList.new
    assert_equal 0, linked_list.size
    linked_list.push(1)
    assert_equal 1, linked_list.size
    linked_list.push(4)
    linked_list.push(7)
    linked_list.push(7)
    assert_equal 4, linked_list.size
  end

  def test_insert
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)
    linked_list.push(7)
    linked_list.push(10)
    linked_list.push(72)
    linked_list.push(22)
    linked_list.insert_after(3, 60)
    assert_equal 10, linked_list.get(3)
    assert_equal 60, linked_list.get(4)
    assert_equal 72, linked_list.get(5)
  end

  def test_insert_after_tail
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)
    linked_list.push(7)
    linked_list.push(10)
    linked_list.insert_after(3, 60)
    assert_equal 10, linked_list.get(3)
    assert_equal 60, linked_list.get(4)
    assert_raises(ArgumentError) { linked_list.get(5) }
  end

  def test_delete
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)
    linked_list.push(7)
    linked_list.push(10)
    linked_list.push(72)
    linked_list.push(22)
    assert_equal 10, linked_list.delete_at(3)
    assert_equal 7, linked_list.get(2)
    assert_equal 72, linked_list.get(3)
  end

  def test_head
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)
    linked_list.push(6)

    assert_equal 1, linked_list.delete_at(0)
    assert_equal 4, linked_list.get(0)
    assert_equal 6, linked_list.get(1)
  end

  def test_delete_tail
    linked_list = LinkedList.new
    linked_list.push(1)
    linked_list.push(4)

    assert_equal 4, linked_list.delete_at(1)
    assert_equal 1, linked_list.get(0)
  end
end
