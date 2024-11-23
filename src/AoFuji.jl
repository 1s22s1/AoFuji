module AoFuji

include("algorithm.jl")
include("graph.jl")

"""
    tally(array::Union{Vector{Int}, String})

Returns a hash containing the counts of equal elements.
"""
function tally(array::Union{Vector{Int}, String})
    dict = Dict()

    for e ∈ array
        dict[e] = get(dict, e, 0) + 1
    end

    return dict
end
end
