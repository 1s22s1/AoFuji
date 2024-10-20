using AoFuji
using Test

@testset "AoFuji.jl" begin
    @testset "rle" begin
        @test AoFuji.rle("aabbbaad") == [('a', 2), ('b', 3), ('a', 2), ('d', 1)]
        @test AoFuji.rle("aabbbbbbbbbbbbxyza") ==
              [('a', 2), ('b', 12), ('x', 1), ('y', 1), ('z', 1), ('a', 1)]
        @test AoFuji.rle("edcba") == [('e', 1), ('d', 1), ('c', 1), ('b', 1), ('a', 1)]
    end

    @testset "bfs" begin
        @test AoFuji.bfs([[2], [3], [1]], 1) == [0, 1, 2]
        @test AoFuji.bfs([[2, 3], [3, 1], [1, 2]], 1) == [0, 1, 1]
        @test AoFuji.bfs([[2], [], [2]], 1) == [0, 1, -1]
    end
end
