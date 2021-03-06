require 'rspec'
require 'topological_sort'

describe 'TopologicalSort' do
  let(:v1) { Vertex.new("Vertex One") }
  let(:v2) { Vertex.new("Vertex Two") }
  let(:v3) { Vertex.new("Vertex Three") }
  let(:v4) { Vertex.new("Vertex Four") }
  let(:vertices) { [] }

  before(:each) do
    vertices.push(v1, v2, v3, v4)
    Edge.new(v1, v2)
    Edge.new(v1, v3)
    Edge.new(v2, v4)
    Edge.new(v3, v4)
  end

  it "khan's topological sort sorts the vertices" do
    solutions = [
      [v1, v2, v3, v4],
      [v1, v3, v2, v4]
    ]

    20.times do
      expect(solutions).to include(khan_topological_sort(vertices.shuffle))
    end
  end

  it "tarjan's topological sort sorts the vertices" do
    solutions = [
      [v1, v2, v3, v4],
      [v1, v3, v2, v4]
    ]

    20.times do
      expect(solutions).to include(tarjan_topological_sort(vertices.shuffle))
    end
  end
end
