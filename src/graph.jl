module Graph
"""
    bfs(graph::Vector{Vector{Int64}}, starts::Vector{Int64})::Vector{Int64}

startsを始点として幅優先探索を行う。隣接リスト形式向け。
"""
function bfs(graph::Vector{Vector{Int64}}, starts::Vector{Int64})::Vector{Int64}
    seen = fill(-1, length(graph))

    queue = starts
    for start ∈ starts
        seen[start] = 0
    end

    while !isempty(queue)
        target_vertex = popfirst!(queue)

        for vertex ∈ graph[target_vertex]
            if seen[vertex] ≠ -1
                continue
            end

            push!(queue, vertex)
            seen[vertex] = seen[target_vertex] + 1
        end
    end

    return seen
end

"""
    maze_bfs(maze::Vector{Vector{SubString{String}}}, starts::Vector{Vector{Int64}})::Matrix{Int64}

startsを始点として幅優先探索を行う。AtCoder向け。
"""
function maze_bfs(maze::Vector{Vector{SubString{String}}}, starts::Vector{Vector{Int64}})::Matrix{Int64}
    h = length(maze)
    w = length(maze[begin])
    seen = fill(-1, h, w)

    queue = starts
    for start ∈ starts
        seen[start[begin], start[end]] = 0
    end

    while !isempty(queue)
        cur_pos = popfirst!(queue)

        for (x, y) ∈ [[1, 0], [-1, 0], [0, -1], [0, 1]]
            next_x = cur_pos[begin] + x
            next_y = cur_pos[end] + y

            if next_x ∈ 1:h && next_y ∈ 1:w && maze[next_x][next_y] == "." && seen[next_x, next_y] == -1
                push!(queue, [next_x, next_y])

                seen[next_x, next_y] = seen[cur_pos[begin], cur_pos[end]] + 1
            end
        end
    end

    return seen
end
end
