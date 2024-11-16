using Test

@testset "graph.jl" begin
    @testset "bitsearch" begin
        @test AoFuji.bitsearch([1]) |> sort == [[], [1]] |> sort
        @test AoFuji.bitsearch([1, 2]) |> sort == [[], [1], [2], [1, 2]] |> sort
        @test AoFuji.bitsearch([1, 2, 3]) |> sort ==
              [[], [1], [2], [3], [1, 2], [2, 3], [1, 3], [1, 2, 3]] |> sort
    end

    @testset "rle" begin
        @test AoFuji.rle("abbccc") == [['a', 1], ['b', 2], ['c', 3]]
        @test AoFuji.rle("abc") == [['a', 1], ['b', 1], ['c', 1]]
        @test AoFuji.rle("") == []
    end
end
