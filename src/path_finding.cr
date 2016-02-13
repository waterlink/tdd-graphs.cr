module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.fetch(start, empty).includes?(finish)
      return {true, [start, finish]}
    end

    nodes = graph[start]

    if nodes.size > 0
      node = nodes[0]

      if graph.fetch(node, empty).includes?(finish)
        return {true, [start, node, finish]}
      end
    end

    if nodes.size > 1
      node = nodes[1]

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
