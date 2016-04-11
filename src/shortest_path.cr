class PathFinding
  class ShortestPath
    alias PathProtocol = Path|NoPath
    alias ChallengeHandler = Proc(PathProtocol, Int32, PathProtocol)

    record Path, path do
      SIZE_OF_START_NODE = 1

      def self.build(ok, path)
        return NoPath.new unless ok
        Path.new(path)
      end

      def to_tuple
        {ok?, path}
      end

      delegate size, path

      def ok?
        true
      end

      def better_than?(champion)
        return true unless champion.ok?
        self.size + SIZE_OF_START_NODE < champion.size
      end

      def challenge(champion, start = 0)
        if better_than?(champion)
          return Path.new([start] + path)
        end

        return champion
      end
    end

    struct NoPath < Path
      def initialize
        @path = [] of Int32
      end

      def ok?
        false
      end

      def better_than?(champion)
        false
      end
    end

    def self.find_path(graph, start, finish)
      new(graph, finish).find_path(start).to_tuple
    end

    @graph : Hash(Int32, Array(Int32))
    @finish : Int32
    @visited : Array(Int32)
    private getter graph, finish, visited
    def initialize(@graph, @finish)
      @visited = empty
    end

    def find_path(start) : Path
      return not_found if visited?(start)
      return found([start]) if finished?(start)

      tournament_while_visited_for(start) do |champion, node|
        next_champion(champion, start, node)
      end
    end

    private def tournament_while_visited_for(start, &block: ChallengeHandler)
      while_visited(start) do
        tournament_for(start, &block)
      end
    end

    private def tournament_for(start, &block : ChallengeHandler)
      edges_of(start).reduce(not_found, &block)
    end

    private def next_champion(champion, start, node)
      find_path(node).challenge(champion, start: start)
    end

    private def edges_of(node)
      graph.fetch(node, empty)
    end

    private def found(path)
      Path.build(true, path)
    end

    private def not_found
      Path.build(false, empty)
    end

    private def visited?(node)
      visited.includes?(node)
    end

    private def finished?(node)
      node == finish
    end

    private def while_visited(node)
      visited << node
      result = yield
      visited.delete(node)
      result
    end

    private def empty
      [] of Int32
    end
  end
end
