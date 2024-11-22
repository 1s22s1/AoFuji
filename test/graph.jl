using Test

@testset "graph.jl" begin
    @testset "bfs" begin
        @test AoFuji.Graph.bfs([[2], [3], [1]], 1) == [0, 1, 2]
        @test AoFuji.Graph.bfs([[2, 3], [3, 1], [1, 2]], 1) == [0, 1, 1]
        @test AoFuji.Graph.bfs([[2], [], [2]], 1) == [0, 1, -1]
    end
end
