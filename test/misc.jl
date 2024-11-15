using Test
using Printf

@testset "misc.jl" begin
    @testset "tally" begin
        @test AoFuji.tally([2, 1, 2, 1]) == Dict(1 => 2, 2 => 2)
        @test AoFuji.tally([4, 4, 4, 1]) == Dict(1 => 1, 4 => 3)
        @test AoFuji.tally([1, 2, 3, 4]) == Dict(1 => 1, 2 => 1, 3 => 1, 4 => 1)

        @test AoFuji.tally("baba") == Dict('a' => 2, 'b' => 2)
    end

    @testset "8進数の11を10進数へ変換" begin
        @test parse(Int, "11", base = 8) == 9
    end

    @testset "10進数の10を9進数へ変換" begin
        @test string(10, base = 9) == "11"
    end

    @testset "N桁の数字と一致" begin
        num = 3

        @test occursin(Regex("\\d{$num}"), "12") == false
        @test occursin(Regex("\\d{$num}"), "123") == true
    end

    @testset "配列から3以上5以下の要素を取得" begin
        arr = collect(1:10)

        @test arr[3 .≤ arr .≤ 5] == [3, 4, 5]
    end

    @testset "原点からの距離" begin
        @test hypot(1, 2) == 2.23606797749979
    end
end
