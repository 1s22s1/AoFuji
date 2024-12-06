module Basic
"""
    tally(array::Union{Vector{Int}, String})::Dict

同じ要素をカウントして辞書型で返します。
"""
function tally(array::Union{Vector{Int},String})::Dict
    dict = Dict()

    for e ∈ array
        dict[e] = get(dict, e, 0) + 1
    end

    return dict
end

"""
    split_array(array::Vector{Int}, indexes::Vector{Int})::Vector{Vector{Int}}

インデックスで指定した位置で配列を分割する。
"""
function split_array(array::Vector{Int}, indexes::Vector{Int})::Vector{Vector{Int}}
    result = []

    if isempty(indexes)
        push!(result, array)

        return result
    end

    push!(result, array[begin:indexes[begin]])

    for i in 2:length(indexes)
        push!(result, array[indexes[i-1]+1:indexes[i]])
    end

    push!(result, array[indexes[end]+1:end])

    return result
end
end
