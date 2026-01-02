path = './t.txt'
File.write(path, "foo \nbar \nbaz")

f = File.open(path)
puts f.readlines
f.rewind

File.open(path) {|l| puts l.readlines} # using code block

# idea to convert hash to array
h = {a: 0, b: 1, c: 2}
def hash_to_arr(h)
  harr = []
  h.each {|key, value| harr.push(key, value)}
  return harr
end
p hash_to_arr h

# conversion of array to hash
a = ['x','y','z']
ahash = {}
i = 0
while i < a.length do
    ahash[i] = a[i]
    i += 1
end
p ahash

# arr of sixteen numbers
ar = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
sli = []
ar.each { |e|
    sli.push(e)
    if sli.length == 4
      p sli
      sli.clear
    end
}

ar.each_slice(4) {|a| p a}

# given by book
class BasicTree
  attr_accessor :children, :node_name
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# hash tree to array form
module TreeToArray
  def hasht_to_arrt(t)
    return [] if not t.keys.any?
    children = []
    t.each_key do |k|
      children.push(BasicTree.new(k, hasht_to_arrt(t[k])))
    end
    return children
  end
end

class Tree
  include TreeToArray
  attr_accessor :children, :node_name
  def initialize(tree={})
    @node_name = tree.keys[0]
    @children = hasht_to_arrt(tree[@node_name])
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end

t = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }
tree = Tree.new(t)

tree.visit_all {|node| puts node.node_name}

f.each_line {|l| puts l if /ba/.match?(l)}