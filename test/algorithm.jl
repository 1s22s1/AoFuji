using Test

@testset "algorithm.jl" begin
    @testset "bitsearch" begin
        @test AoFuji.Algorithm.bitsearch([1]) |> sort == [[], [1]] |> sort
        @test AoFuji.Algorithm.bitsearch([1, 2]) |> sort == [[], [1], [2], [1, 2]] |> sort
        @test AoFuji.Algorithm.bitsearch([1, 2, 3]) |> sort ==
              [[], [1], [2], [3], [1, 2], [2, 3], [1, 3], [1, 2, 3]] |> sort
    end

    @testset "runlengthencodeing" begin
        @test AoFuji.Algorithm.runlengthencodeing("abbccc") ==
              [['a', 1], ['b', 2], ['c', 3]]
        @test AoFuji.Algorithm.runlengthencodeing("abc") == [['a', 1], ['b', 1], ['c', 1]]
        @test AoFuji.Algorithm.runlengthencodeing("") == []

        @test AoFuji.Algorithm.runlengthencodeing([2, 3, 1, 1, 2, 2, 1, 1]) ==
              [[2, 1], [3, 1], [1, 2], [2, 2], [1, 2]]
    end
end
