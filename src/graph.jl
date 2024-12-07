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

function maze_bfs(maze, h, w)
    seen = fill(-1, 3, 4)

    nexts = [[1, 1]]
    seen[1, 1] = 0

    while !isempty(nexts)
        cur_pos = popfirst!(nexts)

        for (x, y) ∈ [[1, 0], [-1, 0], [0, -1], [0, 1]]
            next_x = cur_pos[begin] + x
            next_y = cur_pos[end] + y

            if 1 ≤ next_x ≤ h && 1 ≤ next_y ≤ w && maze[next_x][next_y] == "." && seen[next_x, next_y] == -1
                push!(nexts, [next_x, next_y])

                seen[next_x, next_y] = seen[cur_pos[begin], cur_pos[end]] + 1
            end
        end
    end

    return seen
end
end
