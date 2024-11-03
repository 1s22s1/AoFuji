using AoFuji
using Test

@testset "AoFuji.jl" begin
    @testset "rle" begin
        @test AoFuji.rle("abbccc") == [('a', 1), ('b', 2), ('c', 3)]
        @test AoFuji.rle("abc") == [('a', 1), ('b', 1), ('c', 1)]
        @test AoFuji.rle("") == []
    end

    @testset "bfs" begin
        @test AoFuji.bfs([[2], [3], [1]], 1) == [0, 1, 2]
        @test AoFuji.bfs([[2, 3], [3, 1], [1, 2]], 1) == [0, 1, 1]
        @test AoFuji.bfs([[2], [], [2]], 1) == [0, 1, -1]
    end

    @testset "tally" begin
        @test AoFuji.tally([2, 1, 2, 1]) == Dict(1 => 2, 2 => 2)
        @test AoFuji.tally([4, 4, 4, 1]) == Dict(1 => 1, 4 => 3)
        @test AoFuji.tally([1, 2, 3, 4]) == Dict(1 => 1, 2 => 1, 3 => 1, 4 => 1)
    end
end
