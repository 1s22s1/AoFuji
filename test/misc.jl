using Test

@testset "misc.jl" begin
    @test iseven(1) == false
    @test iseven(2) == true
end
