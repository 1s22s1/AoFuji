using Test
using IterTools

@testset "misc.jl" begin
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

    @testset "3以上の要素の最初の添字を取得" begin
        @test searchsortedfirst([1, 2, 3, 4, 5, 6], 3) == 3
        @test searchsortedfirst([1, 2, 2, 3, 3, 3], 3) == 4
        @test searchsortedfirst([1, 2], 3) == 3
    end

    @testset "3未満の要素の最後の要素の添字を取得" begin
        @test searchsortedlast([1, 2, 3, 4, 5, 6], 3) == 3
        @test searchsortedlast([1, 2, 2, 3, 3, 3], 3) == 6
        @test searchsortedlast([1, 2], 3) == 2
    end

    @testset "ビット全探索の組み合わせを取得" begin
        @test collect(IterTools.subsets([1])) |> sort == [[], [1]] |> sort
        @test collect(IterTools.subsets([1, 2])) |> sort == [[], [1], [2], [1, 2]] |> sort
        @test collect(IterTools.subsets([1, 2, 3])) |> sort ==
              [[], [1], [2], [3], [1, 2], [2, 3], [1, 3], [1, 2, 3]] |> sort
    end

    @testset "文字列をコードとして実行する" begin
        @test eval(Meta.parse("1 + 1")) == 2
    end
end
