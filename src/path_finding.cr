module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.fetch(start, empty).includes?(finish)
      return {true, [start, finish]}
    end

    nodes = graph.fetch(start, empty)

    i = 0
    if nodes.size > i
      node = nodes[i]

      if graph.fetch(node, empty).includes?(finish)
        return {true, [start, node, finish]}
      end
    end

    i = 1
    if nodes.size > i
      node = nodes[i]

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
