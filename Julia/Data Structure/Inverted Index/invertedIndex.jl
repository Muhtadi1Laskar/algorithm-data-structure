using DataStructures

function create_inverted_index(documents)
    index = DefaultDict{String, Set{Int}}()
    for (doc_id, document) in enumerate(documents)
        for word in split(document)
            push!(index[word], doc_id)
        end
    end
    return index
end

function search(index, query_terms)
    result = Set{Int}()
    for term in query_terms
        intersect!(result, index.get(term, Set{Int}()))
    end
    return result
end


documents = [
    "The quick brown fox jumps over the lazy dog",
    "The lazy dog slept",
]

inverted_index = create_inverted_index(documents)

query = ["lazy", "dog"]
result = search(inverted_index, query)
println(result) 