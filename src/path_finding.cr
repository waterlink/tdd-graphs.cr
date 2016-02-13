class PathFinding
  def self.find_path(graph, start, finish)
    new(graph, finish).find_path(start)
  end

  private getter graph, finish
  def initialize(@graph, @finish)
  end

  def find_path(start, visited=empty)
    return {false, empty} if visited.includes?(start)
    return {true, [start]} if start == finish

    graph.fetch(start, empty).each do |node|
      ok, path = find_path(node, visited + [start])
      return {true, [start] + path} if ok
    end

    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
