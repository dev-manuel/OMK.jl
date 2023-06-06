using Pkg




@info "Developing sub-packages"
subPkgs = joinpath.(
  pwd(),
  [
    "ImmutableList.jl",
    "MetaModelica.jl",
    "MKAbsyn.jl",
    "OMKParser.jl",
    "OM.jl"
  ])


for pkg in subPkgs
  Pkg.develop(path=pkg)
end

@info "Developing OMK.jl"
@time Pkg.develop(path=pwd())

@info "The parser needs some external libraries. Build OM"
@time Pkg.build("OM")

@info "The parser needs some external libraries. Build the parser"
@time Pkg.build("OMKParser")

@info "Installing auxilary dependencies"
@time Pkg.add("Revise")