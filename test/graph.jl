using Test

@testset "graph.jl" begin
    @testset "bfs" begin
        @test AoFuji.Graph.bfs([[2], [3], [1]], 1) == [0, 1, 2]
        @test AoFuji.Graph.bfs([[2, 3], [3, 1], [1, 2]], 1) == [0, 1, 1]
        @test AoFuji.Graph.bfs([[2], [], [2]], 1) == [0, 1, -1]
    end

    @testset "maze_bfs" begin
        maze = [[".", ".", ".", "."], ["#", ".", ".", "."], [".", "#", ".", "#"]]

        @test AoFuji.Graph.maze_bfs(maze, 3, 4) == [0 1 2 3; -1 2 3 4; -1 -1 4 -1]
    end
end
