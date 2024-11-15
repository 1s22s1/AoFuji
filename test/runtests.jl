using AoFuji
using Test

@testset "AoFuji.jl" verbose = true begin
    include("algorithm.jl")
    include("graph.jl")
    include("misc.jl")
end
