class AdjacentNode
  attr_accessor :data

  def initialize(data)
    @vertex = data
    @next = nil
  end
end

class Graph
  attr_accessor :vertex

  def initialize(vertex)
    @vertex = vertex
    @graph = Array.new(vertex)
  end

  def add_edge(source, destination)
    node = AdjacentNode.new(destination)
    node.next = @graph[source]

    node = AdjacentNode.new(source)
    node.next = @graph[destination]
    @graph[destination] = node
  end

  def print_graph
    vertex.each do |v|
      print("Adjacency list of vertex #{v} head")
      vertices = @graph[v]
      while vertices
        print("Vertex #{vertices.next}")
        vertices = vertices.next
    end
  end
end

vertex = 10
graph = Graph.new(vertex)
graph.add_edge(0, 1)
graph.add_edge(0, 4)
graph.add_edge(1, 2)
graph.add_edge(1, 3)
graph.add_edge(1, 4)
