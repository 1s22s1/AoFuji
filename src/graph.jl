module Graph
"""
    bfs(graph::Vector{}, start::Int)::Vector{}

startを始点として幅優先探索を行う。
"""
function bfs(graph::Vector{}, start::Int)::Vector{}
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
