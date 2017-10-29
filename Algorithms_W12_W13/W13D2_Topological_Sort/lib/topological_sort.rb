require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  # Khan's algorithm - remove nodes that have zero in-degree
  # O(|V| + |E|)
  sorted = []
  queue = []
  in_edge_count = Hash.new(0)

  # O(|V|)
  vertices.each do |vertex|
    in_edge_count[vertex] = vertex.in_edges.size
    if vertex.in_edges.empty?
      queue << vertex
    end
  end

  # O(|E|)
  until queue.empty?
    curr_vertex = queue.shift
    sorted << curr_vertex

    curr_vertex.out_edges.each do |edge|
      neighbor = edge.to_vertex
      in_edge_count[neighbor] -= 1

      if in_edge_count[neighbor].zero?
        queue << neighbor
      end

      edge.destroy!
    end
  end

  if sorted.length == vertices.length
    sorted
  else
    []
  end

  # Tarjan's Algorithm (depth-first search)

end
