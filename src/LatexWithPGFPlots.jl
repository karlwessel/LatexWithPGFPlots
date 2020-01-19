module LatexWithPGFPlots
using PGFPlotsX
using IJulia

function __init__()
    IJulia.register_mime(MIME"text/pgf"())
end

Base.show(io::IO, ::MIME"text/pgf", p::PGFPlotsX._SHOWABLE) =
    print_tex(io, p, include_preamble=false)
Base.show(io::IO, ::MIME"text/pgf", p::PGFPlotsX.AxisLike) =
    print_tex(io, TikzPicture(p), include_preamble=false)

end # module
