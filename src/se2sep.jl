"""
    se2sep(se::T) where {T<:AbstractFloat}

Convert a standard error value `se` to standard error of prediction (sep).

This function computes the conversion using the formula: `exp(2se) / (2π * e)`,
maintaining the same floating-point type as the input.

# Arguments
- `se::AbstractFloat`: The input standard error value

# Returns
- The standard error of prediction (sep) with the same type as the input

# Examples
```julia
julia> se2sep(0.5)
0.0965735902799726

julia> se2sep(Float32(0.5))
0.096573584f0
```
"""
function se2sep(se::T) where {T<:AbstractFloat}
    one(T) / (2convert(T, π) * exp(one(T))) * exp(2se)
end

se2sep(::Missing) = missing
