module Algorithm
"""
    bitsearch(array::Vector{Int})::Vector{Vector{Int}}

ビット全探索の組み合わせを返す。
"""
function bitsearch(array::Vector{Int})::Vector{Vector{Int}}
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

"""
    rle(arr::Union{Vector{Int}, String})::Vector{Vector{Int}}

arrを対象にして連長圧縮をする。
"""
function rle(arr::Union{Vector{Int},String})::Vector{Vector{}}
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
end
