module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    graph.fetch(start, empty).each do |node|
      return {true, [start, finish]} if node == finish

      if graph.fetch(node, empty).includes?(finish)
        return {true, [start, node, finish]}
      end
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
