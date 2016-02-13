module PathFinding
  extend self

  def find_path(graph, start, finish)
    {false, empty}
  end

  private def empty
    [] of Int32
  end
end
