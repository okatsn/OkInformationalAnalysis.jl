function se2sep(se::T) where {T<:AbstractFloat}
    one(T) / (2convert(T, π) * exp(one(T))) * exp(2se)
end
