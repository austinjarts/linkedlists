class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def infinite_loop?(list)
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node
    return false if hare.nil?

    hare = hare.next_node
    tortoise = tortoise.next_node
    return true if hare == tortoise
  end

  return false
end

node1 = LinkedListNode.new(9)
node2 = LinkedListNode.new(62, node1)
node3 = LinkedListNode.new(34, node2)


print_values(node3)
puts "---------"
reverse_list(node3)
print_values(node1)
puts "---------"
puts infinite_loop?(node3)
node1.next_node = node3 # creates an infinite loop
puts infinite_loop?(node3)