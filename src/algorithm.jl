module Algorithm
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
end
