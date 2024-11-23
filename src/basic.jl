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
end
