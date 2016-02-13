class PathFinding
  def self.find_path(graph, start, finish)
    new(graph, finish).find_path(start)
  end

  private getter graph, finish, visited
  def initialize(@graph, @finish)
    @visited = empty
  end

  def find_path(start)
    return {false, empty} if visited.includes?(start)
    return {true, [start]} if start == finish

    visited << start
    walk(start)
  end

  private def walk(start)
    graph.fetch(start, empty).each do |node|
      ok, path = find_path(node)
      return {true, [start] + path} if ok
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
