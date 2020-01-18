module LatexWithPGFPlotsTests
using LatexWithPGFPlots
using PGFPlotsX
using IJulia
using Test

@test MIME("text/pgf") in IJulia.ijulia_mime_types

p = @pgf Axis()
@test "text/pgf" in keys(IJulia.display_dict(p))

p = @pgf TikzPicture(p)
@test "text/pgf" in keys(IJulia.display_dict(p))
end
