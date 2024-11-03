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
    pop_count = 0
    seen[start] = pop_count

    while !isempty(nexts)
        target_vertex = popfirst!(nexts)
        pop_count += 1

        for vertex ∈ graph[target_vertex]
            if seen[vertex] ≠ -1
                continue
            end

            push!(nexts, vertex)
            seen[vertex] = pop_count
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

end
