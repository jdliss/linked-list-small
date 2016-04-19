class Node
  attr_accessor :next, :data
  def initialize(string = nil)
    @data = string
    @next = nil
  end
end

class LinkedList
  def initialize(string)
    @head = Node.new(string)
  end

  def count(currentNode = @head)
    currentNode.next ? 1 + count(currentNode.next) : 1
  end

  def append(string, currentNode = @head)
    currentNode.next ? append(string, currentNode.next) : currentNode.next = Node.new(string)
  end

  def printList(currentNode = @head)
    puts currentNode.data
    printList(currentNode.next) if currentNode.next
  end

  def tail(currentNode = @head)
    currentNode.next ? tail(currentNode.next) : currentNode
  end

  def find_parent(string, currentNode = @head)
    currentNode.next && currentNode.next.data == string ? currentNode : currentNode.next ? find_parent(string, currentNode.next) : nil
  end

  def find(string)
    find_parent(string).next
  end

  def pop_back
    find_parent((tailNode = tail(@head)).data).next = nil
    tailNode
  end

  def pop_front
    headNode = @head
    @head = @head.next
    headNode
  end

  def pop
    pop_back
  end

  def add(string)
    string.split(", ").each { |str| append(str) }
  end

  def delete(string)
    @head.data == string ? pop_front : find_parent(string).next = find(string).next
  end
end
