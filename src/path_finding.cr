module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    nodes = graph.fetch(start, empty)

    i = 0
    while nodes.size > i
      node = nodes[i]

      return {true, [start, finish]} if node == finish

      if graph.fetch(node, empty).includes?(finish)
        return {true, [start, node, finish]}
      end

      i += 1
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
