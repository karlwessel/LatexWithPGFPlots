module LatexWithPGFPlots
using PGFPlotsX
using IJulia

function __init__()
    IJulia.register_mime(MIME"text/pgf"())
end

Base.show(io::IO, ::MIME"text/pgf", p::PGFPlotsX._SHOWABLE) = print_tex(io, p)
Base.show(io::IO, ::MIME"text/pgf", p::PGFPlotsX.AxisLike) =
    print_tex(io, TikzPicture(p))

end # module
