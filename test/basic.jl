using Test

@testset "basic.jl" begin
    @testset "tally" begin
        @test AoFuji.Basic.tally([2, 1, 2, 1]) == Dict(1 => 2, 2 => 2)
        @test AoFuji.Basic.tally([4, 4, 4, 1]) == Dict(1 => 1, 4 => 3)
        @test AoFuji.Basic.tally([1, 2, 3, 4]) == Dict(1 => 1, 2 => 1, 3 => 1, 4 => 1)

        @test AoFuji.Basic.tally("baba") == Dict('a' => 2, 'b' => 2)
    end

    @testset "split_array" begin
        arr = [1, 2, 3, 4, 5]

        @test AoFuji.Basic.split_array(arr, [1]) == [[1], [2, 3, 4, 5]]
        @test AoFuji.Basic.split_array(arr, [1, 3]) == [[1], [2, 3], [4, 5]]
    end
end
