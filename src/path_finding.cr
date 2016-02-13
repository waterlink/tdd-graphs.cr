module PathFinding
  extend self

  def find_path(graph, start, finish)
    return {true, [start]} if start == finish

    graph.fetch(start, empty).each do |node|
      ok, path = find_path(graph, node, finish)
      return {true, [start] + path} if ok
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
