module AoFuji

include("graph.jl")

"""
    rle(s::String)

arrを対象にして連長圧縮をする。
"""
function rle(arr::Union{Vector{Int}, String})
    result = []
    n = length(arr)

    i = 1
    while i < n + 1
        j = i

        while j < n + 1 && arr[i] == arr[j]
            j += 1
        end

        push!(result, [arr[i], j - i])
        i = j
    end

    return result
end

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
