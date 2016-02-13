require "./spec_helper"
require "../src/path_finding"

describe PathFinding do
  empty_graph = {} of Int32 => Array(Int32)

  it "finds a path" do
    PathFinding.find_path(empty_graph, 1, 2)
  end
end
