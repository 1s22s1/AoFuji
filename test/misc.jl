using Test

@testset "misc.jl" begin
    @testset "tally" begin
        @test AoFuji.tally([2, 1, 2, 1]) == Dict(1 => 2, 2 => 2)
        @test AoFuji.tally([4, 4, 4, 1]) == Dict(1 => 1, 4 => 3)
        @test AoFuji.tally([1, 2, 3, 4]) == Dict(1 => 1, 2 => 1, 3 => 1, 4 => 1)

        @test AoFuji.tally("baba") == Dict('a' => 2, 'b' => 2)
    end
end
