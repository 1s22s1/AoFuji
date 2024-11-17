using Test

@testset "graph.jl" begin
    @testset "bfs" begin
        @test AoFuji.Graph.bfs([[2], [3], [1]], 1) == [0, 1, 2]
        @test AoFuji.Graph.bfs([[2, 3], [3, 1], [1, 2]], 1) == [0, 1, 1]
        @test AoFuji.Graph.bfs([[2], [], [2]], 1) == [0, 1, -1]
    end

    @testset "isbipartialgraph" begin
        @test AoFuji.Graph.isbipartialgraph([[2, 4], [3, 5], [2], [1, 5], [2, 4]]) == true
        @test AoFuji.Graph.isbipartialgraph([
            [2, 5],
            [1, 3, 5],
            [2, 4],
            [3, 5],
            [1, 2, 4],
        ]) == false
    end
end
