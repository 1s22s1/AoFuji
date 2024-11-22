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

"""
    bitsearch(array::Vector{})

Returns bit patterns.
"""
function bitsearch(array::Vector{})
    n = length(array)

    s = []
    for bit ∈ 0:(1<<n)-1
        t = []

        for i ∈ 0:n-1
            if bit & 1 << i ≠ 0
                push!(t, array[i+1])
            end
        end

        push!(s, t)
    end

    return s
end
end
