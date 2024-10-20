module AoFuji
function rle(s)
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

    return arr
end

function bfs(graph, start)
    nexts = [start]

    seen = fill(-1, length(graph))
    popcount = 0
    seen[start] = popcount

    while !isempty(nexts)
        target_vertex = popfirst!(nexts)
        popcount += 1

        for vertex ∈ graph[target_vertex]
            if seen[vertex] ≠ -1
                continue
            end

            push!(nexts, vertex)
            seen[vertex] = popcount
        end
    end

    return seen
end

end
