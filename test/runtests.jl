module LatexWithPGFPlotsTests
using LatexWithPGFPlots
using PGFPlotsX
using IJulia
using Test
using Plots

@test MIME("text/pgf") in IJulia.ijulia_mime_types

@testset "PGFPlotsX integration" begin
    p = @pgf Axis()
    @test "text/pgf" in keys(IJulia.display_dict(p))

    p = @pgf TikzPicture(p)
    @test "text/pgf" in keys(IJulia.display_dict(p))

    p = @pgf TikzDocument(p)
    d = IJulia.display_dict(p)
    @test "text/pgf" in keys(d)
    @test !endswith(d["text/pgf"], "\\end{document}\n")
end

@testset "PGFPlots integration" begin
    p = PGFPlots.plot([1,2,3], [3,4,5])
    @test "text/pgf" in keys(IJulia.display_dict(p))
end

#= tests do not work because Plots and IJulia behave differently outside a
notebook

@testset "Plots integration" begin
    p = Plots.plot([1,3,4])
    d = Plots._ijulia_display_dict(p)
    @test "text/pgf" in keys(d)
    @test !endswith(d["text/pgf"], "\\end{document}\n")
end
=#

end
