module AoFuji

"""
    rle(s::String)

Run length compression is performed for `s`.
"""
function rle(s::String)
    arr = []
    n = length(s)

    i = 1
    while i < n + 1
        j = i

        while j < n + 1 && s[i] == s[j]
            j += 1
        end

        push!(arr, (s[i], j - i))
        i = j
    end

    return arr::Vector{}
end

"""
    bfs(graph::Vector{}, start::Int)

Perform  breadth first search for adjacency list.
"""
function bfs(graph::Vector{}, start::Int)
    nexts = [start]

    seen = fill(-1, length(graph))
    seen[start] = 0

    while !isempty(nexts)
        target_vertex = popfirst!(nexts)

        for vertex ∈ graph[target_vertex]
            if seen[vertex] ≠ -1
                continue
            end

            push!(nexts, vertex)
            seen[vertex] = seen[target_vertex] + 1
        end
    end

    return seen::Vector{}
end

"""
    tally(array::Vector{})

Returns a hash containing the counts of equal elements.
"""
function tally(array::Vector{})
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
