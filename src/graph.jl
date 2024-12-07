module Graph
"""
    bfs(graph::Vector{}, start::Int)::Vector{}

startを始点として幅優先探索を行う。隣接リスト形式向け。
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

"""
    maze_bfs(maze::Vector{Vector{String}}, start::Vector{})::Matrix{}

startを始点として幅優先探索を行う。AtCoder向け。
"""
function maze_bfs(maze::Vector{Vector{String}}, starts::Vector{})::Matrix{}
    h = length(maze)
    w = length(maze[begin])
    seen = fill(-1, h, w)

    nexts = deepcopy(starts)
    for start ∈ starts
        seen[start[begin], start[end]] = 0
    end

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
