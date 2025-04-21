@testset "se2sep tests" begin
    # exact‐value tests
    @test se2sep(0.0) ≈ 1 / (2 * pi * exp(1))
    @test se2sep(1.0) ≈ exp(2) / (2 * pi * exp(1))
    @test se2sep(-0.5) ≈ exp(-1) / (2 * pi * exp(1))

    # type stability
    y32 = se2sep(Float32(0.5))
    @test isa(y32, Float32)

    # a deterministic value
    val = 2.3
    expected = exp(2 * val) / (2 * pi * exp(1))
    @test isapprox(se2sep(val), expected; atol=1e-12, rtol=1e-12)

    # randomised checks over several points
    for se in rand(5) * 3 .- 1      # se ∈ [-1,2)
        expct = exp(2 * se) / (2 * pi * exp(1))
        @test isapprox(se2sep(se), expct; atol=1e-12, rtol=1e-12)
    end
end
