module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    if graph.has_key?(start)
      if graph[start].first == finish
        return {true, [start, finish]}
      end
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
