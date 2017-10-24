# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.
# N.B. this is how `npm` works.
require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  max_id = arr.max_by { |el| el[0] }[0]
  vertices = Hash.new

  (1..max_id).each do |id|
    vertices[id] = Vertex.new(id)
  end

  arr.each do |tuple|
    package_id = tuple[0]
    dependency = tuple[1]
    to_vertex = vertices[package_id]
    from_vertex = vertices[dependency]

    p Edge.new(from_vertex, to_vertex)
  end

  vertices.values
  p topological_sort(vertices.values)
end
