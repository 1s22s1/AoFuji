using Test

@testset "graph.jl" begin
    @testset "bfs" begin
        @test AoFuji.Graph.bfs([[2], [3], [1]], [1]) == [0, 1, 2]
        @test AoFuji.Graph.bfs([[2, 3], [3, 1], [1, 2]], [1]) == [0, 1, 1]
        @test AoFuji.Graph.bfs([[2], Int[], [2]], [1]) == [0, 1, -1]

        graph = [[2], [1, 3], [2, 4], [3, 5], [4]]
        @test AoFuji.Graph.bfs(graph, [1, 5]) == [0, 1, 2, 1, 0]
    end

    @testset "maze_bfs" begin
        maze1 = [split("....", ""), split("#...", ""), split(".#.#", "")]

        @test AoFuji.Graph.maze_bfs(maze1, [[1, 1]]) == [0 1 2 3; -1 2 3 4; -1 -1 4 -1]
        @test AoFuji.Graph.maze_bfs(maze1, [[1, 1], [2, 4]]) == [0 1 2 1; -1 2 1 0; -1 -1 2 -1]

        maze2 = [split("...", ""), split("#..", "")]
        @test AoFuji.Graph.maze_bfs(maze2, [[1, 1]]) == [0 1 2; -1 2 3]
    end
end
