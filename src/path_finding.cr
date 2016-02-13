module PathFinding
  extend self

  def find_path(graph, start, finish, visited=empty)
    return {false, empty} if visited.includes?(start)
    return {true, [start]} if start == finish

    graph.fetch(start, empty).each do |node|
      ok, path = find_path(graph, node, finish, visited + [start])
      return {true, [start] + path} if ok
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
