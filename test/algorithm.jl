using Test

@testset "algorithm.jl" begin
    @testset "bitsearch" begin
        @test AoFuji.Algorithm.bitsearch([1]) |> sort == [[], [1]] |> sort
        @test AoFuji.Algorithm.bitsearch([1, 2]) |> sort == [[], [1], [2], [1, 2]] |> sort
        @test AoFuji.Algorithm.bitsearch([1, 2, 3]) |> sort ==
              [[], [1], [2], [3], [1, 2], [2, 3], [1, 3], [1, 2, 3]] |> sort
    end

    @testset "rle" begin
        @test AoFuji.Algorithm.rle("abbccc") == [['a', 1], ['b', 2], ['c', 3]]
        @test AoFuji.Algorithm.rle("abc") == [['a', 1], ['b', 1], ['c', 1]]
        @test AoFuji.Algorithm.rle("") == []

        @test AoFuji.Algorithm.rle([2, 3, 1, 1, 2, 2, 1, 1]) ==
              [[2, 1], [3, 1], [1, 2], [2, 2], [1, 2]]
    end
end
