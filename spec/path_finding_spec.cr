require "./spec_helper"
require "../src/path_finding"

describe PathFinding do
  empty_graph = {} of Int32 => Array(Int32)
  empty = [] of Int32

  it "finds a path" do
    PathFinding.find_path(empty_graph, 1, 2)
      .should eq({false, empty})

    PathFinding.find_path(empty_graph, 2, 2)
      .should eq({true, [2]})

    PathFinding.find_path({1 => [2]}, 1, 2)
      .should eq({true, [1, 2]})

    PathFinding.find_path({1 => [2]}, 2, 3)
      .should eq({false, empty})

    PathFinding.find_path({1 => [3, 2]}, 1, 2)
      .should eq({true, [1, 2]})

    PathFinding.find_path({1 => [2], 2 => [5]}, 1, 5)
      .should eq({true, [1, 2, 5]})

    PathFinding.find_path({1 => [2], 2 => [4, 5, 6]}, 1, 5)
      .should eq({true, [1, 2, 5]})

    PathFinding.find_path({1 => [3, 2], 2 => [4, 5, 6]}, 1, 5)
      .should eq({true, [1, 2, 5]})
  end
end
