require_relative '../../data_structures/lib/graph'


def khan_topological_sort(vertices)
  sorted_vertices = []
  queue = []
  in_edge_count = {}

  vertices.each do |vertex|
    in_edge_count[vertex] = vertex.in_edges.count
    queue << vertex if vertex.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    sorted_vertices << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      in_edge_count[to_vertex] -= 1
      queue << to_vertex if in_edge_count[to_vertex] == 0
    end
  end

  sorted_vertices
end

require 'set'

def tarjan_topological_sort(vertices)
  sorted_vertices = []
  explored = Set.new

  vertices.each do |vertex|
    dfs!(vertex, sorted_vertices, explored) unless explored.include?(vertex)
  end

  sorted_vertices
end

def dfs!(vertex, sorted, explored)
  explored.add(vertex)

  vertex.out_edges.each do |edge|
    to_vertex = edge.to_vertex
    dfs!(to_vertex, sorted, explored) unless explored.include?(to_vertex)
  end

  sorted.unshift(vertex)
end
