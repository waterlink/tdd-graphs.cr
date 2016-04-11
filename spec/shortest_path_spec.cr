require "./spec_helper"
require "../src/shortest_path"

class PathFinding
  describe ShortestPath do
    empty_graph = {} of Int32 => Array(Int32)
    empty_path = [] of Int32

    it "is empty when graph is empty" do
      ShortestPath.find_path(empty_graph, 0, 1)
        .should eq({false, empty_path})
    end

    it "consists of one node, when start is finish" do
      ShortestPath.find_path(empty_graph, 0, 0)
        .should eq({true, [0]})
    end

    it "is empty when there is no path" do
      ShortestPath.find_path({
        0 => [1], 1 => [2], 2 => [3],
        5 => [6], 6 => [8]
      }, 0, 6).should eq({false, empty_path})
    end

    it "is two nodes, when there is a direct edge" do
      ShortestPath.find_path({
        0 => [1], 1 => [3], 2 => [3]
      }, 0, 1).should eq({true, [0, 1]})
    end

    it "is 3 nodes, when it is a correct path" do
      ShortestPath.find_path({
        0 => [2], 2 => [4]
      }, 0, 4).should eq({true, [0, 2, 4]})
    end

    it "is 3 nodes, when it is a shortest path" do
      ShortestPath.find_path({
        0 => [1, 2],
        1 => [3], 3 => [4],
        2 => [4]
      }, 0, 4).should eq({true, [0, 2, 4]})
    end

    it "is 4 nodes, when it has loops" do
      ShortestPath.find_path({
        0 => [1, 2, 3],
        1 => [4, 5], 4 => [1, 2, 3, 6], 5 => [6], 6 => [8, 10],
        2 => [7, 11], 11 => [6, 10],
        3 => [22]
      }, 0, 10).should eq({true, [0, 2, 11, 10]})
    end
  end
end
