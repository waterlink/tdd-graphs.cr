module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    graph.fetch(start, empty).each do |node|
      return {true, [start, finish]} if node == finish

      graph.fetch(node, empty).each do |node2|
        return {true, [start, node, node2, finish]} if node == finish
      end
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
