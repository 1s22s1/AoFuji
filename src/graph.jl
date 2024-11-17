module Graph
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

    return seen
end
end
